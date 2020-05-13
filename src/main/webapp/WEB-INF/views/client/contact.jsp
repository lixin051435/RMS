<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>更新与新增</title>
</head>

<body>
<div class="x-body">
    <form class="layui-form"><input type="text" id="id" value="${customer.id}" name="id" style="display:none;"
                                    autocomplete="off"
                                    class="layui-input">

        <div class="layui-form-item">
            <label for="L_contactTime" class="layui-form-label">
                <span class="x-red">*</span>交往时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_contactTime" value="${contact.contactTime}" name="contactTime" required=""
                       lay-verify="name" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_address" class="layui-form-label">
                <span class="x-red"></span>交往地点
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_address" value="${contact.address}" name="address" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_overView" class="layui-form-label">
                <span class="x-red"></span>概要
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_overView" value="${contact.overView}" name="overView" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <button style="margin-left: 120px" class="layui-btn" lay-filter="add" lay-submit="">
                保存
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

        laydate.render({
            elem: '#L_contactTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });
        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            $.ajax({
                url: "${staticPath}/contact/save",
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: JSON.stringify(data.field),
                dataType: 'json',
                success: function (result) {
                    if (result.code == 500) {
                        layer.alert(result.msg, {icon: 5, shift: 6});
                    } else {
                        layer.msg("保存成功", {time: 1000, icon: 6}, function () {
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