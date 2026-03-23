define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.hb/index',
        add_gd_url: 'business.hb/add_gd',
        add_sj_url: 'business.hb/add_sj',
        edit_url: 'business.hb/edit',
        delete_url: 'business.hb/delete',
        modify_url:'business.hb/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: ['refresh',
                    [{
                        text: '添加当次红包',
                        url: init.add_gd_url,
                        method: 'open',
                        auth: 'add_gd',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }],
                    [{
                        text: '添加重复红包',
                        url: init.add_sj_url,
                        method: 'open',
                        auth: 'add_sj',
                        class: 'layui-btn layui-btn-normal layui-btn-sm',
                        icon: 'fa fa-plus ',
                        extend: 'data-full="true"',
                    }],
                    'delete'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id',  title: 'ID'},
                    { field: 'name',  title: '红包名称', },
                    { field: 'type',title: '红包类型',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '当次领取';
                            }else if(value ==1){
                                return '重复领取';
                            }
                        }
                    },
                    { field: 'num',  title: '红包数量', },
                    { field: 'price',  title: '红包金额', edit:'text'},
                    { field: 'fsrq',  title: '发放日期',
                        valueParser(value, data) {
                            console.log(value)
                            if (value == null) {
                                return '无';
                            }else{
                                return value;
                            }
                        }
                    },
                    { field: 'statu',title: '发放方式',
                        valueParser(value, data) {
                        // console.log(data)
                            if (value == 0) {
                                return '立即发送';
                            }else if(value ==1){
                                return '定时发送';
                            }
                        }
                    },
                    { field: 'fssj',  title: '发放时间',
                        valueParser(value, data) {
                            console.log(value)
                            if (value == null) {
                                return '无';
                            }else{
                                return value;
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
                            'delete'
                        ]
                    }
                ]],
            });
            ea.table.listenEdit(init, 'currentTable', init.table_render_id, true);
            ea.listen();
        },
        add_gd: function () {
            $('select[name="name"]').data('template',function(data,fields){
                return data['name'];
            })
            ea.listen();
        },
        add_sj: function () {
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
        },
    };
    return Controller;
});