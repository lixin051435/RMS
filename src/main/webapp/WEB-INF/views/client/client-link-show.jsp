<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>联系人</title>
</head>

<body>
<div class="x-body">

    <input type="text" id="id" value="${customer.id}" name="id" style="display:none;" autocomplete="off"
           class="layui-input">
    <div class="layui-form-item">
        <label for="L_khno" class="layui-form-label">
            <span class="x-red">*</span>客户编号
        </label>
        <div class="layui-input-inline">
            <input type="text" id="L_khno" readonly value="${customer.khno}" name="khno"
                   required=""
                   lay-verify="name" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_name" class="layui-form-label">
            <span class="x-red"></span>客户姓名
        </label>
        <div class="layui-input-inline">
            <input type="text" readonly id="L_name" value="${customer.name}"
                   name="chanceSource"
                   required="" lay-verify="css"
                   autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
        </div>
    </div>
    <div class="layui-card-body ">
        <label class="layui-form-label">
            <span class="x-red"></span>联系人信息
        </label>
        <div class="layui-card-header">
            <button class="layui-btn" onclick="linkManAdd()">
                <i
                        class="layui-icon"></i>新增
            </button>

        </div>
        <table class="layui-hide" id="table" lay-filter="member"></table>
    </div>
    <div class="layui-card-body ">
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
        </script>
    </div>
</div>
<script>
    function linkManAdd() {
        var id = $("#id").val();
        xadmin.open('新增联系人', '${staticPath}/linkMan/linkManPage?id=' + id);
    }

    layui.use(['form', 'table', 'layer', 'laydate'], function () {
        $ = layui.jquery;
        var table = layui.table;
        var form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate;

        var id = $("#id").val();
        console.log(id);
        table.render({
            elem: '#table'
            , url: '${staticPath}/linkMan/list?cusId=' + id  //数据接口
            , cols: [
                [ //表头
                    {field: 'id', title: '编号 '},
                    {field: 'linkName', title: '客户姓名 '},
                    {field: 'sex', title: '性别'},
                    {field: 'zhiwei', title: '职位 '},
                    {field: 'officePhone', title: '办公电话 '},
                    {field: 'phone', title: '手机 '}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo'}
                ]
            ]
        });
        //监听工具条
        table.on('tool(member)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${staticPath}/linkMan/delete",
                        type: "GET",
                        data: {id: data.id},
                        dataType: 'json',
                        success: function (result) {
                            if (result.code == 200) {
                                layer.alert("删除联系信息成功", {icon: 1}, function (index1) {
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
                // xadmin.open('编辑信息', '[[${#httpServletRequest.getContextPath()}]]/saleChances/addOrEdit.htm?id=' + id);
            }
        });

    });
</script>
</body>
</html>