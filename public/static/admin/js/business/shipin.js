define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.shipin/index',
        delete_url: 'business.shipin/delete',
        stock_url: 'business.shipin/stock',
        info_url: 'business.shipin/info',
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
                    { field: 'title',  title: '视频标题', },
                    // { field: 'url', title: '文件预览', templet: ea.table.filePreview },
                    { field: 'tjwz',  title: '推荐网址' },
                    { field: 'add_time', title: '添加时间'},
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
                                text: '查看',
                                url: init.info_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
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