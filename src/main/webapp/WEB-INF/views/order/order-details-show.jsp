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

    <input type="text" id="id" value="${order.id}" name="id" style="display:none;" autocomplete="off"
           class="layui-input">
    <div class="layui-form-item">
        <label for="L_khno" class="layui-form-label">
            <span class="x-red">*</span>订单编号
        </label>
        <div class="layui-input-inline">
            <input type="text" id="L_khno" readonly value="${order.orderNo}" name="orderNo"
                   required=""
                   lay-verify="orderNo" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_orderDate" class="layui-form-label">
            <span class="x-red"></span>订购日期
        </label>
        <div class="layui-input-inline">

            <input type="text" readonly id="L_orderDate"
                   value="<fmt:formatDate value="${order.orderDate}" pattern="yyyy-MM-dd"/>"
                   name="orderDate"
                   required="" lay-verify="css"
                   autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
        </div>
    </div>
    <div class="layui-form-item">
        <label for="L_state" class="layui-form-label">
            <span class="x-red">*</span>订单状态
        </label>
        <div class="layui-input-inline">
            <c:if test="${order.state=='0'}">
                <input type="text" id="L_state" readonly case="0" value="未回款" name="state"
                       required="" lay-verify="state" autocomplete="off" class="layui-input">
            </c:if>
            <input type="text" id="L_state" readonly case="1" value="已回款" name="state"
                   required="" lay-verify="state" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
        </div>
    </div>
    <div class="layui-form-item">
        <label for="sum" class="layui-form-label">
            <span class="x-red">*</span>总金额
        </label>
        <div class="layui-input-inline">

            <input type="text" id="sum" readonly value="${totalPriceByOrderId}" name="sum"
                   required=""
                   lay-verify="sum" autocomplete="off" class="layui-input">
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
        </div>
    </div>
    <div class="layui-card-body ">
        <label class="layui-form-label">
            <span class="x-red"></span>订单列表
        </label>
        <table class="layui-hide" id="table" lay-filter="member"></table>
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
            , url: '${staticPath}/orderDetails/list?orderId=' + id  //数据接口
            , cols: [
                [ //表头
                    {field: 'id', title: '编号 '},
                    {field: 'goodsName', title: '商品名称 '},
                    {field: 'goodsNum', title: '商品数量'},
                    {field: 'unit', title: '单位 '},
                    {field: 'price', title: '价格 '},
                    {field: 'sum', title: '总金额 '}
                ]
            ]
        });
    });
</script>
</body>
</html>