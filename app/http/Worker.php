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
     * 处理登录
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