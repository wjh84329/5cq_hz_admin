<?php
// 临时启动脚本：在 Windows 上以非守护进程方式启动 GatewayWorker（开发/测试用）
require __DIR__ . '/vendor/autoload.php';

use GatewayWorker\BusinessWorker;
use GatewayWorker\Gateway;
use GatewayWorker\Register;
use Workerman\Worker;

$config = require __DIR__ . '/config/gateway_worker.php';

$host = $config['host'] ?? '0.0.0.0';
$port = $config['port'] ?? 8215;
$protocol = $config['protocol'] ?? 'websocket';
$socket = !empty($config['socket']) ? $config['socket'] : ($protocol . '://' . $host . ':' . $port);

// 解析角色参数：register | business | gateway（默认 gateway）
$role = $argv[1] ?? 'gateway';

// 注册地址和 socket
$registerAddress = $config['registerAddress'] ?? '127.0.0.1:1236';

switch ($role) {
    case 'register':
        new Register('text://' . $registerAddress);
        echo "Starting Register at {$registerAddress}\n";
        break;

    case 'business':
        $bw = new BusinessWorker();
        if (!empty($config['businessWorker']) && is_array($config['businessWorker'])) {
            foreach ($config['businessWorker'] as $k => $v) {
                $bw->$k = $v;
            }
        }
        $bw->registerAddress = $registerAddress;
        echo "Starting BusinessWorker (foreground)\n";
        break;

    case 'gateway':
    default:
        $gateway = new Gateway($socket, $config['context'] ?? []);
        $gateway->name = $config['name'] ?? 'Gateway';
        $gateway->count = $config['count'] ?? 1;
        $gateway->lanIp = $config['lanIp'] ?? '127.0.0.1';
        $gateway->startPort = $config['startPort'] ?? 2000;
        $gateway->pingInterval = $config['pingInterval'] ?? 30;
        $gateway->pingNotResponseLimit = $config['pingNotResponseLimit'] ?? 0;
        $gateway->pingData = $config['pingData'] ?? '{"type":"ping"}';
        $gateway->registerAddress = $registerAddress;
        echo "Starting Gateway at {$socket} (foreground)\n";
        break;
}

// 在 Windows 上必须单进程文件启动一个组件，使用多个终端启动不同角色
echo "Note: on Windows start each component in its own terminal.\n";
Worker::runAll();
