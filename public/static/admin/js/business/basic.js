define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'business.basic/index',
        edit_url: 'business.basic/edit',
        delete_url: 'business.basic/delete',
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                cols: [[
                    {type: 'checkbox'},
                    // {field: 'id', title: 'id'},
                    // {field: 'name', title: '名称'},
                    {field: 'smsCode', title: '默认验证码'},
                    {field: 'sbkBanner', title: 'banner图',search: false, templet: ea.table.image},
                    {field: 'qq', title: 'QQ客服'},
                    {field: 'wechatQf', title: '微信客服二维码',search: false, templet: ea.table.image },
                    {width: 250, title: '操作', templet: ea.table.tool}
                ]],
            });
            console.log(ea.table.tool)
            ea.listen();

        },
        edit: function () {
            ea.listen();
        },
    };
    return Controller;
});