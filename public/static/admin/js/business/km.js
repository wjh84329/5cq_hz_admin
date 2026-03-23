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
        index_url: 'business.km/index?id='+GetUrlPara('id'),
        add_gd_url: 'business.km/add',
        export_url: 'business.km/export?id='+GetUrlPara('id'),
        delete_url: 'business.km/delete',
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
                    'export',
                    'delete'],
                cols: [[
                    { type: "checkbox" },
                    { field: 'id',  title: 'ID'},
                    { field: 'jhm',  title: '激活码', },
                    { field: 'is_sy',title: '使用情况',
                        valueParser(value, data) {
                            if (value == 0) {
                                return '未使用';
                            }else if(value ==1){
                                return '已使用';
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