<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>服务分配列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">服务分配列表</a>
        <a>
          <cite>服务分配列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">


            <div class="layui-card-body ">
                <table class="layui-hide" id="table" lay-filter="member"></table>
            </div>

            <script type="text/html" id="toolbarDemo">
                <div class="layui-btn-container">
                    <button class="layui-btn layui-btn-danger" lay-event="getCheckData1"><i class="layui-icon"></i>删除
                    </button>
                    <button class="layui-btn"><i class="layui-icon" lay-event="getCheckData2"></i>分配</button>
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
            , url: '${staticPath}/customerService/list?state=新创建' //数据接口
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

        //头工具栏事件
        table.on('toolbar(member)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            switch (obj.event) {
                case 'getCheckData1':
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
                    //删除执行
                    layer.confirm('真的删除行么', function (index) {
                        $.ajax({
                            url: "${staticPath}/customerService/delete?id=" + id,
                            type: "GET",
                            success: function (result) {
                                if (result.code == 200) {
                                    layer.alert("删除成功", {icon: 1}, function (index1) {
                                        layer.close(index1);
                                        // 可以对父窗口进行刷新
                                        location.reload();
                                    });
                                } else {
                                    layer.alert("没有权限");
                                }

                            },
                        });
                    });
                    break;
                case 'getCheckData2':
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
                    console.log("-----" + id)
                    xadmin.open("分配信息", '${staticPath}/customerService/fenpei?id=' + id);
                    break;
            }
        });
    });

</script>
