<?php

use think\facade\Route;

Route::view('/', 'welcome', [
    'version' => time(),
    'data'    => [
        'description'        => '5CQ',
        'system_description' => '框架主要使用ThinkPHP6.0 + layui，拥有完善的权限的管理模块以及敏捷的开发方式，让你开发起来更加的舒服。项目以及文档还在持续完善，请保持关注。',
    ],
    'navbar'  => [
        [
            'name'   => '首页',
            'active' => true,
            'href'   => 'http://cqadmin.bluechs.com/',
            'target' => '_self',
        ]
    ],
]);
