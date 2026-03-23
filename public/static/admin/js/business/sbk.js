define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.sbk/index',
        add_url: 'business.sbk/add',
        edit_url: 'business.sbk/edit',
        stock_url: 'business.sbk/stock',
        delete_url: 'business.sbk/delete',
        ck_url: 'business.km/index',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: ['refresh',
                    [{
                        text: '添加',
                        url: init.add_url,
                        method: 'open',
                        auth: 'add',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }],
                    'delete'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 60, title: 'ID'},
                    { field: 'support_name', minWidth: 80, title: '赞助方名称', },
                    { field: 'support_link', minWidth: 80, title: '赞助方下载链接', },
                    { field: 'support_logo', minWidth: 80, title: '赞助方logo', search: false, templet: ea.table.image },
                    { field: 'matic_data', minWidth: 80, title: '比赛日期' },
                    { field: 'matic_price', minWidth: 80, title: '比赛奖金' },
                    { field: 'broadcast_link', minWidth: 80, title: '直播地址' },
                    { field: 'broadcast_statu', Width: 40, title: '直播状态' },
                    { field: 'red_num', minWidth: 80, title: '红方投注总量' },
                    { field: 'blue_num', minWidth: 80, title: '蓝方投注总量' },
                    {
                        width: 350,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [
                            [{
                                text: '投注输赢',
                                url: init.stock_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                // extend: 'data-full="true"',
                            }],
                            [{
                                text: '生成卡密',
                                url: 'business.sbk/add_km',
                                method: 'request',
                                auth: 'refresh',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
                                extend: 'data-full="true"',
                            }],
                            [{
                                text: '查看卡密',
                                url: init.ck_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-primary layui-border-green',
                                extend: 'data-full="true"',
                            }],
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
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
        }
    };
    return Controller;
});