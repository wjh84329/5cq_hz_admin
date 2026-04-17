<?php

namespace app\cq\controller;

use app\admin\model\PaymentOrder;
use think\facade\Config;
use think\facade\Db;
use think\facade\Log;
use EasyWeChat\Factory;

class Payment
{
    /**
     * 支付回调处理
     */
    public function notify()
    {
        try {
            $config = Config::get('wechat');
            $app = Factory::payment($config);

            // 处理支付回调
            $response = $app->server->handlePaid(function ($message) {
                Log::info('支付回调消息', $message);

                $out_trade_no = $message['out_trade_no'] ?? '';
                $transaction_id = $message['transaction_id'] ?? '';

                if (!$out_trade_no) {
                    return false;
                }

                // 查询本地订单
                $order = PaymentOrder::where('out_trade_no', $out_trade_no)->findOrEmpty();

                if ($order->isEmpty()) {
                    Log::error('订单不存在', ['out_trade_no' => $out_trade_no]);
                    return false;
                }

                // 防止重复处理
                if ($order['status'] == 1) {
                    Log::info('订单已处理', ['out_trade_no' => $out_trade_no]);
                    return true;
                }

                // 更新订单状态
                $order->update([
                    'status'         => 1, // 1=已支付
                    'transaction_id' => $transaction_id,
                    'pay_time'       => time(),
                ]);

                // 触发业务逻辑（充值、发货等）
                $this->handlePaymentSuccess($order);

                return true;
            });

            return $response;
        } catch (\Exception $e) {
            Log::error('支付回调异常', ['error' => $e->getMessage()]);
            return response('fail');
        }
    }

    /**
     * 处理支付成功后的业务逻辑
     */
    private function handlePaymentSuccess($order)
    {
        try {
            // 这里可以添加充值、发货等业务逻辑
            // 例如：给用户账户充值
            if ($order['user_id']) {
                // 更新用户余额或积分
                Db::table('ul_order_user')
                    ->where('id', $order['user_id'])
                    ->inc('balance', $order['amount'])
                    ->update();

                Log::info('用户充值成功', [
                    'user_id' => $order['user_id'],
                    'amount'  => $order['amount']
                ]);
            }
        } catch (\Exception $e) {
            Log::error('处理支付成功业务逻辑异常', ['error' => $e->getMessage()]);
        }
    }

    /**
     * 查询订单状态（前端轮询用）
     */
    public function queryStatus()
    {
        $out_trade_no = request()->get('out_trade_no', '');

        if (!$out_trade_no) {
            return json(['code' => 0, 'msg' => '订单号不能为空']);
        }

        $order = PaymentOrder::where('out_trade_no', $out_trade_no)->findOrEmpty();

        if ($order->isEmpty()) {
            return json(['code' => 0, 'msg' => '订单不存在']);
        }

        return json([
            'code' => 1,
            'data' => [
                'status' => $order['status'], // 0=待支付, 1=已支付
                'amount' => $order['amount'],
            ]
        ]);
    }
}
