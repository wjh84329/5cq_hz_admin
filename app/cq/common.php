<?php
// 这是系统自动生成的公共文件
use Carbon\Carbon;
use think\facade\Cache;
use think\facade\Db;

/**
 * Notes:生成UID
 * @auther: xxf
 * Date: 2019/7/17
 * Time: 17:28
 * @return string
 */
function make_uid()
{
    @date_default_timezone_set("PRC");
    //号码主体（YYYYMMDDHHIISSNNNNNNNN）
    $order_id_main = date('YmdHis') . rand(10000000,99999999);
    $order_id_len = strlen($order_id_main);
    $order_id_sum = 0;
    for($i=0; $i<$order_id_len; $i++){
        $order_id_sum += (int)(substr($order_id_main,$i,1));
    }
    //唯一号码（YYYYMMDDHHIISSNNNNNNNNCC）
    $uid = $order_id_main . str_pad((100 - $order_id_sum % 100) % 100,2,'0',STR_PAD_LEFT);
    return $uid;
}

/*
     * 获取基础配置
     * */
function basic_info(){
    $list = Db::table('basic')->find(1);
    return $list;
}

/*
 * 获取运营参数配置
 * */
function operation_info(){
    $list = Db::table('operation')->find(1);
    return $list;
}

/*
 * 金币转盘配置
 * */
function luckyCoin()
{
    $list = Db::table('luckyCoin')->find(1);
    return $list;
}

/*
 * 实物转盘配置
 * */
function luckyPrize()
{
    $list = Db::table('luckyPrize')->find(1);
    return $list;
}

function roundTime($amount, $units = 'm', $time = null)
{
    if (is_null($time)) {
        $time = time();
    }

    if ($amount == 0) {
        $amount = 1;
    }

    switch ($units){
        case 'm':
            $roundBy = 60 * $amount;
            break;
        case 'h':
            $time = $time + 60 * 60 * $amount;
            $roundBy = 60 * 60 * $amount;
            break;
        case 'd':
            $time = $time + 60 * 60 * 24 * $amount;
            $roundBy = 60 * 60 * 24 * $amount;
            break;
    }

    return round($time / $roundBy) * $roundBy;
}

function scandirFolder($path)

{

    $list     = [];

    $temp_list = scandir($path);

    foreach ($temp_list as $file)

    {

        //排除根目录

        if ($file != ".." && $file != ".")

        {

            if (is_dir($path . "/" . $file))

            {

                //子文件夹，进行递归

                $list[$file] = scandirFolder($path . "/" . $file);

            }

            else

            {

                //根目录下的文件

                $list[] = $file;

            }

        }

    }

    return $list;

}

function acquireLock($lockKey, $lockExpire,$data)
{
    // 将参数转换为查询字符串形式（也可以选择其他方式序列化参数）
    $queryString = http_build_query($data);

    // 对查询字符串进行MD5加密
    $lockValue = md5($lockKey);

//    $lockValue = uniqid(); // 生成一个唯一的锁值，用于释放锁时验证
    $isLocked = Cache::store('redis')->set($lockKey, $lockValue, $lockExpire, 'NX'); // 使用NX选项确保只有在键不存在时才设置

    if ($isLocked) {
        Cache::store('redis')->expire($lockKey, $lockExpire); // 确保锁有有效期
        return [$isLocked, $lockValue];
    }

    return false;
}

function releaseLock($lockKey)
{
    $lockValue = md5($lockKey);

    if ($lockValue) {
        // 使用脚本确保释放的是自己的锁
        $script = '
                if redis.call("get", KEYS[1]) == ARGV[1] then
                    return redis.call("del", KEYS[1])
                else
                    return 0
                end
            ';

        $result = Cache::store('redis')->eval($script, [$lockKey, $lockValue], 1);

        if ($result === 1) {
            return true; // 释放成功
        }
    }

    return false; // 释放失败（可能锁已被其他进程释放）
}

function getData($queueData ){
    // 提取第一个元素，即序列化的 JSON 字符串（注意：这里我们有一个字节字符串，需要解码为普通字符串）
    $jsonString = $queueData[0][0];
    $jsonString = mb_convert_encoding($jsonString, 'UTF-8', 'auto'); // 如果需要，将字节字符串转换为 UTF-8 字符串

// 将 JSON 字符串解码为 PHP 对象或数组
    $taskData = json_decode($jsonString, true); // 第二个参数为 true 时，将 JSON 解码为关联数组
    return $taskData;
}

