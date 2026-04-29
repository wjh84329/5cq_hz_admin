<?php

namespace app\service;

use think\facade\Cache;

class UserDeviceSession
{
    private const DEVICE_CACHE_PREFIX = 'hz_device_login_';
    private const USER_CACHE_PREFIX = 'user_';
    private const DEVICE_TTL = 86400;

    public static function normalizeDeviceId($deviceId): string
    {
        $deviceId = trim((string)$deviceId);
        if ($deviceId === '') {
            return '';
        }

        if (strlen($deviceId) > 128) {
            $deviceId = substr($deviceId, 0, 128);
        }

        return $deviceId;
    }

    public static function extractDeviceIdFromRequest($request): string
    {
        if (!$request) {
            return '';
        }

        return self::normalizeDeviceId(
            $request->param('device_id', $request->header('X-Device-Id', ''))
        );
    }

    public static function refreshLogin(string $deviceId, string $openId, string $token, int $ttl = self::DEVICE_TTL): void
    {
        $deviceId = self::normalizeDeviceId($deviceId);
        $openId = trim($openId);
        $token = trim($token);

        if ($deviceId === '' || $openId === '' || $token === '') {
            return;
        }

        Cache::store('redis')->set(self::getDeviceCacheKey($deviceId), [
            'device_id' => $deviceId,
            'open_id' => $openId,
            'token' => $token,
            'updated_at' => time(),
        ], $ttl > 0 ? $ttl : self::DEVICE_TTL);
    }

    public static function syncLogin(string $deviceId, string $openId, string $token): array
    {
        $deviceId = self::normalizeDeviceId($deviceId);
        $openId = trim($openId);
        $token = trim($token);

        $result = [
            'device_id' => $deviceId,
            'forced_logout_open_id' => '',
            'forced' => false,
        ];

        if ($deviceId === '' || $openId === '' || $token === '') {
            return $result;
        }

        $previous = Cache::store('redis')->get(self::getDeviceCacheKey($deviceId));
        $previousOpenId = '';
        $previousToken = '';

        if (is_array($previous)) {
            $previousOpenId = trim((string)($previous['open_id'] ?? ''));
            $previousToken = trim((string)($previous['token'] ?? ''));
        }

        if ($previousOpenId !== '' && $previousOpenId !== $openId && $previousToken !== '') {
            $currentPreviousToken = (string)Cache::store('redis')->get(self::getUserTokenCacheKey($previousOpenId));

            if ($currentPreviousToken !== '' && hash_equals($currentPreviousToken, $previousToken)) {
                Cache::store('redis')->delete(self::getUserTokenCacheKey($previousOpenId));
                self::notifyForcedLogout($previousOpenId);
                $result['forced_logout_open_id'] = $previousOpenId;
                $result['forced'] = true;
            }
        }

        self::refreshLogin($deviceId, $openId, $token);

        return $result;
    }

    public static function buildForcedLogoutMessage(string $msg = '同一设备已有新账号登录，请重新登录'): string
    {
        return json_encode([
            'code' => 401,
            'type' => 'logout',
            'msg' => $msg,
            'reason' => 'device_login_replaced',
        ], JSON_UNESCAPED_UNICODE);
    }

    public static function notifyForcedLogout(string $openId, string $msg = '同一设备已有新账号登录，请重新登录'): void
    {
        $openId = trim($openId);
        if ($openId === '') {
            return;
        }

        GatewayPush::sendMessageByUid($openId, self::buildForcedLogoutMessage($msg));
    }

    private static function getDeviceCacheKey(string $deviceId): string
    {
        return self::DEVICE_CACHE_PREFIX . $deviceId;
    }

    private static function getUserTokenCacheKey(string $openId): string
    {
        return self::USER_CACHE_PREFIX . $openId;
    }
}
