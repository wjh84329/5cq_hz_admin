<?php

namespace app\admin\controller;

use app\admin\model\PaymentOrder;
use think\facade\Config;
use think\facade\Db;
use think\facade\Request;
use EasyWeChat\Factory;

class Payment
{
    /**
     * 生成支付二维码
     */
    public function createQrcode()
    {
        $request = Request::instance();
        $amount = $request->post('amount', 0);
        $description = $request->post('description', '');
        $user_id = $request->post('user_id', 0);

        if ($amount <= 0) {
            return json(['code' => 0, 'msg' => '金额必须大于0']);
        }

        try {
            // 生成订单号
            $out_trade_no = 'PAY' . date('YmdHis') . mt_rand(1000, 9999);

            // 获取当前域名
            $domain = $this->getCurrentDomain();
            $notify_url = $domain . '/cq/payment/notify';

            // 获取微信配置
            $config = Config::get('wechat');
            $config['notify_url'] = $notify_url;

            $app = Factory::payment($config);

            // 调用微信统一下单接口
            $result = $app->order->unify([
                'body'             => $description ?: '充值',
                'out_trade_no'     => $out_trade_no,
                'total_fee'        => intval($amount * 100), // 转换为分
                'spbill_create_ip' => $request->ip(),
                'notify_url'       => $notify_url,
                'trade_type'       => 'NATIVE', // 扫码支付
            ]);

            if ($result['return_code'] == 'SUCCESS' && $result['result_code'] == 'SUCCESS') {
                // 保存订单到数据库
                PaymentOrder::create([
                    'out_trade_no'  => $out_trade_no,
                    'user_id'       => $user_id,
                    'amount'        => $amount,
                    'description'   => $description,
                    'code_url'      => $result['code_url'],
                    'status'        => 0, // 0=待支付
                    'create_time'   => time(),
                ]);

                return json([
                    'code' => 1,
                    'msg'  => '生成成功',
                    'data' => [
                        'code_url'     => $result['code_url'],
                        'out_trade_no' => $out_trade_no,
                    ]
                ]);
            } else {
                return json([
                    'code' => 0,
                    'msg'  => $result['err_code_des'] ?? '生成失败'
                ]);
            }
        } catch (\Exception $e) {
            return json(['code' => 0, 'msg' => $e->getMessage()]);
        }
    }

    /**
     * 查询订单状态
     */
    public function queryOrder()
    {
        $out_trade_no = Request::instance()->post('out_trade_no', '');

        if (!$out_trade_no) {
            return json(['code' => 0, 'msg' => '订单号不能为空']);
        }

        try {
            $config = Config::get('wechat');
            $app = Factory::payment($config);

            $result = $app->order->queryByOutTradeNumber($out_trade_no);

            if ($result['return_code'] == 'SUCCESS') {
                $trade_state = $result['trade_state'] ?? 'NOTPAY';
                
                // 更新本地订单状态
                if ($trade_state == 'SUCCESS') {
                    PaymentOrder::where('out_trade_no', $out_trade_no)
                        ->update(['status' => 1, 'pay_time' => time()]);
                }

                return json([
                    'code' => 1,
                    'msg'  => '查询成功',
                    'data' => ['trade_state' => $trade_state]
                ]);
            } else {
                return json(['code' => 0, 'msg' => '查询失败']);
            }
        } catch (\Exception $e) {
            return json(['code' => 0, 'msg' => $e->getMessage()]);
        }
    }

    /**
     * 获取当前域名
     */
    private function getCurrentDomain()
    {
        $request = Request::instance();
        $scheme = $request->scheme();
        $host = $request->host();
        return $scheme . '://' . $host;
    }
}
