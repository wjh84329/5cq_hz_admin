define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.kill/index',
        open_gwlist: 'business.kill/open_gwlist',

        add_rule_url: 'business.kill/add_sj',
        goods_db_url: 'business.kill/open_wplist',
        recycle_rule_url: 'business.kill/add_sj'
    };

    var gw_init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.kill/open_gwlist',
        add_url: 'business.kill/add_gw',
        edit_url: 'business.kill/edit_gw',
        delete_url: 'business.kill/delete_gw',
        monster_items_url: 'business.kill/add_monster_items',
    };

    var wp_init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.kill/open_wplist',
        add_url: 'business.kill/add_wp',
        edit_url: 'business.kill/edit_wp',
        delete_url: 'business.kill/delete_wp',
        modify_url: 'business.kill/modify_wp'
    };

    var drop_init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.kill/monster_items?id=' + ea.getQueryVariable('id', ''),
        add_url: 'business.kill/add_monster_items?id=' + ea.getQueryVariable('id', ''),
        delete_url: 'business.kill/delete_monster_item',
        modify_url: 'business.kill/modify_monster_item',
    };

    var Controller = {

        index: function () {
            // ea.table.render({
            //     init: init,
            //     totalRow: true,
            //     toolbar: ['refresh',
            //         [{
            //             text: '配置怪物数据库',
            //             url: init.open_gwlist,
            //             method: 'open',
            //             auth: 'open_gwlist',
            //             class: 'layui-btn layui-btn-sm',
            //             extend: 'data-full="true"',
            //         }],
            //         // [{
            //         //     text: '配置打怪规则',
            //         //     url: init.add_rule_url,
            //         //     method: 'open',
            //         //     auth: 'add_sj',
            //         //     class: 'layui-btn layui-btn-normal layui-btn-sm',
            //         //     extend: 'data-full="true"',
            //         // }],
            //         [{
            //             text: '配置物品数据库',
            //             url: init.goods_db_url,
            //             method: 'open',
            //             auth: 'add_sj',
            //             class: 'layui-btn layui-btn-warm layui-btn-sm',
            //             extend: 'data-full="true"',
            //         }],
            //         // [{
            //         //     text: '配置回收规则',
            //         //     url: init.recycle_rule_url,
            //         //     method: 'open',
            //         //     auth: 'add_sj',
            //         //     class: 'layui-btn layui-btn-danger layui-btn-sm',
            //         //     extend: 'data-full="true"',
            //         // }],
            //     ],
            //     cols: [[
            //         { type: "checkbox" },
            //         { field: 'id', title: 'ID' }
            //     ]],
            // });

            ea.listen();
        },

        open_gwlist: function () {
            ea.table.render({
                init: gw_init,
                totalRow: true,
                toolbar: ['refresh',
                    [{
                        text: '添加怪物',
                        url: gw_init.add_url,
                        method: 'open',
                        auth: 'add_gw',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-width="780px" data-height="420px"',
                    }],
                    'delete'
                ],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 80, title: 'ID' },
                    { field: 'title', minWidth: 180, title: '怪物名称' },
                    { field: 'images', minWidth: 140, title: '怪物图片', search: false, templet: ea.table.image },
                    {
                        width: 200,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [
                            [{
                                text: '编辑',
                                url: gw_init.edit_url,
                                method: 'open',
                                auth: 'edit_gw',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-width="780px" data-height="420px"',
                            }, {
                                text: '配置掉落',
                                url: gw_init.monster_items_url,
                                method: 'open',
                                auth: 'monster_items',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
                                extend: 'data-width="1000px" data-height="700px"',
                            }],
                            'delete'
                        ]
                    }
                ]],
            });

            ea.listen();
        },

        open_wplist: function () {
            ea.table.render({
                init: wp_init,
                totalRow: true,
                toolbar: ['refresh',
                    [{
                        text: '添加物品',
                        url: wp_init.add_url,
                        method: 'open',
                        auth: 'add_wp',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-width="820px" data-height="500px"',
                    }],
                    'delete'
                ],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 80, title: 'ID' },
                    { field: 'title', minWidth: 160, title: '物品名称' },
                    { field: 'images', minWidth: 120, title: '物品图片', search: false, templet: ea.table.image },
                    { field: 'value_min', width: 110, title: '价值下限', edit: 'text' },
                    { field: 'value_max', width: 110, title: '价值上限', edit: 'text' },
                    {
                        field: 'value_range',
                        minWidth: 140,
                        title: '价值区间',
                        search: false,
                        valueParser(value, data) {
                            return data.value_min + ' - ' + data.value_max;
                        }
                    },
                    {
                        width: 200,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: [[{
                            text: '编辑',
                            url: wp_init.edit_url,
                            method: 'open',
                            auth: 'edit_wp',
                            class: 'layui-btn layui-btn-xs layui-btn-success',
                            extend: 'data-width="820px" data-height="500px"',
                        }], 'delete']
                    }
                ]],
            });

            ea.table.listenEdit(wp_init, 'currentTable', wp_init.table_render_id, true);
ea.listen();
        },

        monster_items: function () {
            ea.table.render({
                init: drop_init,
                totalRow: true,
                toolbar: ['refresh',
                    [{
                        text: '添加掉落物品',
                        url: drop_init.add_url,
                        method: 'open',
                        auth: 'add_monster_items',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-width="1100px" data-height="760px"',
                    }]
                ],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id', width: 80, title: 'ID' },
                    { field: 'title', minWidth: 160, title: '物品名称' },
                    { field: 'images', minWidth: 120, title: '物品图片', search: false, templet: ea.table.image },
                    { field: 'value_min', width: 110, title: '价值下限' },
                    { field: 'value_max', width: 110, title: '价值上限' },
                    { field: 'probability', width: 100, title: '概率', edit: 'text' },
                    { field: 'min_num', width: 110, title: '最小数量', edit: 'text' },
                    { field: 'max_num', width: 110, title: '最大数量', edit: 'text' },
                    { field: 'sort', width: 90, title: '排序', edit: 'text' },
                    {
                        width: 120,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: ['delete']
                    }
                ]],
            });

            ea.table.listenEdit(drop_init, 'currentTable', drop_init.table_render_id, true);
            ea.listen();
        },
        add_monster_items: function () {
            ea.listen();
        },

        add_gw: function () {
            ea.listen();
        },

        edit_gw: function () {
            ea.listen();
        },

        add_sj: function () {
            ea.listen();
        },

        edit: function () {
            ea.listen();
        },
        add_wp: function () { 
            ea.listen(); 
        },
        edit_wp: function () { 
            ea.listen(); 
        },
    };

    return Controller;
});