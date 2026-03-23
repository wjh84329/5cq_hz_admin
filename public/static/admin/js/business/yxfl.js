define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.yxfl/index',
        add_url: 'business.yxfl/add',
        edit_url: 'business.yxfl/edit',
        delete_url: 'business.yxfl/delete',
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
                    { field: 'id', width: 80, title: 'ID'},
                    { field: 'fl_name', minWidth: 80, title: '游戏分类', },
                    // { field: 'xq', minWidth: 80, title: '详情'},

                    {
                        width: 250,
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