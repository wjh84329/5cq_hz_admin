<?php

namespace app\cq\middleware;

use app\Request;
use think\facade\Cache;
use think\facade\Db;
use think\facade\Queue;
use think\middleware\AllowCrossDomain;

class requestLogin
{
    // 携带open_id但不需要验证token的接口...
    protected $excludeUris = [
        'user/getWechatInfo',
        'user/setCoinShare',
    ];
    public function handle(Request $request, \Closure $next){
        // 设置 CORS 头部（通常在全局中间件或响应中设置更合适）
        /*$headers = [
            'Access-Control-Allow-Origin' => '*', // 或者使用具体的域名
            'Access-Control-Allow-Methods' => 'GET, POST, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers' => 'Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token,boxVersion',
            'Access-Control-Allow-Credentials' => 'true',
        ];*/
         // 设置响应头，允许跨域请求
        // header('Access-Control-Allow-Origin: *'); // 允许所有域名访问，实际项目中应限制为特定域名
        // header('Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS'); // 允许的请求方法
        // header('Access-Control-Allow-Headers: Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token,boxVersion'); // 允许的请求头字段，添加'token'

        //需要加入队列的接口
        $list = [
            'user/setCoin'=>'app\cq\Job\AsyncJob@task1',
            'user/jbdhye'=>'app\cq\Job\AsyncJob@task2',
            'user/yxcz'=>'app\cq\Job\AsyncJob@task3'
        ];

        //header添加token   （前端说自己完成，已弃用）
        // $response = $next($request);
        // foreach ($headers as $key => $value) {
        //     $response->header($key, $value);
        // }
        // $response = $next($request);

        // 检查请求是否应被排除
        if ($this->shouldExclude($request)) {
            return $next($request);
        }

        // 获取 Token
        $token = $request->header('token');
        //获取  boxVersion
        $version = $request->header('boxVersion');

        // 检查 open_id 是否存在
        $openId = $request->param('open_id');
        if (empty($openId)) {
            // 没有 open_id，直接放行
            return $next($request);
        }
        //检测是否有版本号
        if(empty($version) || is_null($version)){
            return json(['code' => 400, 'msg' => '请下载或更新到最新版本']);
        }
        $param = $request -> param();

        $uri = $request->url();
        // 防抖处理：2秒内不允许重复请求
        $debounceKey = 'debounce:' . $openId . ':' . md5($uri);
        $lastRequestTime = Cache::get($debounceKey);
        if ($lastRequestTime && (time() - $lastRequestTime < 2)) {
            return json(['code' => 429, 'msg' => '请勿重复操作'], 429);
        }
        Cache::set($debounceKey, time(), 2);
        //时间锁
        $requestTime = Cache::get($openId.$uri);
        // 检查 Redis 中是否存在该请求ID\
        $pathInfo = $request->pathinfo();

        // 从缓存中获取 Token
        $cachedToken = Cache::get('user_' . $openId);

        // 验证 Token
        if ($cachedToken === $token) {
            // 更新缓存（延长缓存时间）
            Cache::set('user_' . $openId, $token, 3600);
            if (array_key_exists($pathInfo,$list)&&$requestTime && time()-$requestTime <5) {
                $job = $list[$pathInfo];
                $param['queueKey'] = $openId.$uri;
                $jobId = Queue::push($job, $param);
                Cache::set($openId.$uri, time(), 60);
                return json(['code' => 0, 'msg' => '请求失败','jobID'=>$jobId]);
            }
            Cache::set($openId.$uri, time(), 60);
            $response = $next($request);
            Cache::delete($openId.$uri);
            return $response;
        }
        // Token 无效
        return json(['code' => 401, 'msg' => 'Token 无效,请重新登录'], 401);
    }

    protected function shouldExclude($request)
    {
        $pathInfo = $request->pathinfo();
        return in_array($pathInfo, $this->excludeUris);
    }
}