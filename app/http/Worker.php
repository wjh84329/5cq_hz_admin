<?php
namespace app\http;

use GatewayWorker\Lib\Gateway;
use app\worker\Events;

/**
 * GatewayWorker 配置类
 * 
 * 业务逻辑已迁移到 app\worker\Events
 * 此类仅用于配置，实际事件处理在 Events 类中
 */
class Worker
{
    /**
     * 对外推送消息接口
     * 
     * 用于 HTTP 或其他服务向 WebSocket 客户端推送消息
     * 
     * @param string $uid 用户 ID (open_id)
     * @param string|array $message 消息内容
     * @return bool
     */
    public static function sendMessageByUid($uid, $message)
    {
        return Events::sendMessageByUid($uid, $message);
    }
}