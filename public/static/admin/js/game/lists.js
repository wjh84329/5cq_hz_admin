define(["jquery", "easy-admin"], function ($, ea) {

    var init = {
        table_elem: '#currentTable',
        table_render_id: 'currentTableRenderId',
        index_url: 'game.lists/index',
        add_url: 'game.lists/add',
        edit_url: 'game.lists/edit',
        delete_url: 'game.lists/delete',
        modify_url: 'game.lists/modify',
    };
    $('#sz').click(function () {
        var today = new Date();
        var tomorrow = new Date(today.getTime() + (1000 * 60 * 60 * 24));
        var formattedDateTime = tomorrow.getFullYear() + '-' +
            (tomorrow.getMonth() + 1).toString().padStart(2, '0') + '-' +
            tomorrow.getDate().toString().padStart(2, '0') + ' ' +
            '00:00:00';
        $("#opendata").val(formattedDateTime)
    })

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
                    { field: 'id',  title: 'ID',sort:false,width: 80},
                    { field: 'serverName',  title: '服务器名',sort:false},
                    { field: 'startTime', title: '开始时间',sort:false},
                    { field: 'expiresTime', title: '结束时间',sort:false},
                    { field: 'status',sort: false ,title: '状态',valueParser(value, data) {
                            if(data.state==0){
                                if(new Date(data.expiresTime)<new Date()){
                                    return `<a style="color: red">已过期</a>`;
                                }else{
                                    // 设定目标时间
                                    const targetDate = new Date(data.expiresTime); // 注意：日期字符串需要是ISO格式或者能被Date正确解析的格式
                                    // 获取当前时间
                                    const now = new Date();
                                    // 计算两个时间之间的差值（毫秒）
                                    const difference = targetDate - now;
                                    // 转换差值到天数、小时数和分钟数
                                    const days = Math.floor(difference / (1000 * 60 * 60 * 24));
                                    const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                                    const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
                                    return `<a style="color: green">${days}天${hours}小时${minutes}分钟后结束</a>`;
                                }
                            }else if(data.state==1){
                                return `<a style="color: grey">广告不显示</a>`;
                            }else if(data.state==2){
                                return `<a style="color: deeppink">广告已撤销</a>`;
                            }else if(data.state==3){
                                return `<a style="color: blue">广告暂停中</a>`;
                            }
                        }
                    },
                    { field: 'show',title: '展示',sort:false,width:80,
                        valueParser(value, data) {
                            if (value == 0) {
                                return '精品';
                            }else if(value ==1){
                                return '置顶';
                            }
                        }
                    },
                    { field: 'num', title: '条数',width:80,sort:false},
                    { field: 'status', title: '显示',sort: false ,width:80,valueParser(value, data) {
                            if(data.state==0 && new Date(data.expiresTime)>new Date()){
                                return `<a style="color: green">√</a>`;
                            }else if(data.state==1){
                                return `<a style="color: grey">广告不显示</a>`;
                            }else if(data.state==2){
                                return `<a style="color: deeppink">广告已撤销</a>`;
                            }else if(data.state==3){
                                return `<a style="color: blue">广告暂停中</a>`;
                            }else {
                                return `<a style="color: grey">X</a>`;
                            }
                        }
                    },
                    { field: 'addUser', title: '发布人',width:80,sort:false},
                    { field: 'updateTime', title: '发布时间',sort:false},
                    // { field: 'engine', title: '引擎类型',sort:false},
                    {
                        title: '操作',
                        templet: ea.table.tool,
                        fixed: 'right',
                        minWidth:200,
                        operat: [
                            [{
                                text: '编辑',
                                url: init.edit_url,
                                method: 'open',
                                auth: 'edit',
                                class: 'layui-btn layui-btn-xs layui-btn-success',
                                extend: 'data-full="true"',
                            }, ],
                            [{
                                text: '暂停',
                                url: 'game.lists/zt',
                                method: 'request',
                                auth: 'refresh',
                                class: 'layui-btn layui-btn-xs layui-btn-normal',
                                extend: 'data-full="true"',
                            }],
                            [{
                                text: '撤销',
                                url: 'game.lists/cx',
                                method: 'request',
                                auth: 'refresh',
                                class: 'layui-btn layui-btn-xs layui-btn-warm',
                                extend: 'data-full="true"',
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