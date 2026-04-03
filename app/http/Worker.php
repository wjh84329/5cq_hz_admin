<?php
namespace app\http;

use think\facade\Cache;
use think\facade\Db;
use think\worker\Server;
use Workerman\Lib\Timer;
use Workerman\Worker as W;

class Worker extends Server
{
    protected $socket = 'websocket://0.0.0.0:8215';

    /**
     * 主 websocket worker 实例
     *
     * @var W|null
     */
    protected $wsWorker = null;

    /**
     * 存储5cq连接的map，key为open_id
     *
     * @var array
     */
    protected $cqConnections = [];

    /**
     * 每个进程启动
     *
     * @param W $worker
     */
    public function onWorkerStart($worker)
    {
        $this->wsWorker = $worker;

        if (!isset($this->wsWorker->uidConnections) || !is_array($this->wsWorker->uidConnections)) {
            $this->wsWorker->uidConnections = [];
        }
        
        // 初始化5cq连接map
        $this->cqConnections = [];

        // 内部推送端口只在一个进程中监听，避免端口重复占用
        if ((int)$worker->id === 0) {
            $innerTextWorker = new W('Text://0.0.0.0:5678');
            $innerTextWorker->onMessage = function ($connection, $buffer) {
                $data = json_decode($buffer, true);

                if (!is_array($data)) {
                    $connection->send(json_encode([
                        'error' => 1,
                        'msg'   => '消息格式错误，必须是JSON',
                    ], JSON_UNESCAPED_UNICODE));
                    return;
                }

                $uid = trim((string)($data['uid'] ?? ''));
                $message = isset($data['message']) ? $data['message'] : $buffer;

                if ($uid === '') {
                    $connection->send(json_encode([
                        'error' => 1,
                        'msg'   => 'uid不能为空',
                    ], JSON_UNESCAPED_UNICODE));
                    return;
                }

                if (is_array($message)) {
                    $message = json_encode($message, JSON_UNESCAPED_UNICODE);
                } else {
                    $message = (string)$message;
                }

                $ret = $this->sendMessageByUid($uid, $message);

                $connection->send(json_encode([
                    'error' => $ret ? 0 : 1,
                    'msg'   => $ret ? 'ok' : '用户不在线或连接不存在',
                ], JSON_UNESCAPED_UNICODE));
            };
            $innerTextWorker->listen();
        }

        if (!defined('HEARTBEAT_TIME')) {
            define('HEARTBEAT_TIME', 55);
        }

        Timer::add(1, function () use ($worker) {
            $timeNow = time();

            foreach ($worker->connections as $connection) {
                if (empty($connection->lastMessageTime)) {
                    $connection->lastMessageTime = $timeNow;
                    continue;
                }

                if ($timeNow - $connection->lastMessageTime > HEARTBEAT_TIME) {
                    $connection->close();
                }
            }
        });
        
        // 定期向5cq连接发送信息
        $this->startCqMessageTimer();
    }

    public function onMessage($connection, $data)
    {
        $connection->lastMessageTime = time();

        $payload = json_decode($data, true);
        if (!is_array($payload)) {
            $this->sendJson($connection, [
                'type' => 'error',
                'code' => 0,
                'msg'  => '消息格式错误，必须是JSON',
            ]);
            return;
        }

        $type = trim((string)($payload['type'] ?? ''));

        switch ($type) {
            case 'ping':
                $this->sendJson($connection, [
                    'type' => 'pong',
                    'code' => 200,
                    'msg'  => 'ok',
                    'time' => time(),
                ]);
                return;

            case 'login':
                $this->handleLogin($connection, $payload);
                return;

            case 'get_user_info':
                $this->handleGetUserInfo($connection);
                return;
            
            case 'get_user_all_yxsc':
                $this->handleGetUserAllYxsc($connection);
                return;

            case 'business_operation':
                $this->handleBusinessOperation($connection);
                return;

            case '5cq_login':
                if (!$this->checkToken($payload['open_id'], $payload['token'])) {
                    return;
                }
                $this->handle5cqLogin($connection, $payload, 0);
                
                // 将连接添加到5cq连接map中
                $openId = $payload['open_id'];
                $this->cqConnections[$openId] = $connection;
                
                // 每隔5秒发送一次登录信息
                if (!isset($connection->loginTimerId)) {
                    $connection->loginTimerId = Timer::add(5, function () use ($connection, $payload) {
                        // 检查连接是否仍然有效
                        if (property_exists($connection, 'closed') && $connection->closed) {
                            // 连接已关闭，清除定时器
                            if (isset($connection->loginTimerId)) {
                                Timer::del($connection->loginTimerId);
                                unset($connection->loginTimerId);
                            }
                            return;
                        }
                        
                        // 安全执行登录信息发送
                        $this->handle5cqLogin($connection, $payload, 5);
                    });
                }
                return;


            default:
                $this->sendJson($connection, [
                    'type' => $type === '' ? 'unknown' : $type,
                    'code' => 0,
                    'msg'  => '未知消息类型',
                    'data' => $payload,
                ]);
                return;
        }
    }

