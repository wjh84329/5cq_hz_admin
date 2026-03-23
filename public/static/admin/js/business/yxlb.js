define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.yxlb/index',
        add_url: 'business.yxlb/add',
        add_ts_url: 'business.yxlb/add_ts',
        edit_url: 'business.yxlb/edit',
        delete_url: 'business.yxlb/delete',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: ['refresh',
                    [{
                        text: '添加游戏',
                        url: init.add_url,
                        method: 'open',
                        auth: 'add',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }],
                    [{
                        text: '添加特色好服',
                        url: init.add_ts_url,
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
                    { field: 'yx_name', minWidth: 80, title: '游戏名称', },
                    { field: 'yxgs', minWidth: 80, title: '游戏公司', },
                    { field: 'yxlogo', minWidth: 80, title: '游戏图标', search: false, templet: ea.table.image },
                    { field: 'zylx', minWidth: 80, title: '职业类型'},
                    { field: 'yxyy', minWidth: 80, title: '游戏语言'},
                    { field: 'yxbb', minWidth: 80, title: '游戏版本'},
                    { field: 'yxdx', minWidth: 80, title: '游戏大小'},
                    { field: 'xzcs', minWidth: 80, title: '下载次数'},
                    { field: 'is_ts',title: '是否特色',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '特色好服';
                            }else if(value ==1){
                                return '普通游戏';
                            }
                        }
                    },

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
        add_ts: function () {
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