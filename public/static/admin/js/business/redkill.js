define(["jquery", "easy-admin"], function ($, ea) {

    var layer = layui.layer;

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
                    { field: "gw_title", minWidth: 180, title: "怪物名称" },
                    { field: "amount", width: 120, title: "红包金额" },
                    {
                        field: "status",
                        title: "红包状态",
                        minWidth: 160,
                        search: "select",
                        selectList: { 1: "未使用", 2: "已使用" },
                        templet: function (d) {
                            var status = parseInt(d.status || 0);
                            var redCount = parseInt(d.red_count || 1);

                            if (status === 2) {
                                return '<a href="javascript:;" class="ea-redkill-look" data-id="' + d.id + '">' +
                                    '使用' + redCount + '个红包' +
                                    '</a>';
                            }

                            return '<span class="layui-badge layui-bg-gray">未使用</span>';
                        }
                    },
                    {
                        field: "grant_status",
                        title: "发放状态",
                        width: 110,
                        search: "select",
                        selectList: { 0: "未发放", 1: "已发放" },
                        templet: function (d) {
                            var value = parseInt(d.grant_status || 0);
                            if (value === 1) {
                                return '<span class="layui-badge layui-bg-green">已发放</span>';
                            }
                            if (value === 2) {
                                return '<span class="layui-badge layui-bg-orange">部分发放</span>';
                            }
                            return '<span class="layui-badge-rim">未发放</span>';
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
                        width: 220,
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
                                extend: 'data-width="980px" data-height="620px"'
                            },
                            {
                                text: "发放充值",
                                url: init.grant_url,
                                method: "open",
                                auth: "grant",
                                class: "layui-btn layui-btn-xs layui-btn-warm",
                                extend: 'data-width="760px" data-height="460px"',
                                _if: function (data) {
                                    return parseInt(data.status || 0) === 2 && parseInt(data.grant_status || 0) !== 1;
                                }
                            }
                        ]]
                    }
                ]],
            });

            $(document).off("click.redkillLook").on("click.redkillLook", ".ea-redkill-look", function () {
                var id = parseInt($(this).attr("data-id") || 0);
                if (id <= 0) {
                    return;
                }

                layer.open({
                    type: 2,
                    title: "红包使用明细",
                    area: ["980px", "620px"],
                    content: ea.url(init.look_url) + "?id=" + id
                });
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