    public function onConnect($connection)
    {
        $connection->lastMessageTime = time();
    }

    /**
     * 当连接断开时触发的回调函数
     *
     * @param mixed $connection
     */
    public function onClose($connection)
    {
        if (isset($connection->uid) && $connection->uid !== '') {
            unset($this->wsWorker->uidConnections[$connection->uid]);
        }
        
        // 从5cq连接map中移除
        foreach ($this->cqConnections as $openId => $conn) {
            if ($conn === $connection) {
                unset($this->cqConnections[$openId]);
                break;
            }
        }
        
        // 清除登录定时器
        if (isset($connection->loginTimerId)) {
            Timer::del($connection->loginTimerId);
            unset($connection->loginTimerId);
        }
    }

    /**
     * 当客户端的连接上发生错误时触发
     *
     * @param mixed $connection
     * @param int $code
     * @param string $msg
     */
    public function onError($connection, $code, $msg)
    {
        echo "error {$code} {$msg}\n";
    }
    
    /**
     * 启动5cq消息定时器
     */
    private function startCqMessageTimer()
    {
        // 生成1-5秒的随机间隔
        $interval = rand(1, 5);
        $that = $this;
        
        Timer::add($interval, function () use ($that) {
            // 向所有5cq连接发送信息
            foreach ($that->cqConnections as $openId => $connection) {
                // 检查连接是否仍然有效
                if (property_exists($connection, 'closed') && $connection->closed) {
                    // 连接已关闭，从map中移除
                    unset($that->cqConnections[$openId]);
                    continue;
                }

                $that->sendLatestCoinRandomList($connection, $that);
            }
            
            // 重新设置定时器，使用新的随机间隔
            $that->startCqMessageTimer();
        }, [], false);
    }

    private function sendLatestCoinRandomList($connection, $that)
    {
        // 先取最新100条
        $rows = Db::table('coin_info')->where('coin_num',">",0)->order('id desc')->limit(100)->select()->toArray();
        if (empty($rows)) {
            return ;
        }

        // 随机打散，再取前10条
        shuffle($rows);
        $result = [];
        $picked = array_slice($rows, 0, 10);
        foreach ($picked as $k => $v) {
            $user = Db::table('ul_order_user')->where('open_id', $v['open_id'])->find();
            if($v['code'] == 0){
                $result[$k] = '用户' . $user['nickname'] . '通过' . $v['fs'] . '获得了' . $v['coin_num'] . '金币';
            }else{
                $result[$k] = '用户'. $user['nickname'] . '通过' . $v['fs'] . '消耗' . $v['coin_num'] . '金币';
            }
        }

        // 这里可以添加具体的消息内容
        $that->sendJson($connection, [
            'type' => 'latest_coin_random_list',
            'rows' => $result,
        ]);
    }

    private function checkToken($openId, $token){
        $cachedToken = Cache::store('redis')->get('user_' . $openId);
        if ($cachedToken === $token) {
            Cache::store('redis')->set('user_' . $openId, $token, 3600);
            return true;
        }
        return false;
    }

    public function handle5cqLogin($connection, array $payload, $count)
    {
        $ip = $connection->getRemoteIp();
        $info = Db::table('ul_order_user')->where('open_id',$payload['open_id'])->find();
        if($info['state'] == 1){
            return $this->sendJson($connection, ['code'=>0, 'type'=>$payload['type'], 'msg'=>'账户已被封禁']);
        }
        $sum1 = Db::table('yxsc')->where('open_id',$payload['open_id'])->sum('yxsc');//普通游戏时长
        $sum2 = Db::table('yxsc')->where('open_id',$payload['open_id'])->sum('hf_sc');//好服游戏时长
        $sum = $sum1+$sum2; 
        $info['yxsc'] = $sum;

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

        Db::table('ul_order_user')->where('open_id',$payload['open_id'])
            ->update(['ip'=>$ip, 'time_count'=>$time_count, 'time_count_date'=>$time_count_date]);
        return $this->sendJson($connection, ['code'=>200, 'type'=>$payload['type'], 'msg'=>'用户信息', 'levelInfoList'=>$levelInfoList, 'data'=>$info]);
    }

