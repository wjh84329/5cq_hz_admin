define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.hz/index',
        add_gd_url: 'business.hz/add_gd',
        add_sj_url: 'business.hz/add_sj',
        edit_url: 'business.hz/edit',
        delete_url: 'business.hz/delete',
        modify_url:'business.hz/modify',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: [],
                cols: [[
                    // { type: "checkbox" },
                    // { field: 'id',  title: 'ID'},
                    { field: 'name',  title: '名称', },
                    { field: 'sort',  title: '排序', edit: 'text' },
                    { field: 'is_xs', title: '状态', selectList: { 0: '启用', 1: '禁用' },type:'启用|禁用', templet: ea.table.switch },
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