<?php
namespace app\worker;

use GatewayWorker\Lib\Gateway;
use think\facade\Cache;
use think\facade\Db;

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

    public static function onWorkerStart($businessWorker)
    {
        self::$cqConnections = [];
        self::$clientSessions = [];

        if (!defined('HEARTBEAT_TIME')) {
            define('HEARTBEAT_TIME', 55);
        }
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

            case 'coin_info_today':
                self::handleCoinInfoToday($client_id, $payload);
                return;

            case 'user_report':
                self::handleUserReport($client_id, $payload);
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
        self::removeClientSession($client_id);
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

        $message = self::buildLatestCoinRandomListMessage();
        if ($message === '') {
            return;
        }

        try {
            Gateway::sendToClient($client_id, $message);
        } catch (\Throwable $e) {
            Gateway::closeClient($client_id);
        }
    }

    private static function getLatestCoinRandomListRows(): array
    {
        $rows = Db::table('user_log')->order('id desc')->limit(10)->select()->toArray();
        if (empty($rows)) {
            return [];
        }

        $rows = array_reverse($rows);
        $result = [];
        foreach ($rows as $row) {
            $log = trim((string)($row['log'] ?? ''));
            if ($log === '') {
                continue;
            }

            $result[] = $log;
        }

        return $result;
    }

    private static function buildLatestCoinRandomListMessage(): string
    {
        $rows = self::getLatestCoinRandomListRows();
        if (empty($rows)) {
            return '';
        }

        return json_encode([
            'type' => 'latest_coin_random_list',
            'rows' => $rows,
        ], JSON_UNESCAPED_UNICODE);
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

    private static function removeClientSession($client_id)
    {
        foreach (self::$cqConnections as $openId => $cid) {
            if ($cid === $client_id) {
                unset(self::$cqConnections[$openId]);
                break;
            }
        }

        unset(self::$clientSessions[$client_id]);
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
            self::removeClientSession($client_id);
            return;
        }

        if (!self::checkToken($openId, $token)) {
            self::removeClientSession($client_id);
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

        $updated = Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->update([
                'time_count'      => $timeCount,
                'time_count_date' => $timeCountDate,
            ]);

        if ($updated) {
            self::sendUserInfoUpdate($openId);
        }
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

        [$timeCount, $timeCountDate] = self::normalizeTimeCount($info, $count);

        Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->update([
                'time_count'      => $timeCount,
                'time_count_date' => $timeCountDate,
            ]);

        $userPayload = self::buildUserInfoPayload($openId, [
            'time_count'      => $timeCount,
            'time_count_date' => $timeCountDate,
        ]);

        if (!$userPayload) {
            return self::sendJson($client_id, ['code' => 0, 'type' => $payload['type'], 'msg' => '用户不存在']);
        }

        return self::sendJson($client_id, [
            'code'          => 200,
            'type'          => $payload['type'],
            'msg'           => '用户信息',
            'levelInfoList' => $userPayload['levelInfoList'],
            'data'          => $userPayload['data'],
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

        $userPayload = self::buildUserInfoPayload($uid);
        if (!$userPayload) {
            self::sendJson($client_id, [
                'type' => 'get_user_info',
                'code' => 0,
                'msg'  => '用户不存在',
            ]);
            return;
        }

        $user = $userPayload['data'];
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
            'levelInfoList' => $userPayload['levelInfoList'],
            'data' => $user,
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

    protected static function handleCoinInfoToday($client_id, array $payload)
    {
        $uid = Gateway::getUidByClientId($client_id);
        $requestId = trim((string)($payload['request_id'] ?? ''));
        $fs = trim((string)($payload['fs'] ?? ''));

        if (!$uid) {
            self::sendJson($client_id, [
                'type' => 'coin_info_today',
                'code' => 0,
                'msg'  => '请先登录',
                'request_id' => $requestId,
                'fs' => $fs,
                'data' => null,
            ]);
            return;
        }

        if ($fs === '') {
            self::sendJson($client_id, [
                'type' => 'coin_info_today',
                'code' => 0,
                'msg'  => 'fs不能为空',
                'request_id' => $requestId,
                'open_id' => (string)$uid,
                'fs' => '',
                'data' => null,
            ]);
            return;
        }

        $record = Db::table('coin_info')
            ->whereDay('updata_time')
            ->where('fs', $fs)
            ->where('open_id', $uid)
            ->find();

        self::sendJson($client_id, [
            'type' => 'coin_info_today',
            'code' => 200,
            'msg'  => '获取成功',
            'request_id' => $requestId,
            'open_id' => (string)$uid,
            'fs' => $fs,
            'data' => $record ?: null,
        ]);
    }

    protected static function handleUserReport($client_id, array $payload)
    {
        $uid = Gateway::getUidByClientId($client_id);
        $requestId = trim((string)($payload['request_id'] ?? ''));

        if (!$uid) {
            self::sendJson($client_id, [
                'type' => 'user_report',
                'code' => 0,
                'msg'  => '请先登录',
                'request_id' => $requestId,
                'data' => null,
            ]);
            return;
        }

        $reportPayload = self::buildUserReportPayload($uid);
        if (!$reportPayload) {
            self::sendJson($client_id, [
                'type' => 'user_report',
                'code' => 0,
                'msg'  => '用户不存在',
                'request_id' => $requestId,
                'open_id' => (string)$uid,
                'data' => null,
            ]);
            return;
        }

        $reportPayload['type'] = 'user_report';
        $reportPayload['request_id'] = $requestId;
        $reportPayload['open_id'] = (string)$uid;
        self::sendJson($client_id, $reportPayload);
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
        $message = self::buildLatestCoinRandomListMessage();
        if ($message === '') {
            return;
        }

        Gateway::sendToAll($message);
    }

    private static function buildUserReportPayload(string $openId): ?array
    {
        $openId = trim($openId);
        if ($openId === '') {
            return null;
        }

        $monthNum = Db::table('ul_user_report')
            ->whereTime('report_time', 'month')
            ->where('open_id', $openId)
            ->group("DATE_FORMAT(report_time,'%Y-%m-%d')")
            ->count();

        $zt = Db::table('ul_user_report')
            ->whereTime('report_time', 'yesterday')
            ->where('open_id', $openId)
            ->find();

        $jt = Db::table('ul_user_report')
            ->whereTime('report_time', 'today')
            ->where('open_id', $openId)
            ->find();

        $jtDay = Db::table('ul_user_report')
            ->whereTime('report_time', 'today')
            ->where('open_id', $openId)
            ->count();

        $ztDay = Db::table('ul_user_report')
            ->whereTime('report_time', 'yesterday')
            ->where('open_id', $openId)
            ->count();

        $userInfo = Db::table('ul_order_user')
            ->where('open_id', $openId)
            ->find();
        if (!$userInfo) {
            return null;
        }

        $userLvInfo = Db::table('ul_user_level')
            ->where('level_name', $userInfo['lv'])
            ->find();
        $operationInfo = function_exists('operation_info') ? operation_info() : Db::table('operation')->find(1);

        $signCoin = 0;
        if (is_array($operationInfo) && $userLvInfo) {
            $signCoin = (float)($operationInfo['signlnCoin'] ?? 0) * (float)($userLvInfo['coin_scale'] ?? 0) / 100;
        }

        if ($ztDay == 0) {
            if ($jtDay == 0) {
                return [
                    'code' => 0,
                    'msg' => '昨天未签到,今天未签到',
                    'data' => [
                        'day' => $monthNum,
                        'num' => $signCoin,
                    ],
                ];
            }

            return [
                'code' => 1,
                'msg' => '昨天未签到,今天已签到',
                'data' => [
                    'day' => $monthNum,
                    'num' => $signCoin,
                    'jt' => $jt['report_time'] ?? '',
                ],
            ];
        }

        if ($jtDay == 0) {
            return [
                'code' => 2,
                'msg' => '昨天已签到,今天未签到',
                'data' => [
                    'day' => $monthNum,
                    'num' => $signCoin,
                    'zt' => $zt['report_time'] ?? '',
                ],
            ];
        }

        return [
            'code' => 200,
            'msg' => '昨天已签到,当天已签到',
            'data' => [
                'day' => $monthNum,
                'num' => $signCoin,
                'zt' => $zt['report_time'] ?? '',
                'jt' => $jt['report_time'] ?? '',
            ],
        ];
    }

    private static function buildUserInfoPayload($open_id, array $overrides = [])
    {
        $open_id = trim((string)$open_id);
        if ($open_id === '') {
            return null;
        }

        $user = Db::table('ul_order_user')
            ->field('id,open_id,name,nickname,realname,avatar,avatar2,phone,sfz,lv,coin_num,money,waelfare,sign,is_online,is_sh,state,time_count,time_count_date')
            ->where('open_id', $open_id)
            ->find();

        if (!$user) {
            return null;
        }

        foreach ($overrides as $field => $value) {
            $user[$field] = $value;
        }

        $sum1 = (float)Db::table('yxsc')->where('open_id', $open_id)->sum('yxsc');
        $sum2 = (float)Db::table('yxsc')->where('open_id', $open_id)->sum('hf_sc');
        $todaynum1 = (float)Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $open_id)
            ->whereTime('update_time', 'today')
            ->sum('yxsc');
        $todaynum2 = (float)Db::table('yxsc')
            ->where('source', 'add_game_time')
            ->where('open_id', $open_id)
            ->whereTime('update_time', 'today')
            ->sum('hf_sc');

        $user['open_id'] = (string)$user['open_id'];
        $user['name'] = (string)($user['name'] ?? '');
        $user['nickname'] = (string)($user['nickname'] ?? '');
        $user['realname'] = (string)($user['realname'] ?? '');
        $user['avatar'] = (string)($user['avatar'] ?? '');
        $user['avatar2'] = (string)($user['avatar2'] ?? '');
        $user['phone'] = (string)($user['phone'] ?? '');
        $user['sfz'] = (string)($user['sfz'] ?? '');
        $user['lv'] = (string)($user['lv'] ?? '');
        $user['coin_num'] = (string)($user['coin_num'] ?? '0');
        $user['money'] = (string)($user['money'] ?? '0');
        $user['waelfare'] = (string)($user['waelfare'] ?? '0');
        $user['sign'] = (string)($user['sign'] ?? '');
        $user['yxsc'] = (string)($todaynum1 + $todaynum2);
        $user['hf_sc'] = (string)$sum2;
        $user['total_yxsc'] = (string)($sum1 + $sum2);
        $user['undone_num'] = self::checkTaskGranted($open_id);
        $user['time_count'] = (int)($user['time_count'] ?? 0);
        $user['time_count_date'] = (int)($user['time_count_date'] ?? 0);
        $user['is_online'] = (int)($user['is_online'] ?? 0);
        $user['is_sh'] = (int)($user['is_sh'] ?? 0);
        $user['state'] = (int)($user['state'] ?? 0);

        $levelInfoList = Db::table('ul_user_level')->select()->toArray();

        return [
            'levelInfoList' => $levelInfoList,
            'data'          => $user,
        ];
    }

    public static function sendUserInfoUpdate($open_id)
    {
        $userPayload = self::buildUserInfoPayload($open_id);
        if (!$userPayload) {
            return;
        }

        $message = json_encode([
            'type' => 'user_info_updated',
            'code' => 200,
            'msg'  => '用户信息已更新',
            'levelInfoList' => $userPayload['levelInfoList'],
            'data' => $userPayload['data'],
        ], JSON_UNESCAPED_UNICODE);

        Gateway::sendToUid($open_id, $message);
    }
}
