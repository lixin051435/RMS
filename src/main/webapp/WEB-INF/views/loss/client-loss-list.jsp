<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>Loss列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">Loss列表</a>
        <a>
          <cite>Loss列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form  layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="cusName" placeholder="请输入客户名称"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="cusManager" placeholder="请输入客户经理"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <div class="layui-input-inline">
                                <select name="state" lay-search="">
                                    <option value="">请选择</option>
                                    <option value="0">暂缓流失</option>
                                    <option value="1">确认流失</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>
                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('新增','${staticPath}/customerLoss/add')"><i
                            class="layui-icon"></i>新增
                    </button>
                </div>
                <%--<script type="text/html" id="toolbarDemo">--%>
                    <%--<div class="layui-btn-container">--%>
                        <%--<button class="layui-btn layui-btn-danger" lay-event="getCheckData"><i class="layui-icon"></i>暂缓流失--%>
                        <%--</button>--%>
                    <%--</div>--%>
                <%--</script>--%>

                <div class="layui-card-body ">
                    <table class="layui-hide" id="table" lay-filter="member"></table>
                    <script type="text/html" id="barState">
                        {{#  if( d.state ==0){ }}
                        <a>暂缓流失</a>
                        {{# }if(d.state ==1) { }}
                        <a>确认流失</a>
                        {{#  } }}

                    </script>
                </div>
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
            , url: '${staticPath}/customerLoss/list' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'id', title: '编号 '},
                    {field: 'cusName', title: '客户名称 '},
                    {field: 'cusManager', title: '客户经理'},
                    {field: 'lastOrderTime', title: '上次下单日期 '},
                    {field: 'confirmLossTime', title: '确认流失日期'},
                    {field: 'state', title: '状态 ',toolbar: '#barState'},
                    {field: 'lossReason', title: '流失原因'},
                ]
            ]
            , id: 'testReload'

        });

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
                    var state = 0;
                    console.log(data);
                    for (let i = 0; i < data.length; i++) {
                        id = data[i].state;
                        break;
                    }
                    if (state == 0) {
                        layer.alert("客户已经流失！")
                        return;
                    }
                    break;
            }
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
            var cusName = data.field.cusName;
            var cusManager = data.field.cusManager;
            var state = data.field.state;
            table.render({
                elem: '#table'
                , url: '${staticPath}/customerLoss/findUserByFuzzyUserName' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "cusName": cusName,
                    "cusManager": cusManager,
                    "state": state
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'id', title: '编号 '},
                        {field: 'cusName', title: '客户名称 '},
                        {field: 'cusManager', title: '客户经理'},
                        {field: 'lastOrderTime', title: '上次下单日期 '},
                        {field: 'confirmLossTime', title: '确认流失日期'},
                        {field: 'state', title: '状态 ',toolbar: '#barState'},
                        {field: 'lossReason', title: '流失原因'},
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });
    });

</script>
