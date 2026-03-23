<?php

namespace app\cq\Job;

use app\cq\controller\Goods;
use Carbon\Carbon;
use think\facade\Db;
use think\facade\Cache;
use think\facade\Log;
use think\queue\Job;

class AsyncJob
{
    /*
     * 增减金币队列任务逻辑
     * */
    public function task1(Job $job, $data){
        $jobid = $job->getJobId();
//        $count = $job->attempts();

        // $data['hb_id'] = 0;
//        $job->release(1);
//        Db::table('queue_query')->where('key',$jobid)->delete();
        $data = getCoins($data);
        try {
            $value = json_encode(['code'=>0,'msg'=>'操作频繁']);
            /*if($job->attempts() >=100){
                $value = json_encode(['code'=>504,'msg'=>'请求超时']);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if (array_key_exists('sw', $data)) {
                $value = json_encode(['code'=>200,'msg'=>'成功','order'=>1]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if (array_key_exists('mystery', $data)) {
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs',$data['fs'])->whereTime('updata_time','today')->findOrEmpty();
                $value = json_encode(['code'=>200,'msg'=>$data['fs'].'今日已领取','mystery'=>1,'coinInfo'=>$info]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if(array_key_exists('bylq', $data)){
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','白银宝箱')->whereTime('updata_time','today')->findOrEmpty();
                $value = json_encode(['code'=>200,'msg'=>'白银宝箱今日已领取','coinInfo'=>$info]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if(array_key_exists('hjlq', $data)){
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','黄金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                $value = json_encode(['code'=>200,'msg'=>'黄金宝箱今日已领取','coinInfo'=>$info]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if(array_key_exists('bjlq', $data)){
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','铂金宝箱')->whereTime('updata_time','today')->findOrEmpty();
                $value = json_encode(['code'=>200,'msg'=>'铂金宝箱今日已领取','coinInfo'=>$info]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            if(array_key_exists('zslq', $data)){
                $info = Db::table('coin_info')->where('open_id',$data['open_id'])->where('fs','钻石宝箱')->whereTime('updata_time','today')->findOrEmpty();
                $value = json_encode(['code'=>200,'msg'=>'钻石宝箱今日已领取','coinInfo'=>$info]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }
            $data['real'] = $data['coin_num'];
            if($data['code']==0){
//                echo '111';
                $coount = Db::table('coin_info')->whereTime('updata_time','today')->where('code',0)->where('open_id',$data['open_id'])->sum('coin_num');//今日获得的金币数量
//            return json($coount);
                $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();//用户信息
                $operation = Db::table('operation')->find(1);//运营参数
                $info = Db::table('ul_user_level')->where('level_name',$user_info['lv'])->find();//等级信息
//            return (intval($coount));
//                echo '111';
                if((intval($info['coin_up'])-intval($coount))>0){//未达到领取上限
//                return 1;
                    if((intval($info['coin_up'])-intval($coount))>intval($data['coin_num'])){//当前金币未超出限制
                        $data['coin_num'] = floatval($data['coin_num'])*floatval($info['coin_scale'])/100;
                    }else{//当前金币已超出限制
                        $data['coin_num'] = (floatval($info['coin_up'])-floatval($coount))*floatval($info['coin_scale'])/100;//按等级计算可获得金币数
                    }
//                return  $data['coin_num'];
                    Db::table('ul_order_user')
                        ->where('open_id',$data['open_id'])
                        ->inc('coin_num',$data['coin_num'])
                        ->update();
                }else{//达到领取上限
                    $data['coin_num'] = 0;
//                return 2;
                }
                $data['difference'] = floatval($data['coin_num']) - floatval($data['real']);
                $insertID = Db::table('coin_info')->insertGetId($data);
                $coininfo = Db::table('coin_info')->find($insertID);
                $up_coin = $operation['sharUserPercentage1']/100*$data['coin_num'];
                if($user_info['up_id']){
                    Db::table('ul_order_user')
                        ->where('id',$user_info['up_id'])
                        ->inc('coin_num',$up_coin)
                        ->update();
                    $up_user_info = Db::table('ul_order_user')->where('id',$user_info['up_id'])->findOrEmpty();//上级用户信息
                    $up_data['open_id'] = $up_user_info['open_id'];
                    $up_data['coin_num'] = $up_coin;
                    $up_data['code'] = 0;
                    $up_data['fs'] = '分享收益';
                    Db::table('coin_info')->insert($up_data);
                }
                $value = json_encode(['code'=>200,'msg'=>'成功','user_info'=>$user_info,'coinInfo'=>$coininfo]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }elseif ($data['code']==1){
//                echo '222';
                Db::table('ul_order_user')
                    ->where('open_id',$data['open_id'])
                    ->dec('coin_num',$data['coin_num'])
                    ->update();
                $insertID = Db::table('coin_info')->insertGetId($data);
                $coininfo = Db::table('coin_info')->find($insertID);
                $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                $value = json_encode(['code'=>200,'msg'=>'成功','user_info'=>$user_info,'coinInfo'=>$coininfo]);
//                Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
//                $job->delete();
            }else{
//                echo '333';
//                $job->delete();
            }*/
        }
            /*catch (\Exception $e){
                $value = json_encode(['code'=>404,'msg'=>$e->getMessage()]);
    //            $job->delete();
            } */
        finally
        {
            Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
            $job->delete();
            Cache::delete($data['queueKey']);
//            $job->release(1);
        }

    }


