<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>数据字典管理</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">数据字典管理</a>
        <a>
          <cite>数据字典管理</cite></a>
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
                            <input type="text" name="dataDicName" placeholder="数据字典名"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="dataDicValue" placeholder="数据字典值"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('新增','${staticPath}/dataDic/add')"><i
                            class="layui-icon"></i>新增
                    </button>
                </div>

                <div class="layui-card-body ">
                    <table class="layui-hide" id="table" lay-filter="member"></table>
                </div>

                <div class="layui-card-body ">
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
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
            , url: '${staticPath}/dataDic/list' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'id', title: '编号 '},
                    {field: 'dataDicName', title: '数据字典名 '},
                    {field: 'dataDicValue', title: '数据字典值'},
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
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

        //监听工具条
        table.on('tool(member)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${staticPath}/dataDic/delete",
                        type: "GET",
                        data: {id: data.id},
                        dataType: 'json',
                        success: function (result) {
                            if (result.code == 200) {
                                layer.alert("删除成功", {icon: 1}, function (index1) {
                                    layer.close(index1);
                                    // 可以对父窗口进行刷新
                                    location.reload();
                                });
                            } else {
                                layer.alert(result.msg);
                            }

                        },
                    });
                });
            } else if (obj.event === 'edit') {
                var id = data.id;//当前行的id
                xadmin.open('编辑信息', '${staticPath}/dataDic/edit?id=' + id);
            }
        });
        //高级查询
        form.on('submit(search)', function (data) {
            var dataDicName = data.field.dataDicName;
            var dataDicValue = data.field.dataDicValue;
            table.render({
                elem: '#table'
                , url: '${staticPath}/dataDic/list' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "dataDicName": dataDicName,
                    "dataDicValue": dataDicValue
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'id', title: '编号 '},
                        {field: 'dataDicName', title: '数据字典名 '},
                        {field: 'dataDicValue', title: '数据字典值'},
                        , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });
    });

</script>
