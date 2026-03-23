define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.userlevel/index',
        add_url: 'business.userlevel/add',
        edit_url: 'business.userlevel/edit',
        delete_url: 'business.userlevel/delete',
        batch_pool_url: 'business.userlevel/batch_pool'
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
                    [{
                        text: '配置怪物池',
                        url: init.batch_pool_url,
                        method: 'open',
                        auth: 'batch_pool',
                        class: 'layui-btn layui-btn-warm layui-btn-sm',
                        icon: 'fa fa-cogs ',
                        extend: 'data-checkbox="true" data-table="currentTableRenderId" data-width="1100px" data-height="760px"',
                    }],
                ],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 80, title: 'ID'},
                    { field: 'level_name', minWidth: 80, title: '等级名称' },
                    { field: 'level', minWidth: 80, title: '等级' },
                    { field: 'tb', minWidth: 80, title: '图标', templet:ea.table.image },
                    { field: 'level_time', minWidth: 80, title: '等级所需时长' },
                    { field: 'coin_up', minWidth: 80, title: '每日领取金币上限' },
                    { field: 'coin_scale', minWidth: 80, title: '领取金币比例' },
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [[{
                            text: '编辑',
                            url: init.edit_url,
                            method: 'open',
                            auth: 'edit',
                            class: 'layui-btn layui-btn-xs layui-btn-success',
                            extend: 'data-full="true"',
                        }]]
                    }
                ]],
            });

            ea.listen();
        },

        batch_pool: function () {
            ea.listen();
        },

        add: function () {
            ea.listen();
        },

        edit: function () {
            ea.listen();
        }
    };
    return Controller;
});