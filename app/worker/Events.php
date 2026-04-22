<?php
namespace app\worker;

use GatewayWorker\Lib\Gateway;
use think\facade\Cache;
use think\facade\Db;
use Workerman\Lib\Timer;
use Workerman\Connection\TcpConnection;

class Events
{
    /**
     * 存储5cq连接的map，key为open_id
     *
     * @var array
     */
    public static $cqConnections = [];

    /**
     * 存储客户端定时器，key为client_id
     *
     * @var array
     */
    public static $clientIdTimers = [];

    /**
     * 当worker进程启动时触发
     */
    public static function onWorkerStart($businessWorker)
    {
        // 初始化5cq连接map
        self::$cqConnections = [];

        if (!defined('HEARTBEAT_TIME')) {
            define('HEARTBEAT_TIME', 55);
        }

        // 定期向5cq连接发送信息
        self::startCqMessageTimer();
    }

    /**
     * 当客户端连接时触发
     */
    public static function onConnect($client_id)
    {
        // GatewayWorker 自动管理连接，无需手动处理
    }

    /**
     * 当客户端发送消息时触发
     */
    public static function onMessage($client_id, $message)
    {
        $payload = json_decode($message, true);
        if (!is_array($payload)) {
            self::sendJson($client_id, [
                'type' => 'error',
                'code' => 0,
                'msg'  => '消息格式错误，必须是JSON',
            ]);
            return;
        }

        $type = trim((string)($payload['type'] ?? ''));

        switch ($type) {
            case 'ping':
                self::sendJson($client_id, [
                    'type' => 'pong',
                    'code' => 200,
                    'msg'  => 'ok',
                    'time' => time(),
                ]);
                return;

            case 'login':
                self::handleLogin($client_id, $payload);
                return;

            case 'get_user_info':
                self::handleGetUserInfo($client_id);
                return;

            case 'get_user_all_yxsc':
                self::handleGetUserAllYxsc($client_id);
                return;

            case 'business_operation':
                self::handleBusinessOperation($client_id);
                return;

            case '5cq_login':
                $openId = isset($payload['open_id']) ? $payload['open_id'] : '';
                $token  = isset($payload['token']) ? $payload['token'] : '';
                if ($openId === '' || $token === '') {
                    self::sendJson($client_id, [
                        'code' => 0,
                        'type' => 'logout',
                        'msg'  => 'open_id或token不能为空',
                    ]);
                    return;
                }
                if (!self::checkToken($openId, $token)) {
                    self::sendJson($client_id, ['code'=>200, 'type'=>'logout']);
                    return;
                }
                $payload['open_id'] = $openId;
                $payload['token'] = $token;
                self::handle5cqLogin($client_id, $payload, 0);
                self::sendLatestCoinRandomList($client_id);
                // 将连接添加到5cq连接map中
                self::$cqConnections[$openId] = $client_id;
                // 每隔5秒发送一次登录信息
                if (!isset(self::$clientIdTimers[$client_id])) {
                    self::$clientIdTimers[$client_id] = Timer::add(5, function () use ($client_id, $payload) {
                        $openId = isset($payload['open_id']) ? $payload['open_id'] : '';
                        $token  = isset($payload['token']) ? $payload['token'] : '';
                        $checkResult = self::checkToken($openId, $token);

                        // 检查连接是否仍然有效
                        if (!Gateway::isOnline($client_id)) {
                            // 连接已关闭，清除定时器
                            if (isset(self::$clientIdTimers[$client_id])) {
                                Timer::del(self::$clientIdTimers[$client_id]);
                                unset(self::$clientIdTimers[$client_id]);
                            }
                            return;
                        }

                        if (!$checkResult) {
                            self::sendJson($client_id, ['code'=>200, 'type'=>'logout']);
                            // 先清除定时器，再关闭连接
                            if (isset(self::$clientIdTimers[$client_id])) {
                                Timer::del(self::$clientIdTimers[$client_id]);
                                unset(self::$clientIdTimers[$client_id]);
                            }
                            Gateway::closeClient($client_id);
                            return;
                        }

                        // 安全执行登录信息发送
                        self::handle5cqLogin($client_id, $payload, 5);
                    });
                }
                return;

            default:
                self::sendJson($client_id, [
                    'type' => $type === '' ? 'unknown' : $type,
                    'code' => 0,
                    'msg'  => '未知消息类型',
                    'data' => $payload,
                ]);
                return;
        }
    }

