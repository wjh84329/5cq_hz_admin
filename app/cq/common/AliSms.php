<?php

namespace app\cq\common;

use AlibabaCloud\SDK\Dysmsapi\V20170525\Dysmsapi;
use Darabonba\OpenApi\Models\Config;
use AlibabaCloud\SDK\Dysmsapi\V20170525\Models\SendSmsRequest;
use think\facade\Db;

class AliSms
{

    /**
     * 使用AK&SK初始化账号Client
     * @param string $accessKeyId
     * @param string $accessKeySecret
     * @return Dysmsapi Client
     */
    public static function createClient(string $accessKeyId, string $accessKeySecret): Dysmsapi
    {
        $config = new Config([
            // 您的AccessKey ID
            "accessKeyId" => config('alicode.accessKeyId'),
            // 您的AccessKey Secret
            "accessKeySecret" => config('alicode.accessKeySecret')
        ]);
        // 访问的域名
        $config->endpoint = "dysmsapi.aliyuncs.com";
        return new Dysmsapi($config);
    }

    /**
     * @param string[] $args
     * @return void
     */
    public static function main(array $args)
    {
//        $config = \think\facade\Config::get('alicode');
        $datalist = Db::table('api_config')->find();
        $config = config('alicode');
        $client = self::createClient("accessKeyId", "accessKeySecret");
        //SMS_157225731
        $sendSmsRequest = new SendSmsRequest([
            "phoneNumbers" => $args['phone'],
            "signName" => $config['signName'],
            "templateCode" => $config['templateCode'],
            "templateParam" => json_encode(['code'=>$args['code']])
        ]);
        $result = $client->sendSms($sendSmsRequest);
        if ($result->body->message == 'OK' && $result->body->code == 'OK') {
            return ['code' => 200,'msg'=>'success'];
        }
        if ($result->body->code == 'isv.MOBILE_NUMBER_ILLEGAL') {
            return ['code' => 0, 'msg' => '手机号码格式不正确'];
        }
        return ['code' => 0, 'msg' => '短信发送失败，网络繁忙'];
    }
}

