define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'luntan.tz/index',
        delete_url: 'luntan.tz/delete',
        stock_url: 'luntan.tz/stock',
        edit_url: 'luntan.tz/edit',
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
                    { field: 'id',title: 'ID'},
                    { field: 'fl',  title: '分类板块', },
                    { field: 'fbr', title: '发表人'},
                    // { field: 'url', title: '文件预览', templet: ea.table.filePreview },
                    { field: 'title',  title: '帖子标题' },
                    // { field: 'fbr', title: '发表人'},
                    { field: 'is_sh',title: '是否审核',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '未审核';
                            }else if(value ==1){
                                return '通过审核';
                            }else {
                                return '未通过审核';
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
                                text: '审核',
                                url: init.stock_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            },{
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