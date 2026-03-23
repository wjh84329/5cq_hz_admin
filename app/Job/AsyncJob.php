<?php

namespace app\Job;

use think\facade\Cache;
use think\queue\Job;

class AsyncJob
{
    public function fire(Job $job, $data){
        $jobid = $job->getJobId();
        echo $jobid;
        try {
//            if (isset($data['type'])&&isset($data['open_id'])&&isset($data['coin_num'])) {
            if (isset($data['id'])) {
                echo '111';
                Cache::store('redis')->handler()->set('queue_'.$jobid,json(['code'=>0,'msg'=>'暂无数据']));
                $job->delete();
            }else{
                echo '222';
                $job->delete();
            }
        }catch (\Exception $e){
            echo '333';
            $job->delete();
        }
    }

    public function getData($queueData ){
        // 提取第一个元素，即序列化的 JSON 字符串（注意：这里我们有一个字节字符串，需要解码为普通字符串）
        $jsonString = $queueData[0][0];
        $jsonString = mb_convert_encoding($jsonString, 'UTF-8', 'auto'); // 如果需要，将字节字符串转换为 UTF-8 字符串

// 将 JSON 字符串解码为 PHP 对象或数组
        $taskData = json_decode($jsonString, true); // 第二个参数为 true 时，将 JSON 解码为关联数组
        return $taskData;
    }
}