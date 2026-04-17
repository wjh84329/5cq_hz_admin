define(["jquery", "easy-admin"], function ($, ea) {

    var payment_init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'admin.payment/index',
    };

    var Controller = {
        /**
         * 生成支付二维码
         */
        createQrcode: function () {
            var amount = prompt('请输入支付金额（元）:', '');
            if (!amount || isNaN(amount) || amount <= 0) {
                ea.alert('请输入正确的金额');
                return;
            }

            var description = prompt('请输入订单描述:', '充值');

            ea.loading(true);
            $.ajax({
                url: ea.url('admin.payment/createQrcode'),
                type: 'POST',
                dataType: 'json',
                data: {
                    amount: amount,
                    description: description,
                    user_id: 0
                },
                success: function (res) {
                    ea.loading(false);
                    if (res.code == 1) {
                        // 显示二维码
                        showQrcodeModal(res.data);
                    } else {
                        ea.alert(res.msg || '生成失败');
                    }
                },
                error: function () {
                    ea.loading(false);
                    ea.alert('请求失败');
                }
            });
        },

        /**
         * 查询订单状态
         */
        queryOrder: function () {
            var out_trade_no = prompt('请输入订单号:', '');
            if (!out_trade_no) {
                return;
            }

            ea.loading(true);
            $.ajax({
                url: ea.url('admin.payment/queryOrder'),
                type: 'POST',
                dataType: 'json',
                data: {
                    out_trade_no: out_trade_no
                },
                success: function (res) {
                    ea.loading(false);
                    if (res.code == 1) {
                        var state = res.data.trade_state;
                        var stateText = state == 'SUCCESS' ? '已支付' : '待支付';
                        ea.alert('订单状态：' + stateText);
                    } else {
                        ea.alert(res.msg || '查询失败');
                    }
                },
                error: function () {
                    ea.loading(false);
                    ea.alert('请求失败');
                }
            });
        }
    };

    /**
     * 显示二维码弹窗
     */
    function showQrcodeModal(data) {
        var html = '<div style="text-align: center; padding: 20px;">' +
            '<p>订单号：' + data.out_trade_no + '</p>' +
            '<img src="' + data.code_url + '" style="width: 300px; height: 300px; margin: 20px 0;" />' +
            '<p style="color: #999; font-size: 12px;">请使用微信扫描二维码完成支付</p>' +
            '</div>';

        layer.open({
            type: 1,
            title: '支付二维码',
            content: html,
            area: ['400px', '500px'],
            btn: ['关闭'],
            yes: function (index) {
                layer.close(index);
                // 支付完成后可以轮询查询订单状态
                pollOrderStatus(data.out_trade_no);
            }
        });
    }

    /**
     * 轮询查询订单状态
     */
    function pollOrderStatus(out_trade_no) {
        var pollCount = 0;
        var maxPoll = 60; // 最多轮询60次（5分钟）

        var timer = setInterval(function () {
            pollCount++;

            $.ajax({
                url: ea.url('cq.payment/queryStatus'),
                type: 'GET',
                dataType: 'json',
                data: {
                    out_trade_no: out_trade_no
                },
                success: function (res) {
                    if (res.code == 1 && res.data.status == 1) {
                        clearInterval(timer);
                        ea.alert('支付成功！金额：¥' + res.data.amount);
                    }
                }
            });

            if (pollCount >= maxPoll) {
                clearInterval(timer);
            }
        }, 5000); // 每5秒查询一次
    }

    return Controller;
});
