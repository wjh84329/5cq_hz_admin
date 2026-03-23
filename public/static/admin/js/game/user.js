define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'game.user/index',
        add_url: 'game.user/add',
        edit_url: 'game.user/edit',
        delete_url: 'game.user/delete',
        modify_url: 'game.user/modify',
        jia_url:'game.user/jia',
        jian_url:'game.user/jian',
        ck_url: 'game.fb/index',
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
                    { field: 'id',  title: 'ID',sort:false},
                    { field: 'username',  title: '用户名',sort:false},
                    { field: 'realname', title: '姓名/昵称',sort:false},
                    { field: 'money', title: '余额',templet: ea.table.pric,sort:false},
                    { field: 'credit', title: '信用额度',templet: ea.table.pric,sort:false},
                    {
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        minWidth:320,
                        operat: [
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            },{
                                text: '加钱',
                                url: init.jia_url,
                                method: 'open',
                                auth: 'jia',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            },{
                                text: '扣钱',
                                url: init.jian_url,
                                method: 'open',
                                auth: 'jian',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            }],
                            [{
                                text: '查看发布',
                                url: init.ck_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-primary layui-border-green',
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
        jia: function () {
            ea.listen();
        },
        jian: function () {
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