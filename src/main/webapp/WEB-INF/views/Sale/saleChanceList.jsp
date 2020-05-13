<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>SaleChance列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">营销机会管理</a>
        <a>
          <cite>营销机会列表</cite></a>
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
                            <input type="text" name="customerName" placeholder="请输入客户名"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="overView" placeholder="请输入概要"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="createMan" placeholder="请输入创建人"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <div class="layui-input-inline">
                                <select name="state" lay-search="">
                                    <option value="">请选择分配状态</option>
                                    <option value="0">未分配</option>
                                    <option value="1">已分配</option>
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
                    <button class="layui-btn" onclick="xadmin.open('新增','${staticPath}/saleChances/add')"><i
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
            , url: '${staticPath}/saleChances/listPage' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'id', title: '编号 '},
                    {field: 'customerName', title: '客户名称 '},
                    {field: 'overView', title: '概要'},
                    {field: 'linkMan', title: '联系人 '},
                    {field: 'linkPhone', title: '联系电话'},
                    {field: 'createMan', title: '创建人 '},
                    {field: 'createTime', title: '创建时间'},
                    {
                        field: 'state', title: '状态', templet: function (d) {
                            return d.state == '1' ? "已分配" : "未分配";
                        }
                    }
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
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
                        url: "${staticPath}/saleChances/delete",
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
                xadmin.open('编辑信息', '${staticPath}/saleChances/addOrEdit?id=' + id);
            }
        });
        //高级查询
        form.on('submit(search)', function (data) {
            var customerName = data.field.customerName;
            var overView = data.field.overView;
            var createMan = data.field.createMan;
            var state = data.field.state;
            table.render({
                elem: '#table'
                , url: '${staticPath}/saleChances/findUserByFuzzyUserName' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "customerName": customerName,
                    "overView": overView,
                    "createMan": createMan,
                    "state": state
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'id', title: '编号 '},
                        {field: 'customerName', title: '客户名称 '},
                        {field: 'overView', title: '概要'},
                        {field: 'linkMan', title: '联系人 '},
                        {field: 'linkPhone', title: '联系电话'},
                        {field: 'createMan', title: '创建人 '},
                        {field: 'createTime', title: '创建时间'},
                        {
                            field: 'state', title: '状态', templet: function (d) {
                                return d.state == '1' ? "已分配" : "未分配";
                            }
                        }
                        , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });
    });

</script>