function getCoins($data){
    $basic_info = Db::table('basic')->find(1);//基础参数配置
    $operation_info = Db::table('operation')->find(1);
    $luckyCoin = Db::table('luckyCoin')->find(1);//金币转盘配置
    $luckyPrize = Db::table('luckyPrize')->find(1);//实物转盘配置
    // 获取今天的开始和结束时间戳
    $todayStart = strtotime('today midnight');
    $todayEnd = strtotime('tomorrow midnight') - 1; // 减1秒以确保今天23:59:59也被包含
//        $data = $this->request->param();//请求参数
    switch ($data['type']){
        case 1:    //签到
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','签到')->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['signlnCoin'];
            $data['fs'] = '签到';
            $data['code'] = 0;
            $data['title'] = '签到';
            break;
        case 2:    //签到3天奖励
            // 获取当前月份的第一天和最后一天
            $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
            $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到3天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
            ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['signlnCoin3'];
            $data['fs'] = '累计签到3天奖励';
            $data['code'] = 0;
            $data['title'] = '累计签到3天奖励';
            break;
        case 3:    //签到7天奖励
            $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
            $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到7天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
            ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['signlnCoin7'];
            $data['fs'] = '累计签到7天奖励';
            $data['code'] = 0;
            $data['title'] = '累计签到7天奖励';
            break;
        case 4:    //签到14天奖励
            $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
            $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到14天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
            ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['signlnCoin14'];
            $data['fs'] = '累计签到14天奖励';
            $data['code'] = 0;
            $data['title'] = '累计签到14天奖励';
            break;
        case 5:    //签到28天奖励
            $firstDayOfMonth = Carbon::now()->startOfMonth()->toDateString();
            $lastDayOfMonth = Carbon::now()->endOfMonth()->toDateString();
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','累计签到28天奖励')->where('updata_time', '>=', $firstDayOfMonth) // 替换 'date_column' 为你的日期字段名
            ->where('updata_time', '<=', $lastDayOfMonth)->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['signlnCoin28'];
            $data['fs'] = '累计签到28天奖励';
            $data['code'] = 0;
            $data['title'] = '累计签到28天奖励';
            break;
        case 6:    //绑定手机
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','绑定手机')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['mainCoin'];
            $data['fs'] = '绑定手机';
            $data['code'] = 0;
            $data['title'] = '绑定手机';
            break;
        case 7:    //实名认证
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','实名认证')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['mainCoin'];
            $data['fs'] = '实名认证';
            $data['code'] = 0;
            $data['title'] = '实名认证';
            break;
        case 8:    //注册立得金币
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','注册')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['registerCoin'];
            $data['fs'] = '注册';
            $data['code'] = 0;
            $data['title'] = '注册';
            break;
        case 9:    //发帖回帖评论得金币
            $data['coin_num'] = $operation_info['postCoin'];
            $data['fs'] = '发帖回帖评论';
            $data['code'] = 0;
            $data['title'] = '发帖回帖评论';
            break;
        case 10:    //浏览游戏得金币
            $data['coin_num'] = $operation_info['lookGame'];
            $data['fs'] = '浏览游戏';
            $data['code'] = 0;
            $data['title'] = '浏览游戏';
            break;
        case 11:    //白银宝箱
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
            if(empty($info)){
                $coin = explode('-',$operation_info['boxCoin30']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
                $data['fs'] = '白银宝箱';
                $data['code'] = 0;
                $data['title'] = '白银宝箱';
            }else{
                $data['bylq'] = 1;
            }
            break;
        case 12:    //黄金宝箱
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
            if(empty($info)){
                $coin = explode('-',$operation_info['boxCoin60']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
                $data['fs'] = '黄金宝箱';
                $data['code'] = 0;
                $data['title'] = '黄金宝箱';
            }else{
                $data['hjlq'] = 1;
            }
            break;
        case 13:    //铂金宝箱
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
            if(empty($info)){
                $coin = explode('-',$operation_info['boxCoin120']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
                $data['fs'] = '铂金宝箱';
                $data['code'] = 0;
                $data['title'] = '铂金宝箱';
            }else{
                $data['bjlq'] = 1;
            }
            break;
        case 14:    //钻石宝箱
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
            if(empty($info)){
                $coin = explode('-',$operation_info['boxCoin240']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
                $data['fs'] = '钻石宝箱';
                $data['code'] = 0;
                $data['title'] = '钻石宝箱';
            }else{
                $data['zslq'] = 1;
            }
            break;
        case 15:    //金币转盘消耗
            $data['coin_num'] = $operation_info['luckCoinConsume'];
            $data['fs'] = '金币抽奖';
            $data['code'] = 1;
            $data['title'] = '金币抽奖';
            break;
        case 16:    //实物转盘消耗
            $data['coin_num'] = $operation_info['luckPrizeCoinConsume'];
            $data['fs'] = '实物抽奖';
            $data['code'] = 1;
            $data['title'] = '实物抽奖';
            break;
        case 17:    //金币转盘奖品
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber'.$data['state']])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle'.$data['state']];
            unset($data['state']);
            break;
        /*case 17:    //金币奖品1
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber1'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle1'];
            break;
        case 18:    //金币奖品2
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber2'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle2'];
            break;
        case 19:    //金币奖品3
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber3'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle3'];
            break;
        case 20:    //金币奖品4
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber4'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle4'];
            break;
        case 21:    //金币奖品5
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber5'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle5'];
            break;
        case 22:    //金币奖品6
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber6'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle6'];
            break;
        case 23:    //金币奖品7
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber7'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle7'];
            break;
        case 24:    //金币奖品8
            $data['coin_num'] = floatval($luckyCoin['luckyCoinItemNumber8'])*floatval($operation_info['luckCoinConsume']);
            $data['fs'] = '金币抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyCoinItemTitle8'];
            break;*/
        case 25:    //实物转盘奖品
            $concatenatedString = $luckyPrize['luckyPrizeItemTitle'. $data['state']] ;
            //判断$luckyPrize['luckyPrizeItemTitle'].$data['state']的值是否包含金币两个字
            // 使用 strpos() 检查是否包含“金币”
            if (strpos($concatenatedString, '金币') !== false) {
                // 包含“金币”
                $coin = explode('金币',$concatenatedString);
                $data['coin_num'] = $coin[0];
                // 在此处执行相关逻辑
            } else {
                // 不包含“金币”
                $data['sw'] = 0;
                // 在此处执行其他逻辑
            }
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $concatenatedString;
            unset($data['state']);
            break;
        /*case 25:    //实物奖品1
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle1']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle1'];
            break;
        case 26:    //实物奖品2
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle2']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle2'];
            break;
        case 27:    //实物奖品3
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle3']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle3'];
            break;
        case 28:    //实物奖品4
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle4']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle4'];
            break;
        case 29:    //实物奖品5
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle5']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle5'];
            break;
        case 30:    //实物奖品6
            $coin = explode('金币',$luckyCoin['luckyPrizeItemTitle6']);
            $data['coin_num'] = $coin[0];
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle6'];
            break;
        case 31:    //实物奖品7
            $data['coin_num'] = 0;
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle7'];
            break;
        case 32:    //实物奖品8
            $data['coin_num'] = 0;
            $data['fs'] = '实物抽奖';
            $data['code'] = 0;
            $data['title'] = $luckyCoin['luckyPrizeItemTitle8'];
            break;*/
        case 33:    //领取红包
            $hbinfo = Db::table('hb')->where('id',$data['hb_id'])->findOrEmpty();
            $hblqinfo = Db::table('coin_info')->where('open_id',$data['open_id'])->whereTime('updata_time','today')->where('hb_id',$data['hb_id'])->findOrEmpty();
            if(!empty($hblqinfo)){
                $data['mystery'] = 0;
            }
            if(!empty($hbinfo) && strpos($hbinfo['price'],'-') != false){
                $coin = explode('-',$hbinfo['price']);
                $data['coin_num'] = rand($coin[0],$coin[1]);
            }elseif (!empty($hbinfo) && strpos($hbinfo['price'],'-') == false){
                $data['coin_num'] = $hbinfo['price'];
            }else{
                $data['coin_num'] = 0;
            }
            $data['fs'] = '红包奖励';
            $data['code'] = 0;
            $data['title'] = '红包奖励';
            break;
        case 34:    //每日盲盒
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','每日盲盒')->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $coin = explode('-',$operation_info['luck']);
            $data['coin_num'] = rand($coin[0],$coin[1]);
            $data['fs'] = '每日盲盒';
            $data['code'] = 0;
            $data['title'] = '每日盲盒';
            break;
        case 35:    //特色好服任务一  额外参数：yx_id
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏在线时长60分钟')->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['renwu1'];
            $data['fs'] = '游戏在线时长60分钟';
            $data['code'] = 0;
            $data['title'] = '任务一';
            break;
        case 36:    //特色好服任务二  额外参数：yx_id
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏在线时长120分钟')->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['renwu2'];
            $data['fs'] = '游戏在线时长120分钟';
            $data['code'] = 0;
            $data['title'] = '任务二';
            break;
        case 37:    //特色好服任务三  额外参数：yx_id
            $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','游戏评分')->whereTime('updata_time','today')->findOrEmpty();
            if(!empty($info)){
                $data['mystery'] = 0;
            }
            $data['coin_num'] = $operation_info['renwu3'];
            $data['fs'] = '游戏评分';
            $data['code'] = 0;
            $data['title'] = '任务三';
            break;
        case 38:    //金币商城兑换物品  额外参数：goods_id
            $info = Db::table('ul_coin_goods')->where('id',$data['goods_id'])->findOrEmpty();
            $data['coin_num'] = $info['price'];
            $data['fs'] = '物品兑换';
            $data['code'] = 1;
            $data['title'] = $info['title'];
            break;
        case 39:    //活动赛事竞猜红方投注  额外参数：coin_num  sbk_id
            $data['fs'] = '比赛竞猜';
            $data['code'] = 1;
            $data['tz_type'] = 1;
            $data['title'] = '红方投注';
            break;
        case 40:    //活动赛事竞猜蓝方投注  额外参数：coin_num  sbk_id
            $data['fs'] = '比赛竞猜';
            $data['code'] = 1;
            $data['tz_type'] = 2;
            $data['title'] = '蓝方投注';
            break;
        case 41:    //活动赛事竞猜结算  额外参数：  sbk_id
            $sbkinfo = Db::table("ul_sbk")->where('id',$data['sbk_id'])->findOrEmpty();
            $tzcoin = Db::table("coin_info")->where('sbk_id',$data['sbk_id'])->where('tz_type',$sbkinfo['sy_type'])->sum('coin_num');
            $data['coin_num'] = $tzcoin /floatval($sbkinfo['matic_price'])* $tzcoin;
            $data['fs'] = '比赛竞猜';
            $data['code'] = 0;
            $data['tz_type'] = 2;
            $data['title'] = '竞猜奖励';
            break;
        case 42:    //白银宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin30']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页白银宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页白银宝箱';
                }else{
                    $data['bylq'] = 1;
                }
                break;
            case 43:    //黄金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin60']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页黄金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页黄金宝箱';
                }else{
                    $data['hjlq'] = 1;
                }
                break;
            case 44:    //铂金宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin120']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页铂金宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页铂金宝箱';
                }else{
                    $data['bjlq'] = 1;
                }
                break;
            case 45:    //钻石宝箱
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
                if(empty($info)){
                    $coin = explode('-',$operation_info['boxCoin240']);
                    $data['coin_num'] = rand($coin[0],$coin[1])/2;
                    $data['fs'] = '网页钻石宝箱';
                    $data['code'] = 0;
                    $data['title'] = '网页钻石宝箱';
                }else{
                    $data['zslq'] = 1;
                }
                break;
            case 46://网页分享得金币，每次10个金币，每天最多十次
                $list = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','网页分享得金币')->whereTime('updata_time','today')->select();
                if(count($list) < 10){
                    $data['coin_num'] = 10;
                    $data['fs'] = '网页分享得金币';
                    $data['code'] = 0;
                    $data['title'] = '网页分享得金币';
                }else{
                    $data['coin_num'] = 0;
                    $data['fs'] = '网页分享得金币';
                    $data['code'] = 0;
                    $data['title'] = '网页分享得金币';
                    $data['share'] = 1;
                }
                break;
    }

    return $data;
}