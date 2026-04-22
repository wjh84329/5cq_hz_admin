define(["jquery", "easy-admin", "vue"], function ($, ea, Vue) {

    var form = layui.form;

    var Controller = {
        index: function () {

            $('.show-type-item').hide();

            // 充值按钮点击事件
            $('#rechargeBtn').on('click', function () {
                showRechargeModal();
            });

            ea.listen();
        }
    };

    /**
     * 显示充值弹窗
     */
    function showRechargeModal() {
        var html = '<div style="padding: 20px;">' +
            '<div class="layui-form">' +
            '<div class="layui-form-item">' +
            '<label class="layui-form-label">充值金额（元）</label>' +
            '<div class="layui-input-block">' +
            '<input type="number" id="rechargeAmount" class="layui-input" placeholder="请输入充值金额" min="0.01" step="0.01" value="1">' +
            '</div>' +
            '</div>' +
            '<div class="layui-form-item">' +
            '<label class="layui-form-label">充值描述</label>' +
            '<div class="layui-input-block">' +
            '<input type="text" id="rechargeDesc" class="layui-input" placeholder="请输入充值描述" value="账户充值">' +
            '</div>' +
            '</div>' +
            '<div id="qrcodeContainer" style="display:none; text-align: center; margin-top: 20px;">' +
            '<p style="margin-bottom: 10px;">请使用微信扫描二维码完成支付</p>' +
            '<img id="qrcodeImg" src="" style="width: 250px; height: 250px;" />' +
            '<p id="orderNo" style="color: #999; font-size: 12px; margin-top: 10px;"></p>' +
            '</div>' +
            '</div>' +
            '</div>';

        layer.open({
            type: 1,
            title: '账户充值',
            content: html,
            area: ['400px', '550px'],
            btn: ['生成二维码', '关闭'],
            yes: function (index) {
                generateQrcode(index);
            },
            btn2: function (index) {
                layer.close(index);
            }
        });
    }

    /**
     * 生成二维码
     */
    function generateQrcode(layerIndex) {
        var amount = $('#rechargeAmount').val();
        var description = $('#rechargeDesc').val();

        if (!amount || amount <= 0) {
            layer.alert('请输入正确的充值金额');
            return;
        }

        var loadingIndex = layer.load(2);
        $.ajax({
            url: '/admin/payment/createQrcode',
            type: 'POST',
            dataType: 'json',
            data: {
                amount: amount,
                description: description,
                user_id: 0
            },
            success: function (res) {
                layer.close(loadingIndex);
                if (res.code == 1) {
                    // 显示二维码
                    $('#qrcodeImg').attr('src', res.data.code_url);
                    $('#orderNo').text('订单号：' + res.data.out_trade_no);
                    $('#qrcodeContainer').show();

                    // 修改按钮为关闭
                    $('.layui-layer-btn .layui-layer-btn0').text('关闭');
                    $('.layui-layer-btn .layui-layer-btn0').off('click').on('click', function () {
                        layer.close(layerIndex);
                        // 支付完成后轮询查询订单状态
                        pollOrderStatus(res.data.out_trade_no);
                    });

                    // 禁用输入框
                    $('#rechargeAmount').prop('disabled', true);
                    $('#rechargeDesc').prop('disabled', true);
                } else {
                    layer.alert(res.msg || '生成失败');
                }
            },
            error: function () {
                layer.close(loadingIndex);
                layer.alert('请求失败');
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
                url: '/cq/payment/queryStatus',
                type: 'GET',
                dataType: 'json',
                data: {
                    out_trade_no: out_trade_no
                },
                success: function (res) {
                    if (res.code == 1 && res.data.status == 1) {
                        clearInterval(timer);
                        layer.alert('充值成功！金额：¥' + res.data.amount, function () {
                            location.reload();
                        });
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
