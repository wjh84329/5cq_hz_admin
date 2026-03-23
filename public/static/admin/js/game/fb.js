define(["jquery", "easy-admin"], function ($, ea) {
    function GetUrlPara(a = '')
    {
        // location.search获取当前页面路径中的参数段

        var queryStr=location.search.split("?")[1];

        var arr=queryStr.split("&");

        var obj={};

        for(var i=0;i<arr.length;i++) {
            var g = arr[i].split("=");
            obj[g[0]] = g[1];
        }
        return obj[a]
    }

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'game.fb/index?id='+GetUrlPara('id'),
        delete_url: 'game.fb/delete',
    };
    function GetUrlPara(a = '')
    {
        // location.search获取当前页面路径中的参数段

        var queryStr=location.search.split("?")[1];

        var arr=queryStr.split("&");

        var obj={};

        for(var i=0;i<arr.length;i++) {
            var g = arr[i].split("=");
            obj[g[0]] = g[1];
        }
        return obj[a]
    }
    var aa  = GetUrlPara('id')
    console.log(aa)

    var Controller = {

        index: function () {
            ea.table.render({
                init: init,
                totalRow: true,

                toolbar: ['refresh',
                    'delete'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id',  title: 'ID',sort:false},
                    { field: 'serverName',  title: '服务器名',sort:false},
                    { field: 'serverIp', title: '服务器IP',sort:false},
                    { field: 'openTime', title: '开区时间',sort:false},
                    { field: 'QQ', title: '客服QQ',sort:false},
                    { field: 'route', title: '线路类别',sort:false},
                    { field: 'version', title: '版本介绍',sort:false},
                    { field: 'engine', title: '引擎类型',sort:false},
                    { field: 'days', title: '发布天数',sort:false},
                    { field: 'cmoney', title: '扣除金额',sort:false},
                    { field: 'show',title: '广告类型',sort:false,
                        valueParser(value, data) {
                            if (value == 0) {
                                return '精品推荐';
                            }else if(value ==1){
                                return '置顶推荐';
                            }
                        }
                    },
                    {
                        width: 250,
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        operat: ['delete']
                    }
                ]],
            });

            ea.listen();
        },
        add: function () {
            ea.listen();
        },
    };
    return Controller;
});