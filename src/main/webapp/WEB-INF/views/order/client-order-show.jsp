<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>交往记录</title>
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
            <span class="x-red"></span>订单记录
        </label>
        <table class="layui-hide" id="table" lay-filter="member"></table>
    </div>
    <div class="layui-card-body ">
        <script type="text/html" id="barDemo">
            <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="showOrder">查看订单明细</a>
        </script>
        <script type="text/html" id="barState">
            {{#  if( d.state ==0){ }}
            <a>未回款</a>
            {{#  } }}
            <a>已回款</a>
        </script>
    </div>
</div>
<script>
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
            , url: '${staticPath}/order/list?cusId=' + id  //数据接口
            , cols: [
                [ //表头
                    {field: 'id', title: '编号 '},
                    {field: 'orderNo', title: '订单号 '},
                    {field: 'orderDate', title: '订购日期'},
                    {field: 'address', title: '送货地址 '},
                    {field: 'state', title: '状态 ', toolbar: '#barState'},
                    {fixed: 'right', title: '操作', toolbar: '#barDemo'}
                ]
            ]
        });
        //监听工具条
        table.on('tool(member)', function (obj) {
            var data = obj.data;
            if (obj.event === 'showOrder') {
                var id = data.id;//当前行的id
                xadmin.open('编辑信息', '${staticPath}/order/orderDetails?id=' + id);
            } else if (obj.event === 'edit') {
                var id = data.id;//当前行的id
                // xadmin.open('编辑信息', '[[${#httpServletRequest.getContextPath()}]]/saleChances/addOrEdit.htm?id=' + id);
            }
        });

    });
</script>
</body>
</html>