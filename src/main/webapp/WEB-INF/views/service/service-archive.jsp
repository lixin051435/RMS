<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>服务归档列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">服务归档列表</a>
        <a>
          <cite>服务归档列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card-body ">
                <form class="layui-form  layui-col-space5">
                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="customer" placeholder="请输入客户名称"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" name="overview" placeholder="请输入概要"
                               autocomplete="off"
                               class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <select id="serveType" name="serveType" lay-search="">
                            <option value="">请选择</option>
                            <option value="咨询">咨询</option>
                            <option value="建议">建议</option>
                            <option value="投诉">投诉</option>
                        </select>
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" id="createTimefrom" name="createTimefrom"
                               required="" lay-verify="css"
                               placeholder="输入开始时间"
                               autocomplete="off" class="layui-input">
                    </div>

                    <div class="layui-inline layui-show-xs-block">
                        <input type="text" id="createTimeto" name="createTimeto"
                               required="" lay-verify="css"
                               placeholder="输入结束时间"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-inline layui-show-xs-block">
                        <button class="layui-btn" lay-submit="" lay-filter="search"><i
                                class="layui-icon">&#xe615;</i></button>
                    </div>
                </form>
            </div>
            <div class="layui-card-body ">
                <table class="layui-hide" id="table" lay-filter="member"></table>
            </div>
            <script type="text/html" id="toolbarDemo">
                <div class="layui-btn-container">
                    <button class="layui-btn"><i class="layui-icon" lay-event="getCheckData"></i>查看客户服务详情</button>
                </div>
            </script>
        </div>
    </div>
</div>
</div>

</body>
</html>
<script type="text/javascript">

    layui.use('table', function () {
        $ = layui.jquery;
        var table = layui.table,
            form = layui.form;
        table.render({
            elem: '#table'
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , url: '${staticPath}/customerService/list?state=已归档' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'id', title: '编号 '},
                    {field: 'customer', title: '客户 '},
                    {field: 'overview', title: '概要'},
                    {field: 'serveType', title: '服务类型 '},
                    {field: 'createPeople', title: '创建人 '},
                    {field: 'createTime', title: '创建日期'},
                ]
            ]
            , id: 'testReload'

        });

        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            id: $("#id").val()
                        }
                    }
                });
            }
        };
        //搜索
        $('#searchBtn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });


        //高级查询
        form.on('submit(search)', function (data) {
            var customer = data.field.customer;
            var overview = data.field.overview;
            var serveType = data.field.serveType;
            var createTimefrom = data.field.createTimefrom;
            var createTimeto = data.field.createTimeto;
            table.render({
                elem: '#table'
                , url: '${staticPath}/customerService/list?state=已归档' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "customer": customer,
                    "overview": overview,
                    "serveType": serveType,
                    "createTimefrom": createTimefrom,
                    "createTimeto": createTimeto
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'id', title: '编号 '},
                        {field: 'customer', title: '客户 '},
                        {field: 'overview', title: '概要'},
                        {field: 'serveType', title: '服务类型 '},
                        {field: 'createPeople', title: '创建人 '},
                        {field: 'createTime', title: '创建日期'},
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });


        //头工具栏事件
        table.on('toolbar(member)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData':
                    var data = checkStatus.data;
                    if (data.length == 0) {
                        layer.alert("请选择数据操作！")
                        return;
                    } else if (data.length >= 2) {
                        layer.alert("请选择一条数据操作！")
                        return;
                    }
                    var id = 0;
                    for (let i = 0; i < data.length; i++) {
                        id = data[i].id
                        break;
                    }
                    xadmin.open("分配信息", '${staticPath}/customerService/archive?id=' + id);
                    break;
            }
        });
    });

</script>