    /*
     * 金币兑换余额队列逻辑
     *
     * */
    public function task2(Job $job, $data){
        $jobid = $job->getJobId();
        try {
            $value = json_encode(['code'=>0,'msg'=>'兑换频繁']);
            /*$user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();//用户信息
            $before = $user_info['money'];
            $bl = Db::table('operation')->where('id',1)->find();
            $dh_money = intval(floatval($data['num'])/floatval($bl['coinToMoney']),0);
            $user_coin = floatval($user_info['coin_num'])-$dh_money*floatval($bl['coinToMoney']);
            Db::table('ul_order_user')
                ->where('open_id',$data['open_id'])
                ->inc('money',$dh_money)
                ->update();
//        return $user_coin;
            $money = floatval($user_info['money'])+floatval($dh_money);
            if($user_coin<0){
//                return json(['code'=>0,'msg'=>'金币余额不足']);
                $value = json_encode(['code'=>0,'msg'=>'金币余额不足']);
            }else{
                Db::table('ul_order_user')
                    ->where('open_id',$data['open_id'])
                    ->dec('coin_num',floatval($dh_money)*floatval($bl['coinToMoney']))
                    ->update();
            }
            $user_info = Db::table('ul_order_user')
                ->where('open_id',$data['open_id'])
                ->find();
            $later = $user_info['money'];
            $insertID = Db::table('coin_info')->insertGetId(['coin_num'=>$data['num'],'fs'=>'兑换'.$dh_money.'元','title'=>'金币兑换余额','code'=>1,'real'=>$dh_money*$bl['coinToMoney']]);
            Db::table('moneyInfo')->insert(['code'=>0,'coinf_id'=>$insertID,'open_id'=>$data['open_id'],'before'=>$before,'later'=>$later,'money'=>$dh_money]);
//            return json(['code'=>200,'msg'=>'恭喜您，成功兑换','data'=>$user_coin,'dh_money'=>$dh_money,'coin_num'=>$data['num'],'money'=>$money,'user_info'=>$user_info]);
            $value = json_encode(['code'=>200,'msg'=>'恭喜您，成功兑换','data'=>$user_coin,'dh_money'=>$dh_money,'coin_num'=>$data['num'],'money'=>$money,'user_info'=>$user_info]);*/
        }
        finally
        {
            Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
            $job->delete();
            Cache::delete($data['queueKey']);
        }
    }


    /*
     * 余额充值游戏队列逻辑
     * */
    public function task3(Job $job, $data){
        $jobid = $job->getJobId();
        try {
            $value = json_encode(['code' => 0, 'msg' => '操作频繁']);
            /*$money = $data['czje'];
            $user_info = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
            if($user_info['money']>=$data['czje']){
                $save = Db::table('yxcz')->insert($data);
                if($save){
                    Db::table('ul_order_user')->where('open_id',$data['open_id'])->dec('money',$data['czje'])->update();
                    $data = Db::table('ul_order_user')->where('open_id',$data['open_id'])->find();
                    Db::table('moneyInfo')->insert(['code'=>1,'money'=>$money]);
                    return json(['code'=>200,'msg'=>'充值成功','data'=>$data]);
                }else{
                    return json(['code'=>0,'msg'=>'充值失败']);
                }
            }else{
                return json(['code'=>1,'msg'=>'余额不足']);
            }*/
        }
        finally
        {
            Db::table('queue_query')->insert(['key'=>$jobid,'value'=>$value]);
            $job->delete();
            Cache::delete($data['queueKey']);
        }
    }

    /*
     * 沙巴克奖励队列逻辑
     * */

    public function getData($queueData ){
        // 提取第一个元素，即序列化的 JSON 字符串（注意：这里我们有一个字节字符串，需要解码为普通字符串）
        $jsonString = $queueData[0][0];
        $jsonString = mb_convert_encoding($jsonString, 'UTF-8', 'auto'); // 如果需要，将字节字符串转换为 UTF-8 字符串

// 将 JSON 字符串解码为 PHP 对象或数组
        $taskData = json_decode($jsonString, true); // 第二个参数为 true 时，将 JSON 解码为关联数组
        return $taskData;
    }
}