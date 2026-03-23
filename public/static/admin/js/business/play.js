define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.play/index',
        add_url: 'business.play/add',
        edit_url: 'business.play/edit',
        delete_url: 'business.play/delete',
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
                    { field: 'id',  title: 'ID'},
                    { field: 'title',  title: '活动标题', },
                    { field: 'info',title: '活动简介', },
                    { field: 'play_img', title: '活动图片', search: false, templet: ea.table.image },
                    { field: 'play_link', title: '活动跳转链接'},
                    { field: 'banner_statu',title: 'banner展示状态',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '展示';
                            }else if(value ==1){
                                return '不展示';
                            }
                        }
                    },
                    { field: 'play_statu',title: '展示状态',
                        valueParser(value, data) {
                        // console.log(data)
                            if (value == 0) {
                                return '展示';
                            }else if(value ==1){
                                return '不展示';
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