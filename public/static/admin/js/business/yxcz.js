define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.yxcz/index',
        delete_url: 'business.yxcz/delete',
        edit_url: 'business.yxcz/edit',
        th_url: 'business.yxcz/th',
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
                    { field: 'id', width: 60, title: 'ID',},
                    { field: 'open_id', minWidth: 80, title: 'openid', },
                    { field: 'yxmc', minWidth: 80, title: '游戏名称', },
                    { field: 'yxgw', minWidth: 80, title: '游戏官网', },
                    { field: 'czje', minWidth: 80, title: '充值金额', },
                    { field: 'hbmc', minWidth: 80, title: '货币名称' },
                    { field: 'czzh', minWidth: 80, title: '冲值帐号' },
                    { field: 'czqf', minWidth: 80, title: '充值区服' },
                    { field: 'QQ', Width: 40, title: '联系QQ' },
                    { field: 'update_time', Width: 40, title: '提交日期' },
                    { field: 'is_cz',title: '充值情况',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '未充值';
                            }else if(value ==1){
                                return '已充值';
                            }else if(value ==2){
                                return '已退回';
                            }
                        }
                    },
                    {
                        width: 350,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [
                            [{
                                text: '查看信息',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            }],
                            [{
                                text: '确认充值',
                                url: 'business.yxcz/sh',
                                method: 'request',
                                auth: 'refresh',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
                                extend: 'data-full="true"',
                            }],
                            [{
                                text: '退回订单',
                                url: init.th_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs',
                                extend: 'data-full="true"',
                            }],
                            'delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
        edit: function () {
            ea.listen();
        },
        stock: function () {
            ea.listen();
        },
        read: function () {
            ea.listen();
        },
        type: function (){
            ea.listen();
        },
        th: function (){
            ea.listen();
        }
    };
    return Controller;
});