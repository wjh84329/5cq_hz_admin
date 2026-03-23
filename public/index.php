<?php

// [ 应用入口文件 ]
namespace think;

//支持跨域
header("Access-Control-Allow-Origin:*");
header('Access-Control-Allow-Methods:*');
header('Access-Control-Allow-Headers:x-requested-with, content-type,token');

require __DIR__ . '/../vendor/autoload.php';

// 声明全局变量
define('DS', DIRECTORY_SEPARATOR);
define('ROOT_PATH', __DIR__ . DS . '..' . DS);
define('REUQEST_UID', uniqid());
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS'); // 允许的请求方法
header('Access-Control-Allow-Headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token,boxVersion'); // 允许的请求头字段，添加'token'
if($_SERVER['REQUEST_METHOD'] == 'OPTIONS'){
    header("Access-Control-Allow-Headers: *");
    header('Access-Control-Allow-Methods: GET, POST, PUT,DELETE,OPTIONS,PATCH');
    exit;
}
// 执行HTTP应用并响应
$http = (new App())->http;

$response = $http->run();

$response->send();

$http->end($response);
