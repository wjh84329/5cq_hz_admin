define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'coin.goods/index',
        add_url: 'coin.goods/add',
        edit_url: 'coin.goods/edit',
        delete_url: 'coin.goods/delete',
        export_url: 'coin.goods/export',
        modify_url: 'coin.goods/modify',
        read_url: 'coin.goods/read',
        stock_url: 'coin.goods/stock',
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
                    { field: 'sort',  title: '排序'},
                    { field: 'title', title: '商品标题'},
                    { field: 'img', title: '商品图片', search: false, templet: ea.table.image },
                    { field: 'price',title: '商品价值',templet: ea.table.price },
                    { field: 'num', title: '商品库存'},
                    { field: 'sold', title: '商品已售'},
                    // { field: 'type', title: '物品类型', width: 85, selectList: { 0: '实物', 1: '虚拟' }, templet: ea.table.switch,
                    //
                    // },
                    // { field: 'show', title: '展示与否', width: 85, selectList: { 0: '展示', 1: '不展示' }, templet: ea.table.switch},
                    { field: 'type',title: '商品类型',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '实物';
                            }else if(value ==1){
                                return '虚拟';
                            }
                        }
                    },
                    { field: 'show',title: '展示是否',
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
                            }, {
                                text: '入库',
                                url: init.stock_url,
                                method: 'open',
                                auth: 'stock',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                            }, {
                                text: '详情',
                                url: init.read_url,
                                method: 'open',
                                auth: 'edit',
                                extend: 'data-full="true"',
                                class: 'layui-btn layui-btn-xs layui-btn-primary',
                            },],
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