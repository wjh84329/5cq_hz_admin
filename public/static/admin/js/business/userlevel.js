define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.userlevel/index',
        add_url: 'business.userlevel/add',
        edit_url: 'business.userlevel/edit',
        delete_url: 'business.userlevel/delete',
        batch_pool_url: 'business.userlevel/batch_pool',
        monster_pool_url: 'business.userlevel/monster_pool'
    };

    var monster_init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.userlevel/monster_pool?id=' + ea.getQueryVariable('id', ''),
        add_url: 'business.userlevel/add_monster?id=' + ea.getQueryVariable('id', ''),
        delete_url: 'business.userlevel/delete_monster',
        modify_url: 'business.userlevel/modify_monster'
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
                    { field: 'id', width: 80, title: 'ID' },
                    { field: 'level_name', minWidth: 100, title: '等级名称' },
                    { field: 'level', minWidth: 80, title: '等级' },
                    { field: 'tb', minWidth: 80, title: '图标', templet: ea.table.image },
                    { field: 'level_time', minWidth: 120, title: '等级所需时长' },
                    { field: 'coin_up', minWidth: 140, title: '每日领取金币上限' },
                    { field: 'coin_scale', minWidth: 120, title: '领取金币比例' },
                    {
                        field: 'monster_titles',
                        minWidth: 260,
                        title: '已配怪物',
                        search: false,
                        valueParser(value) {
                            return value && value !== '' ? value : '未配置';
                        }
                    },
                    {
                        width: 320,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [[
                            {
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            },
                            {
                                text: '怪物池',
                                url: init.monster_pool_url,
                                method: 'open',
                                auth: 'monster_pool',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
                                extend: 'data-width="1000px" data-height="700px"',
                            }
                        ]]
                    }
                ]],
            });

            ea.listen();
        },

        batch_pool: function () {
            ea.listen();
        },

        monster_pool: function () {
            ea.table.render({
                init: monster_init,
                totalRow: true,
                toolbar: ['refresh',
                    [{
                        text: '添加怪物',
                        url: monster_init.add_url,
                        method: 'open',
                        auth: 'add_monster',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-width="900px" data-height="650px"',
                    }]
                ],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 80, title: 'ID' },
                    { field: 'title', minWidth: 180, title: '怪物名称' },
                    { field: 'images', minWidth: 140, title: '怪物图片', search: false, templet: ea.table.image },
                    { field: 'probability', width: 110, title: '概率', edit: 'text' },
                    // { field: 'sort', width: 100, title: '排序', edit: 'text' },
                    // {
                    //     width: 120,
                    //     title: '操作',
                    //     templet: ea.table.tool,
                    //     fixed: 'right',
                    //     operat: ['delete']
                    // }
                ]],
            });

            ea.table.listenEdit(monster_init, 'currentTable', monster_init.table_render_id, true);
            ea.listen();
        },

        add_monster: function () {
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