    /**
     * 当客户端断开连接时触发
     */
    public static function onClose($client_id)
    {
        // 从5cq连接map中移除
        foreach (self::$cqConnections as $openId => $cid) {
            if ($cid === $client_id) {
                unset(self::$cqConnections[$openId]);
                break;
            }
        }

        // 清除登录定时器
        if (isset(self::$clientIdTimers[$client_id])) {
            Timer::del(self::$clientIdTimers[$client_id]);
            unset(self::$clientIdTimers[$client_id]);
        }
    }

    /**
     * 启动5cq消息定时器
     */
    private static function startCqMessageTimer()
    {
        // 生成1-5秒的随机间隔
        $interval = rand(1, 5);

        Timer::add($interval, function () {
            // 向所有5cq连接发送信息
            foreach (self::$cqConnections as $openId => $client_id) {
                if (Gateway::isOnline($client_id)) {
                    self::sendLatestCoinRandomList($client_id);
                }
            }

            // 重新设置定时器，使用新的随机间隔
            self::startCqMessageTimer();
        }, [], false);
    }

    private static function sendLatestCoinRandomList($client_id)
    {
        // 检查连接状态
        if (!Gateway::isOnline($client_id)) {
            return;
        }

        // 获取 user_log 表最新10条记录
        $rows = Db::table('user_log')->order('id desc')->limit(10)->select()->toArray();
        if (empty($rows)) {
            return;
        }

        // 反转数组使其按时间升序排列（最新的在最后）
        $rows = array_reverse($rows);
        $result = [];
        foreach ($rows as $k => $v) {
            $result[$k] = $v['log'];
        }

        // 主动推送最新消息给用户
        try {
            self::sendJson($client_id, [
                'type' => 'latest_coin_random_list',
                'rows' => $result,
            ]);
        } catch (\Exception $e) {
            // 发送失败，关闭连接
            Gateway::closeClient($client_id);
        }
    }

    private static function checkTaskGranted($openId)
    {
        $undoneNum = 6;

        $typeArr = ['白银宝箱','黄金宝箱','铂金宝箱','钻石宝箱','浏览游戏'];
        foreach ($typeArr as $k => $v) {
            $fs = $v;
            $info = Db::table('coin_info')->where('open_id',$openId)->where('fs', $fs)->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $undoneNum--;
            }
        }
        $list = Db::table('coin_info')->where('open_id',$openId)->where('fs','网页分享得金币')->whereTime('updata_time','today')->select();
        if(count($list) >= 10){
            $undoneNum--;
        }

