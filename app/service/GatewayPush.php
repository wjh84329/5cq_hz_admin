<?php
namespace app\service;

use app\worker\Events;
use GatewayWorker\Lib\Gateway;
use think\facade\Config;

class GatewayPush
{
    private static function initGatewayClient(): void
    {
        $registerAddress = (string)Config::get('gateway_worker.registerAddress', '');
        if ($registerAddress !== '') {
            Gateway::$registerAddress = $registerAddress;
        }
    }

    public static function sendMessageByUid($uid, $message)
    {
        try {
            self::initGatewayClient();
            return Events::sendMessageByUid($uid, $message);
        } catch (\Throwable $e) {
            return false;
        }
    }

    public static function broadcastLatestLog()
    {
        try {
            self::initGatewayClient();
            Events::broadcastLatestLog();
        } catch (\Throwable $e) {
        }
    }

    public static function sendUserInfoUpdate($open_id)
    {
        try {
            self::initGatewayClient();
            Events::sendUserInfoUpdate($open_id);
        } catch (\Throwable $e) {
            return false;
        }

        return true;
    }
}
