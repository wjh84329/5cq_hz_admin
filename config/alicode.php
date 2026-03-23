<?php

return[
    // 您的AccessKey ID
    "accessKeyId" => getenv('ALIBABA_CLOUD_ACCESS_KEY_ID') ?: '',
    // 您的AccessKey Secret
    "accessKeySecret" => getenv('ALIBABA_CLOUD_ACCESS_KEY_SECRET') ?: '',
    // 访问的域名
    'endpoint' => "dysmsapi.aliyuncs.com",
    // 签名名称
    'signName' => "云南蓝华科技有限公司",
// 模板code
    'templateCode' => "SMS_272545656",
];