        return $undoneNum;
    }

    private static function checkToken($openId, $token)
    {
        $cachedToken = Cache::store('redis')->get('user_' . $openId);
        if ($cachedToken === $token) {
            Cache::store('redis')->set('user_' . $openId, $token, 3600);
            return true;
        }
        return false;
    }

    public static function handle5cqLogin($client_id, array $payload, $count)
    {
        $openId = $payload['open_id'];
        $info = Db::table('ul_order_user')->where('open_id',$openId)->find();
        if($info['state'] == 1){
            return self::sendJson($client_id, ['code'=>0, 'type'=>$payload['type'], 'msg'=>'账户已被封禁']);
        }

        $sum1 = Db::table('yxsc')->where('open_id', $openId)->sum('yxsc');
        $sum2 = Db::table('yxsc')->where('open_id', $openId)->sum('hf_sc');
        $sum  = $sum1 + $sum2;

        $todaynum1 = Db::table('yxsc')->where('source','add_game_time')->where('open_id', $openId)->whereTime('update_time','today')->sum('yxsc');
        $todaynum2 = Db::table('yxsc')->where('source','add_game_time')->where('open_id', $openId)->whereTime('update_time','today')->sum('hf_sc');
        $todayTotal  = $todaynum1 + $todaynum2;
        $info['yxsc'] = (string)$todayTotal;
        $info['hf_sc'] = (string)$sum2;
        $info['total_yxsc'] = (string)$sum;

        $time_count = $info['time_count'];
        $time_count_date = $info['time_count_date'];
        if ($time_count == null) {
            $time_count = 0;
        }
        if ($time_count_date == null) {
            $time_count_date = (int)date('j');
        }
        if ((int)date('j') != $time_count_date) {
            $time_count = 0;
            $time_count_date = (int)date('j');
        }

        if ($time_count < 240 * 60) {
            $time_count += $count;
        }

        $levelInfoList = Db::table('ul_user_level')->select();

        $info['undone_num'] = self::checkTaskGranted($openId);

        Db::table('ul_order_user')->where('open_id',$payload['open_id'])
            ->update(['time_count'=>$time_count, 'time_count_date'=>$time_count_date]);
        return self::sendJson($client_id, ['code'=>200, 'type'=>$payload['type'], 'msg'=>'用户信息',
            'levelInfoList'=>$levelInfoList, 'data'=>$info]);
    }

    /**
     * 处理登录
     */
    protected static function handleLogin($client_id, array $payload)
    {
        $openId = trim((string)($payload['open_id'] ?? ''));
        $token  = trim((string)($payload['token'] ?? ''));

        if ($openId === '' || $token === '') {
            self::sendJson($client_id, [
                'type' => 'login',
                'code' => 0,
                'msg'  => 'open_id或token不能为空',
            ]);
            return;
        }

        $cachedToken = Cache::store('redis')->get('user_' . $openId);
        if ($cachedToken !== $token) {
            self::sendJson($client_id, [
                'type' => 'login',
                'code' => 0,
                'msg'  => '登录已失效，请重新登录',
            ]);
            return;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,nickname,avatar,lv,coin_num,state')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            self::sendJson($client_id, [
                'type' => 'login',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            self::sendJson($client_id, [
                'type' => 'login',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }

        // 绑定 uid
        Gateway::bindUid($client_id, $openId);

        // 延长 token 有效期
        Cache::store('redis')->set('user_' . $openId, $token, 3600);

        self::sendJson($client_id, [
            'type' => 'login',
            'code' => 200,
            'msg'  => '登录成功',
            'data' => [
                'open_id'  => (string)$user['open_id'],
                'nickname' => (string)($user['nickname'] ?? ''),
                'avatar'   => (string)($user['avatar'] ?? ''),
                'lv'       => (string)($user['lv'] ?? ''),
                'coin_num' => (string)($user['coin_num'] ?? '0'),
            ],
        ]);
    }

    /**
     * 获取当前连接对应用户的信息
     */
    protected static function handleGetUserInfo($client_id)
    {
        $uid = Gateway::getUidByClientId($client_id);
        if (!$uid) {
            self::sendJson($client_id, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '请先登录',
            ]);
            return;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,name,nickname,avatar,phone,lv,coin_num,money,sign,is_online,state')
            ->where('open_id', $uid)
            ->find();

        if (!$user) {
            self::sendJson($client_id, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            self::sendJson($client_id, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }

        // 获取当前登录用户的token并续费
        $token = Cache::store('redis')->get('user_' . $user['open_id']);
        if ($token) {
            Cache::store('redis')->set('user_' . $user['open_id'], $token, 3600);
        }

        self::sendJson($client_id, [
            'type' => 'get_user_info',
            'code' => 200,
            'msg'  => '成功',
            'data' => [
                'id'        => (int)$user['id'],
                'open_id'   => (string)$user['open_id'],
                'name'      => (string)($user['name'] ?? ''),
                'nickname'  => (string)($user['nickname'] ?? ''),
                'avatar'    => (string)($user['avatar'] ?? ''),
                'phone'     => (string)($user['phone'] ?? ''),
                'lv'        => (string)($user['lv'] ?? ''),
                'coin_num'  => (string)($user['coin_num'] ?? '0'),
                'money'     => (string)($user['money'] ?? '0'),
                'sign'      => (string)($user['sign'] ?? ''),
                'is_online' => (int)($user['is_online'] ?? 0),
            ],
        ]);
    }

    /**
     * 获取当前登录用户总游戏时长
     */
    protected static function handleGetUserAllYxsc($client_id)
    {
        $uid = Gateway::getUidByClientId($client_id);
        if (!$uid) {
            self::sendJson($client_id, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '请先登录',
            ]);
            return;
        }

        $openId = $uid;

        $user = Db::table('ul_order_user')
            ->field('open_id,state')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            self::sendJson($client_id, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            self::sendJson($client_id, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }

        $sum1 = Db::table('yxsc')->where('open_id', $openId)->sum('yxsc');
        $sum2 = Db::table('yxsc')->where('open_id', $openId)->sum('hf_sc');
        $sum  = $sum1 + $sum2;
        $todaynum1 = Db::table('yxsc')->where('source','add_game_time')->where('open_id', $openId)->whereTime('update_time','today')->sum('yxsc');
        $todaynum2 = Db::table('yxsc')->where('source','add_game_time')->where('open_id', $openId)->whereTime('update_time','today')->sum('hf_sc');
        $todayTotal  = $todaynum1 + $todaynum2;

        self::sendJson($client_id, [
            'type' => 'get_user_all_yxsc',
            'code' => 200,
            'msg'  => '成功',
            'data' => [
                'open_id'   => $openId,
                'yxsc'      => (string)$todayTotal,
                'hf_sc'     => (string)$sum2,
                'total_yxsc'=> (string)$sum,
            ],
        ]);
    }

    /**
     * 获取运营参数配置
     */
    protected static function handleBusinessOperation($client_id)
    {
        $list = Db::table('operation')->find(1);

        if (!$list) {
            self::sendJson($client_id, [
                'type' => 'business_operation',
                'code' => 0,
                'msg'  => '运营配置不存在',
            ]);
            return;
        }

        $list1 = Db::table('hb')
            ->where('type', 0)
            ->whereTime('updata_time', 'today')
            ->select()
            ->toArray();

        foreach ($list1 as $k1 => $v1) {
            $time = date('Y-m-d', strtotime($list1[$k1]['updata_time']));
            $dateTime = strtotime($time . ' 23:59:59');

            $list1[$k1]['count'] = Db::table('coin_info')
                ->where('hb_id', $v1['id'])
                ->count();

            $list1[$k1]['endTime'] = date('Y-m-d H:i:s', $dateTime);
        }

        $list2 = Db::table('hb')
            ->where('type', 1)
            ->select()
            ->toArray();

        foreach ($list2 as $k => $v) {
            $list2[$k]['count'] = Db::table('coin_info')
                ->where('hb_id', $v['id'])
                ->count();

            if ((int)$list2[$k]['count'] >= (int)$list2[$k]['num']) {
                unset($list2[$k]);
            }
        }

        $lists = array_merge($list1, array_values($list2));
        $list['hb_num'] = count($lists);

        self::sendJson($client_id, [
            'type' => 'business_operation',
            'code' => 200,
            'msg'  => '运营参数配置',
            'data' => $list,
        ]);
    }

    /**
     * 统一发送 JSON
     */
    protected static function sendJson($client_id, array $data)
    {
        Gateway::sendToClient($client_id, json_encode($data, JSON_UNESCAPED_UNICODE));
    }

    /**
     * 针对 uid 推送数据
     */
    public static function sendMessageByUid($uid, $message)
    {
        $uid = trim((string)$uid);
        if ($uid === '') {
            return false;
        }

        Gateway::sendToUid($uid, $message);
        return true;
    }

    /**
     * 广播最新日志给所有在线用户
     */
    public static function broadcastLatestLog()
    {
        // 获取 user_log 表最新10条记录
        $rows = Db::table('user_log')->order('id desc')->limit(10)->select()->toArray();
        if (empty($rows)) {
            return;
        }

        // 反转数组使其按时间升序排列（最新的在最后）
        $rows = array_reverse($rows);
        $result = [];
        foreach ($rows as $k => $v) {
            $result[$k] = $v['log'];
        }

        $message = json_encode([
            'type' => 'latest_coin_random_list',
            'rows' => $result,
        ], JSON_UNESCAPED_UNICODE);

        // 广播给所有在线用户
        Gateway::sendToAll($message);
    }

    /**
     * 推送用户信息更新给指定用户
     * 
     * @param string $open_id
     */
    public static function sendUserInfoUpdate($open_id)
    {
        $open_id = trim((string)$open_id);
        if ($open_id === '') {
            return;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,nickname,avatar,lv,coin_num,money,sign,is_online,state')
            ->where('open_id', $open_id)
            ->find();

        if (!$user) {
            return;
        }

        $message = json_encode([
            'type' => 'user_info_updated',
            'code' => 200,
            'msg'  => '用户信息已更新',
            'data' => $user,
        ], JSON_UNESCAPED_UNICODE);

        Gateway::sendToUid($open_id, $message);
    }
}
