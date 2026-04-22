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

    /**
     * 广播最新日志给所有在线用户
     * 
     * 在日志入库时调用此方法
     */
    public static function broadcastLatestLog()
    {
        Events::broadcastLatestLog();
    }

    /**
     * 推送用户信息更新给指定用户
     * 
     * 在更新 ul_order_user 表后调用此方法
     * 
     * @param string $open_id
     */
    public static function sendUserInfoUpdate($open_id)
    {
        Events::sendUserInfoUpdate($open_id);
    }
}