    /**
     * 处理5cq登录
     *
     * @param mixed $connection
     * @param array $payload
     */
    protected function handleLogin($connection, array $payload)
    {

        $openId = trim((string)($payload['open_id'] ?? ''));
        $token  = trim((string)($payload['token'] ?? ''));

        if ($openId === '' || $token === '') {
            $this->sendJson($connection, [
                'type' => 'login',
                'code' => 0,
                'msg'  => 'open_id或token不能为空',
            ]);
            return;
        }

        $cachedToken = Cache::store('redis')->get('user_' . $openId);
        if ($cachedToken !== $token) {
            $this->sendJson($connection, [
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
            $this->sendJson($connection, [
                'type' => 'login',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            $this->sendJson($connection, [
                'type' => 'login',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }

        // 这里继续复用 uidConnections，但 uid 实际保存 open_id
        $connection->uid = $openId;
        $this->wsWorker->uidConnections[$openId] = $connection;

        // 延长 token 有效期，保持和 HTTP 登录一致
        Cache::store('redis')->set('user_' . $openId, $token, 3600);

        $this->sendJson($connection, [
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
     *
     * @param mixed $connection
     */
    protected function handleGetUserInfo($connection)
    {
        if (!isset($connection->uid) || $connection->uid === '') {
            $this->sendJson($connection, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '请先登录',
            ]);
            return;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,name,nickname,avatar,phone,lv,coin_num,money,sign,is_online,state')
            ->where('open_id', (string)$connection->uid)
            ->find();

        if (!$user) {
            $this->sendJson($connection, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            $this->sendJson($connection, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }
        //获取当前登录用户的token并续费
        $token = Cache::store('redis')->get('user_' . $user['open_id']);
        if ($token) {
            Cache::store('redis')->set('user_' . $user['open_id'], $token, 3600);
        }

        $this->sendJson($connection, [
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
     *
     * 对应 HTTP: /user/get_user_all_yxsc
     *
     * @param mixed $connection
     */
    protected function handleGetUserAllYxsc($connection)
    {
        if (!isset($connection->uid) || $connection->uid === '') {
            $this->sendJson($connection, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '请先登录',
            ]);
            return;
        }

        $openId = (string)$connection->uid;

        $user = Db::table('ul_order_user')
            ->field('open_id,state')
            ->where('open_id', $openId)
            ->find();

        if (!$user) {
            $this->sendJson($connection, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        if ((int)($user['state'] ?? 0) === 1) {
            $this->sendJson($connection, [
                'type' => 'get_user_all_yxsc',
                'code' => 0,
                'msg'  => '账户已被封禁',
            ]);
            return;
        }

        $sum1 = Db::table('yxsc')->where('open_id', $openId)->sum('yxsc');
        $sum2 = Db::table('yxsc')->where('open_id', $openId)->sum('hf_sc');
        $sum  = $sum1 + $sum2;

        $this->sendJson($connection, [
            'type' => 'get_user_all_yxsc',
            'code' => 200,
            'msg'  => '成功',
            'data' => [
                'open_id'   => $openId,
                'yxsc'      => (string)$sum1,
                'hf_sc'     => (string)$sum2,
                'total_yxsc'=> (string)$sum,
            ],
        ]);
    }

    /**
     * 获取运营参数配置
     *
     * 对应 HTTP: /business/operation
     *
     * @param mixed $connection
     */
    protected function handleBusinessOperation($connection)
    {
        $list = Db::table('operation')->find(1);

        if (!$list) {
            $this->sendJson($connection, [
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

        $this->sendJson($connection, [
            'type' => 'business_operation',
            'code' => 200,
            'msg'  => '运营参数配置',
            'data' => $list,
        ]);
    }

    /**
     * 统一发送 JSON
     *
     * @param mixed $connection
     * @param array $data
     */
    protected function sendJson($connection, array $data)
    {
        $connection->send(json_encode($data, JSON_UNESCAPED_UNICODE));
    }

    /**
     * 针对 uid 推送数据
     *
     * @param string $uid
     * @param string $message
     * @return bool
     */
    public function sendMessageByUid($uid, $message)
    {
        $uid = trim((string)$uid);
        if ($uid === '') {
            return false;
        }

        if (isset($this->wsWorker->uidConnections[$uid])) {
            $connection = $this->wsWorker->uidConnections[$uid];
            $connection->send($message);
            return true;
        }

        return false;
    }
}