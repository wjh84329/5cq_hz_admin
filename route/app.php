<?php
use think\facade\Route;


Route::get('swagger', function() {
    $openapi = \OpenApi\scan([
        '../app/cq/controller',
//        '../app/apiweb/controller',
    ]);
    // $openapi = OpenApi\scan('../app');//当然,你也可以用这种相对路径的写法,但是我建议还是用上面,避免更换route路径后出现问题
    header('Content-Type: application/json');
    $res = $openapi->toJson();
    echo $res;
//        $url = 'http://cqadmin.bluechs.com/swagger-ui/index.html';
//        header('Location:'.$url);
});

Route::get('cs', function() {
    echo '1111';
});