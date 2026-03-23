<?php

namespace app\dev\route;

use think\facade\Route;

Route::get('hello',function (){
    return "hello,world";
});


/**
 * @OA\Info(
 *     title="CQ5",
 *     version="1.0"
 * )
 **/

Route::get('/swagger', function() {
    $openapi = \OpenApi\scan([
        '../app/cq/controller',
//        '../app/apiweb/controller',
    ]);
    header('Content-Type: application/x-yaml');
    $jsonString = $_SERVER['DOCUMENT_ROOT'].'/swagger.json';
    $res = file_put_contents($jsonString, $openapi->toJson());
    if ($res == true) {
        return redirect('http://cqadmin.bluechs.com/swagger-ui/dist/index.html');
    }
    echo $openapi->toJson();
});
