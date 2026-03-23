define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'coin.order/index',
        edit_url: 'coin.order/edit',
        delete_url: 'coin.order/delete',
        modify_url: 'coin.order/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: ['refresh',
                    'delete'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', title: 'ID',width: 60 },
                    { field: 'order_user_name', title: '下单用户'},
                    { field: 'order_user_photo', title: '下单用户头像', search: false, templet: ea.table.image,width: 120 },
                    { field: 'coin_goods_title', title: '商品名称',width: 100 },
                    { field: 'coin_goods_img', title: '商品图片', search: false, templet: ea.table.image,width: 100 },
                    { field: 'type', title: '订单类型',width: 100},
                    { field: 'statu', title: '订单状态' ,width: 100},
                    { field: 'consignee_name', title: '收货人姓名',width: 120},
                    { field: 'consignee_phone', title: '收货人电话',width: 120 },
                    { field: 'consignee_address', title: '收货人地址'},
                    { field: 'consignee_code', title: '邮编',width: 80 },
                    { field: 'courier_number', title: '快递单号' },
                    { field: 'order_time', title: '订单时间' },
                    {
                        width: 150,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            }],
                            'delete']
                    }
                ]],
            });

            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});