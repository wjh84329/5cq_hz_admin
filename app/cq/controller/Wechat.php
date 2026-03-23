<?php

namespace app\cq\controller;

use app\BaseController;
use EasyWeChat\OfficialAccount\Application;
use think\facade\Config;
use EasyWeChat\Factory;
use think\facade\Db;
use think\facade\Session;

class Wechat extends BaseController
{
    public function index(){
//        $config = Config::get('wechat');
        $data_list = Db::table('api_config')->find(1);
//        $config = Config::get('wechat');
        $config = [
            /**
             * 账号基本信息，请从微信公众平台/开放平台获取
             */
            'app_id'  => $data_list['app_id'],         // AppID
            'secret'  => $data_list['secret'],     // AppSecret
            'token'   => $data_list['token'],          // Token
            'aes_key' => $data_list['aes_key'],                    // EncodingAESKey，兼容与安全模式下请一定要填写！！！
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'redirect_url' => $data_list['redirect_url'],
            ],
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file' => __DIR__ . 'log/'.date('Ymd').'/wechat_debug.log',
            ],

            /**
             * 接口请求相关配置，超时时间等，具体可用参数请参考：
             * https://github.com/symfony/symfony/blob/5.3/src/Symfony/Contracts/HttpClient/HttpClientInterface.php
             */
            'http' => [
                'timeout' => 5.0,
                // 'base_uri' => 'https://api.weixin.qq.com/', // 如果你在国外想要覆盖默认的 url 的时候才使用，根据不同的模块配置不同的 uri

                'retry' => true, // 使用默认重试配置
                //  'retry' => [
                //      // 仅以下状态码重试
                //      'http_codes' => [429, 500]
                //       // 最大重试次数
                //      'max_retries' => 3,
                //      // 请求间隔 (毫秒)
                //      'delay' => 1000,
                //      // 如果设置，每次重试的等待时间都会增加这个系数
                //      // (例如. 首次:1000ms; 第二次: 3 * 1000ms; etc.)
                //      'multiplier' => 3
                //  ],
            ],
        ];
        $app = Factory::officialAccount($config);
        $app->server->push(function ($message) {
            switch ($message['MsgType']) {
                case 'event':
//                    return $message['Ticket'];
//                    Session::set($message['Ticket'],$message['FromUserName']);
//                    if($message['Event']=='subscribe' || $message['Event']=='SCAN'){
                    if($message['Event']=='CLICK'){
                        switch ($message['EventKey']){
                            case 'V1001_TODAY_MUSIC':
                                $basic = basic_info();
                                $qq = $basic['qq'];
                                return '客服QQ：'.$qq;
                            default:
                                break;
                        }
                    }else{
                        Db::table('reg')->where('key',$message['Ticket'])->update(['open_id'=>$message['FromUserName']]);
                        $info = Db::table('ul_order_user')->where('open_id',$message['FromUserName'])->findOrEmpty();
                        if(empty($info)){
                            $url = 'https://hz.5cq.net/5cq/index.html';
                            $content = sprintf("<a href='https://hz.5cq.net/5cq/index.html'>点击登录盒子</a>");
                            return $content;
                        }else{
                            return '登录成功';
                        }
                    }
//                    }
                    break;
                case 'text':
                    return '收到文字消息';
                    break;
                case 'image':
                    return '收到图片消息';
                    break;
                case 'voice':
                    return '收到语音消息';
                    break;
                case 'video':
                    return '收到视频消息';
                    break;
                case 'location':
                    return '收到坐标消息';
                    break;
                case 'link':
                    return '收到链接消息';
                    break;
                default:
                    return '收到其它消息';
                    break;
            }
        });
        $response = $app->server->serve();
//        $response->send();exit; // Laravel 里请使用：return $response;
        return $response->send();
    }

    /*
     * 生成菜单
     * */
    public function create_menu(){
//        $config = Config::get('wechat');
        $data_list = Db::table('api_config')->where('id',1)->find();
//        $config = Config::get('wechat');
        $config = [
            /**
             * 账号基本信息，请从微信公众平台/开放平台获取
             */
            'app_id'  => $data_list['app_id'],         // AppID
            'secret'  => $data_list['secret'],     // AppSecret
            'token'   => $data_list['token'],          // Token
            'aes_key' => $data_list['aes_key'],                    // EncodingAESKey，兼容与安全模式下请一定要填写！！！
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                'redirect_url' => $data_list['redirect_url'],
            ],
            // 指定 API 调用返回结果的类型：array(default)/collection/object/raw/自定义类名
            'response_type' => 'array',
            'log' => [
                'level' => 'debug',
                'file' => __DIR__ . 'log/'.date('Ymd').'/wechat_debug.log',
            ],

            /**
             * 接口请求相关配置，超时时间等，具体可用参数请参考：
             * https://github.com/symfony/symfony/blob/5.3/src/Symfony/Contracts/HttpClient/HttpClientInterface.php
             */
            'http' => [
                'timeout' => 5.0,
                // 'base_uri' => 'https://api.weixin.qq.com/', // 如果你在国外想要覆盖默认的 url 的时候才使用，根据不同的模块配置不同的 uri

                'retry' => true, // 使用默认重试配置
                //  'retry' => [
                //      // 仅以下状态码重试
                //      'http_codes' => [429, 500]
                //       // 最大重试次数
                //      'max_retries' => 3,
                //      // 请求间隔 (毫秒)
                //      'delay' => 1000,
                //      // 如果设置，每次重试的等待时间都会增加这个系数
                //      // (例如. 首次:1000ms; 第二次: 3 * 1000ms; etc.)
                //      'multiplier' => 3
                //  ],
            ],
        ];
        $app = Factory::officialAccount($config);
        $buttons = [
            [
                "name"       => "官网网站",
                "sub_button" => [
                    [
                        "type" => "view",
                        "name" => "用户中心",
//                        "url"  => $data_list['redirect_url'],
                        "url" => 'https://hz.5cq.net/5cq/index.html',
                        "key" => "V1001_GOOD"
                    ],
                ],
            ],
            [
                "type" => "click",
                "name" => "联系客服",
                "key"  => "V1001_TODAY_MUSIC"
            ],
        ];
        $app->menu->create($buttons);
        /*if($app){
            return json(['code'=>200,'msg'=>'创建成功']);
        }else{
            return json(['code'=>0,'msg'=>'创建失败']);
        }*/
    }
}