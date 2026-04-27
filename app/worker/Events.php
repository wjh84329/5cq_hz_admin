<?php
namespace app\worker;

use GatewayWorker\Lib\Gateway;
use think\facade\Cache;
use think\facade\Db;
use Workerman\Lib\Timer;

class Events
{
    /**
     * 存储 5cq 连接映射，key 为 open_id
     *
     * @var array
     */
    public static $cqConnections = [];

    /**
     * 存储连接的登录态，key 为 client_id
     *
     * @var array
     */
    public static $clientSessions = [];

    /**
     * 全局消息推送定时器是否已启动
     *
     * @var bool
     */
    protected static $cqMessageTimerStarted = false;

    public static function onWorkerStart($businessWorker)
    {
        self::$cqConnections = [];
        self::$clientSessions = [];
        self::$cqMessageTimerStarted = false;

        if (!defined('HEARTBEAT_TIME')) {
            define('HEARTBEAT_TIME', 55);
        }

        self::startCqMessageTimer();
    }

    public static function onConnect($client_id)
    {
        // 连接由 GatewayWorker 管理，这里不额外处理。
    }

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

            case 'pong':
            case 'heartbeat':
                self::handleHeartbeat($client_id);
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
                self::handle5cqClientLogin($client_id, $payload);
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

    public static function onClose($client_id)
    {
        foreach (self::$cqConnections as $openId => $cid) {
            if ($cid === $client_id) {
                unset(self::$cqConnections[$openId]);
                break;
            }
        }

        unset(self::$clientSessions[$client_id]);
    }

    private static function startCqMessageTimer()
    {
        if (self::$cqMessageTimerStarted) {
            return;
        }

        self::$cqMessageTimerStarted = true;

        Timer::add(rand(1, 5), function () {
            foreach (self::$cqConnections as $openId => $client_id) {
                if (Gateway::isOnline($client_id)) {
                    self::sendLatestCoinRandomList($client_id);
                    continue;
                }

                unset(self::$cqConnections[$openId], self::$clientSessions[$client_id]);
            }
        });
    }

    private static function handle5cqClientLogin($client_id, array $payload)
    {
        $openId = trim((string)($payload['open_id'] ?? ''));
        $token  = trim((string)($payload['token'] ?? ''));

        if ($openId === '' || $token === '') {
            self::sendJson($client_id, [
                'code' => 0,
                'type' => 'logout',
                'msg'  => 'open_id或token不能为空',
            ]);
            return;
        }

        if (!self::checkToken($openId, $token)) {
            self::sendJson($client_id, ['code' => 200, 'type' => 'logout']);
            return;
        }

        $payload['open_id'] = $openId;
        $payload['token'] = $token;

        self::registerClientSession($client_id, $openId, $token, true);
        self::$cqConnections[$openId] = $client_id;

        self::handle5cqLogin($client_id, $payload, 0);
        self::sendLatestCoinRandomList($client_id);
    }

    private static function sendLatestCoinRandomList($client_id)
    {
        if (!Gateway::isOnline($client_id)) {
            return;
        }

        $rows = Db::table('user_log')->order('id desc')->limit(10)->select()->toArray();
        if (empty($rows)) {
            return;
        }

        $rows = array_reverse($rows);
        $result = [];
        foreach ($rows as $k => $v) {
            $result[$k] = $v['log'];
        }

        try {
            self::sendJson($client_id, [
                'type' => 'latest_coin_random_list',
                'rows' => $result,
            ]);
        } catch (\Throwable $e) {
            Gateway::closeClient($client_id);
        }
    }

