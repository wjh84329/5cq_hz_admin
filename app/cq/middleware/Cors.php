<?php

namespace app\cq\middleware;

use app\Request;

class Cors
{
    public function handle(Request $request, \Closure $next)
    {
        $origin = (string)$request->header('origin', '');

        $headers = [
            'Access-Control-Allow-Origin' => $origin !== '' ? $origin : '*',
            'Access-Control-Allow-Credentials' => 'true',
            'Access-Control-Allow-Methods' => 'GET, POST, PATCH, PUT, DELETE, OPTIONS',
            'Access-Control-Allow-Headers' => 'Authorization, Content-Type, If-Match, If-Modified-Since, If-None-Match, If-Unmodified-Since, X-CSRF-TOKEN, X-Requested-With, token, boxVersion',
            'Access-Control-Max-Age' => '1800',
        ];

        if (strtoupper($request->method()) === 'OPTIONS') {
            return response('', 204)->header($headers);
        }

        return $next($request)->header($headers);
    }
}
