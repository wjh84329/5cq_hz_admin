define(["jquery", "easy-admin"], function ($, ea) {
    
    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.user/index',
        add_gd_url: 'business.user/add_gd',
        add_sj_url: 'business.user/add_sj',
        edit_url: 'business.user/edit',
        delete_url: 'business.user/delete',
        modify_url:'business.user/modify',
        look_url:'business.user/look',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,
                toolbar: ['refresh',
                    'delete'],
                defaultToolbar:['filter','print'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id',  title: 'ID'},
                    { field: 'open_id',  title: '微信open_id', },
                    { field: 'name',  title: '用户名', },
                    { field: 'nickname',  title: '昵称', edit:'text'},
                    { field: 'realname',  title: '真实姓名', edit:'text',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == null) {
                                return '未验证';
                            }else{
                                return value;
                            }
                        }
                    },
                    { field: 'phone',  title: '手机号',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == null) {
                                return '未验证';
                            }else{
                                return value;
                            }
                        }
                    },
                    /*{ field: 'ip',  title: '注册ip',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == null) {
                                return '未验证';
                            }else{
                                return value;
                            }
                        }
                    },*/
                    { field: 'sfz',  title: '身份证',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == null) {
                                return '未验证';
                            }else{
                                return value;
                            }
                        }
                    },
                    // { field: 'avatar',  title: '头像', templet: ea.table.image},
                    { field: 'coin_num',  title: '金币数量', edit:'text'},
                    { field: 'money',  title: '余额', edit:'text'},
                    { field: 'lv',  title: '用户等级'},
                    { field: 'state', title: '是否封禁', width: 120,selectList: { 0: '启用', 1: '禁用' },tips:'是|否', templet: ea.table.switch },
                    /*{ field: 'sign',  title: '个性签名',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == null) {
                                return '无';
                            }else{
                                return value;
                            }
                        }
                    },*/
                    { field: 'is_sh',  title: '审核情况',
                        valueParser(value, data) {
                            //console.log(value)
                            if (value == 0) {
                                return '未审核';
                            }else if (value == 1) {
                                return '审核通过';
                            }{
                                return '审核不通过';
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
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            },
                            {
                                text: '查看信息',
                                url: init.look_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
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