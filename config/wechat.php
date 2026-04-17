<?php

return [
    /**
     * 账号基本信息，请从微信公众平台/开放平台获取
     */
    // 'app_id'  => 'wx439e2320cae41ada',         // AppID
    // 'secret'  => '6b95a7778eab3cb59c7038e8de839578',     // AppSecret
    // 'token'   => 'bluechswechat',          // Token
    'app_id'  => 'wx55a3ccd97268e1d0',         // AppID
    'secret'  => '78e100f6f8bd541794de954c4d5109d8',     // AppSecret
    'token'   => '5cqchswechat',          // Token
    'aes_key' => '',                    // EncodingAESKey，兼容与安全模式下请一定要填写！！！
    'oauth' => [
        'scopes'   => ['snsapi_userinfo'],
        'redirect_url' => 'http://cqadmin.bluechs.com/cq/user/a',
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
    'mch_id'      => env('WECHAT_MCH_ID', 'your_merchant_id'),//商户ID
    'key'         => env('WECHAT_API_KEY', 'your_api_key'),//商户密钥
    'cert_path'   => env('WECHAT_CERT_PATH', storage_path('certs/apiclient_cert.pem')),//商户证书路径，退款等需要用到
    'key_path'    => env('WECHAT_KEY_PATH', storage_path('certs/apiclient_key.pem')),//商户证书密钥路径，退款等需要用到
];
