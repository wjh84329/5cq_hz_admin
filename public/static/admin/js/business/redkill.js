define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: "#currentTable",
        table_render_id: "currentTableRenderId",
        index_url: "business.redkill/index",
        look_url: "business.redkill/look",
        grant_url: "business.redkill/grant"
    };

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                toolbar: ["refresh"],
                defaultToolbar: ["filter", "print"],
                cols: [[
                    { type: "checkbox" },
                    { field: "user_id", width: 100, title: "用户ID" },
                    { field: "gw_title", minWidth: 160, title: "怪物名称" },
                    { field: "amount", width: 100, title: "红包金额" },
                    {
                        field: "status",
                        title: "红包状态",
                        search: "select",
                        selectList: { 1: "未使用", 2: "已使用" },
                        valueParser: function (value) {
                            value = parseInt(value || 0);
                            if (value === 1) {
                                return "未使用";
                            }
                            if (value === 2) {
                                return "已使用";
                            }
                            return "未知";
                        }
                    },
                    {
                        field: "grant_status",
                        title: "发放状态",
                        search: "select",
                        selectList: { 0: "未发放", 1: "已发放" },
                        valueParser: function (value) {
                            value = parseInt(value || 0);
                            return value === 1 ? "已发放" : "未发放";
                        }
                    },
                    {
                        field: "create_time_text",
                        minWidth: 160,
                        title: "领取时间",
                        search: false
                    },
                    {
                        field: "update_time_text",
                        minWidth: 160,
                        title: "使用时间",
                        search: false
                    },
                    {
                        field: "grant_time_text",
                        minWidth: 160,
                        title: "发放时间",
                        search: false
                    },
                    {
                        width: 240,
                        title: "操作",
                        templet: ea.table.tool,
                        fixed: "right",
                        operat: [[
                            {
                                text: "查看",
                                url: init.look_url,
                                method: "open",
                                auth: "look",
                                class: "layui-btn layui-btn-xs layui-btn-normal",
                                extend: 'data-width="900px" data-height="560px"'
                            },
                            {
                                text: "发放充值",
                                url: init.grant_url,
                                method: "open",
                                auth: "grant",
                                class: "layui-btn layui-btn-xs layui-btn-warm",
                                extend: 'data-width="700px" data-height="420px"'
                            }
                        ]]
                    }
                ]],
            });

            ea.listen();
        },

        look: function () {
            ea.listen();
        },

        grant: function () {
            ea.listen();
        }
    };

    return Controller;
});