    private static function checkTaskGranted($openId)
    {
        $undoneNum = 6;

        $typeArr = ['白银宝箱', '黄金宝箱', '铂金宝箱', '钻石宝箱', '浏览游戏'];
        foreach ($typeArr as $fs) {
            $info = Db::table('coin_info')
                ->where('open_id', $openId)
                ->where('fs', $fs)
                ->whereTime('updata_time', 'today')
                ->findOrEmpty();
            if (!empty($info)) {
                $undoneNum--;
            }
        }

        $list = Db::table('coin_info')
            ->where('open_id', $openId)
            ->where('fs', '网页分享得金币')
            ->whereTime('updata_time', 'today')
            ->select();
        if (count($list) >= 10) {
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

    private static function registerClientSession($client_id, $openId, $token, $trackTime = false)
    {
        Gateway::bindUid($client_id, $openId);

        self::$clientSessions[$client_id] = [
            'open_id'        => (string)$openId,
            'token'          => (string)$token,
            'track_time'     => (bool)$trackTime,
            'last_heartbeat' => time(),
        ];
    }

    private static function handleHeartbeat($client_id)
    {
        if (!isset(self::$clientSessions[$client_id])) {
            return;
        }

        $session = self::$clientSessions[$client_id];
        $openId = (string)($session['open_id'] ?? '');
        $token = (string)($session['token'] ?? '');
        if ($openId === '' || $token === '') {
            return;
        }

        if (!self::checkToken($openId, $token)) {
            self::sendJson($client_id, ['code' => 200, 'type' => 'logout']);
            Gateway::closeClient($client_id);
            return;
        }

        $now = time();
        $lastHeartbeat = (int)($session['last_heartbeat'] ?? $now);
        self::$clientSessions[$client_id]['last_heartbeat'] = $now;

        if (!empty($session['track_time'])) {
            $seconds = max(0, min($now - $lastHeartbeat, HEARTBEAT_TIME));
            if ($seconds > 0) {
                self::updateUserTimeCount($openId, $seconds);
            }
        }
    }

    private static function normalizeTimeCount(array $info, $count)
    {
        $timeCount = isset($info['time_count']) ? (int)$info['time_count'] : 0;
        $timeCountDate = isset($info['time_count_date']) ? (int)$info['time_count_date'] : (int)date('j');

        if ((int)date('j') !== $timeCountDate) {
            $timeCount = 0;
            $timeCountDate = (int)date('j');
        }

        if ($timeCount < 240 * 60) {
            $timeCount += (int)$count;
            if ($timeCount > 240 * 60) {
                $timeCount = 240 * 60;
            }
        }

        return [$timeCount, $timeCountDate];
    }

    private static function updateUserTimeCount($openId, $count)
    {
        $user = Db::table('ul_order_user')
            ->field('time_count,time_count_date')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            return;
        }

        [$timeCount, $timeCountDate] = self::normalizeTimeCount($user, $count);

        Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->update([
                'time_count'      => $timeCount,
                'time_count_date' => $timeCountDate,
            ]);
    }

    public static function handle5cqLogin($client_id, array $payload, $count)
    {
        $openId = $payload['open_id'];
        $info = Db::table('ul_order_user')->where('open_id', $openId)->find();
        if (!$info) {
            return self::sendJson($client_id, ['code' => 0, 'type' => $payload['type'], 'msg' => '用户不存在']);
        }

        if ((int)$info['state'] === 1) {
            return self::sendJson($client_id, ['code' => 0, 'type' => $payload['type'], 'msg' => '账户已被封禁']);
        }

        $sum1 = Db::table('yxsc')->where('open_id', $openId)->sum('yxsc');
        $sum2 = Db::table('yxsc')->where('open_id', $openId)->sum('hf_sc');
        $sum  = $sum1 + $sum2;

        $todaynum1 = Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $openId)
            ->whereTime('update_time', 'today')
            ->sum('yxsc');
        $todaynum2 = Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $openId)
            ->whereTime('update_time', 'today')
            ->sum('hf_sc');
        $todayTotal = $todaynum1 + $todaynum2;

        $info['yxsc'] = (string)$todayTotal;
        $info['hf_sc'] = (string)$sum2;
        $info['total_yxsc'] = (string)$sum;

        [$timeCount, $timeCountDate] = self::normalizeTimeCount($info, $count);

        $levelInfoList = Db::table('ul_user_level')->select();
        $info['undone_num'] = self::checkTaskGranted($openId);

        Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->update([
                'time_count'      => $timeCount,
                'time_count_date' => $timeCountDate,
            ]);

        return self::sendJson($client_id, [
            'code'          => 200,
            'type'          => $payload['type'],
            'msg'           => '用户信息',
            'levelInfoList' => $levelInfoList,
            'data'          => $info,
        ]);
    }

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

        Cache::store('redis')->set('user_' . $openId, $token, 3600);
        self::registerClientSession($client_id, $openId, $token);

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
        $todaynum1 = Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $openId)
            ->whereTime('update_time', 'today')
            ->sum('yxsc');
        $todaynum2 = Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $openId)
            ->whereTime('update_time', 'today')
            ->sum('hf_sc');
        $todayTotal = $todaynum1 + $todaynum2;

        self::sendJson($client_id, [
            'type' => 'get_user_all_yxsc',
            'code' => 200,
            'msg'  => '成功',
            'data' => [
                'open_id'    => $openId,
                'yxsc'       => (string)$todayTotal,
                'hf_sc'      => (string)$sum2,
                'total_yxsc' => (string)$sum,
            ],
        ]);
    }

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

    protected static function sendJson($client_id, array $data)
    {
        Gateway::sendToClient($client_id, json_encode($data, JSON_UNESCAPED_UNICODE));
    }

    public static function sendMessageByUid($uid, $message)
    {
        $uid = trim((string)$uid);
        if ($uid === '') {
            return false;
        }

        Gateway::sendToUid($uid, $message);
        return true;
    }

    public static function broadcastLatestLog()
    {
        $rows = Db::table('user_log')->order('id desc')->limit(10)->select()->toArray();
        if (empty($rows)) {
            return;
        }

        $rows = array_reverse($rows);
        $result = [];
        foreach ($rows as $k => $v) {
            $result[$k] = $v['log'];
        }

        $message = json_encode([
            'type' => 'latest_coin_random_list',
            'rows' => $result,
        ], JSON_UNESCAPED_UNICODE);

        Gateway::sendToAll($message);
    }

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
