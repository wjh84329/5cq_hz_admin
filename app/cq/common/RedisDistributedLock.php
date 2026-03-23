<?php

namespace app\cq\common;

class RedisDistributedLock
{
    private $client;
    private $key;
    private $timeout; // 锁的超时时间，单位秒，结合场景而定
    private $isWaiting; // 是否等待，默认是0，不等待
    private $retryInterval; // 重试间隔，单位毫秒，默认1000是1秒,一般默认1000就行，整好是1秒

    public function __construct($key, $timeout = 30, $isWaiting = 0, $retryInterval = 1000)
    {
        $this->key = $key;
        $this->timeout = $timeout;
        $this->isWaiting = $isWaiting;
        $this->retryInterval = $retryInterval;
        $redis = new \Redis();
        try {
            $redis->connect(config("session")['host'], config("session")['port']);
            if (!empty(config("session")['password'])) {
                $redis->auth(config("session")['password']); // 密码验证
            }
            $this->client = $redis;
        } catch (\Exception $e) {
            throw new \Exception("Redis 连接或认证失败: " . $e->getMessage());
        }
    }

    public function acquire()
    {
        if ((bool)$this->isWaiting) {
            $startTime = microtime(true);
            do {
                if ($this->tryAcquire()) {
                    return true;
                }
                usleep($this->retryInterval * 1000); // 等待一段时间再试
            } while (microtime(true) - $startTime < $this->timeout);
            throw new \Exception('无法获取锁');
        } else {
            return $this->tryAcquire();
        }
    }

    public function release()
    {
        try {
            return $this->client->del($this->key);
        } catch (\Exception $e) {
            throw new \Exception("释放锁失败: " . $e->getMessage());
        }
    }

    private function tryAcquire()
    {
        try {
            return (bool)$this->client->set($this->key, 1, ['nx', 'ex' => $this->timeout]);
        } catch (\Exception $e) {
            throw new \Exception("尝试获取锁失败: " . $e->getMessage());
        }
    }

    public function getTtl()
    {
        try {
            $ttl = $this->client->ttl($this->key);
            if ($ttl === -1) {
                throw new \Exception("锁不存在或没有设置过期时间");
            }
            return $ttl;
        } catch (\Exception $e) {
            throw new \Exception("获取锁的剩余生存时间失败: " . $e->getMessage());
        }
    }
}