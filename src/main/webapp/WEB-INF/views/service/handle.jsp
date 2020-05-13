<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>用户分配</title>
</head>

<body>
<div class="x-body">

    <form class="layui-form">
        <input type="text" id="id" value="${service.id}" name="id" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="L_serveType" class="layui-form-label">
                <span class="x-red">*</span>服务类型
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_serveType" readonly value="${service.serveType}" name="serveType"
                       required=""
                       lay-verify="serveType" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="customer" class="layui-form-label">
                <span class="x-red"></span>客户
            </label>
            <div class="layui-input-inline">
                <input type="text" id="customer" readonly value="${service.customer}" name="customer" required=""
                       lay-verify="customer" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="overview" class="layui-form-label">
                <span class="x-red"></span>概要
            </label>
            <div class="layui-input-inline">
                <input type="text" id="overview" readonly value="${service.overview}" name="overview" required=""
                       lay-verify="overview"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="servicerequest" class="layui-form-label">
                <span class="x-red"></span>服务请求
            </label>
            <div class="layui-input-inline">
                <input type="text" id="servicerequest" readonly value="${service.servicerequest}"
                       name="servicerequest" required=""
                       lay-verify="servicerequest"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="createPeople" class="layui-form-label">
                <span class="x-red"></span>创建人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="createPeople" readonly value="${service.createPeople}" name="createPeople"
                       required=""
                       lay-verify="createPeople"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="createTime" class="layui-form-label">
                <span class="x-red"></span>创建时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="createTime" readonly value="<fmt:formatDate value="${service.createTime}" pattern="yyyy-MM-dd"/>"
                       name="createTime" required=""
                       lay-verify="createTime"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">

            <label for="assigner" class="layui-form-label">
                <span class="x-red"></span>分配给
            </label>
            <div class="layui-input-inline">
                <input type="text" id="assigner" readonly value="${service.assigner}" name="assigner" required=""
                       lay-verify="assigner"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>


        <div class="layui-form-item">
            <label for="assignTime" class="layui-form-label">
                <span class="x-red"></span> 分配日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="assignTime" value="<fmt:formatDate value="${service.assignTime}" pattern="yyyy-MM-dd"/>"
                       name="assignTime" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-form-item">

            <label for="serviceProce" class="layui-form-label">
                <span class="x-red"></span>服务处理
            </label>
            <div class="layui-input-inline">
                <textarea type="text" id="serviceProce" text="${service.serviceProce}" name="serviceProce"
                          required=""
                          lay-verify="serviceProce"
                          autocomplete="off" class="layui-input"></textarea>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">

            <label for="serviceProce" class="layui-form-label">
                <span class="x-red"></span>服务处理人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="serviceProcePeople" value="${service.serviceProcePeople}"
                       name="serviceProcePeople" required=""
                       lay-verify="serviceProcePeople"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="serviceProceTime" class="layui-form-label">
                <span class="x-red"></span> 分配日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="serviceProceTime"
                       value="<fmt:formatDate value="${service.serviceProceTime}" pattern="yyyy-MM-dd"/>" name="serviceProceTime"
                       required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>

        <div class="layui-form-item">
            <button style="margin-left: 120px" class="layui-btn" lay-filter="add" lay-submit="">
                分配
            </button>
        </div>
    </form>
</div>
<script>
    layui.use(['form', 'layer', 'laydate'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate;
        //日期
        laydate.render({
            elem: '#serviceProceTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });

        //监听提交
        form.on('submit(add)', function (data) {
            $.ajax({
                url: "${staticPath}/customerService/update",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data.field),
                dataType: 'json',
                success: function (result) {
                    if (result.code == 500) {
                        layer.alert(result.msg, {icon: 5, shift: 6});
                    } else {
                        layer.alert("保存成功", {icon: 6}, function () {
                            //关闭当前frame
                            xadmin.close();
                            // 可以对父窗口进行刷新
                            xadmin.father_reload();
                        });
                    }
                }, error: function (result) {
                    layer.alert(result.msg, {icon: 5, shift: 6});
                }
            });
            return false;
        });
    });

</script>
</body>
</html>