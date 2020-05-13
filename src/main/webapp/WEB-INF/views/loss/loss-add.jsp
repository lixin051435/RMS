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

    <form class="layui-form">
        <input type="text" id="id" value="${customerLoss.id}" name="id" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="L_name" class="layui-form-label">
                <span class="x-red">*</span>客户名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_name" value="${customerLoss.cusName}" name="cusName" required=""
                       lay-verify="name" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为客户唯一名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cusManager" class="layui-form-label">
                <span class="x-red"></span>客户经理
            </label>
            <div class="layui-input-inline">
                <input type="text" id="cusManager" value="${customerLoss.cusManager}" name="cusManager" required=""
                       lay-verify="cusManager" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_lastOrderTime" class="layui-form-label">
                <span class="x-red"></span>上次下单日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_lastOrderTime" placeholder="yyyy-MM-dd" name="lastOrderTime" required=""
                       lay-verify="css"
                       value="<fmt:formatDate value="${customerLoss.lastOrderTime}" pattern="yyyy-MM-dd"/>"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_confirmLossTime" class="layui-form-label">
                <span class="x-red"></span>确认流失日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_confirmLossTime" placeholder="yyyy-MM-dd" name="confirmLossTime" required=""
                       lay-verify="css"
                       value="<fmt:formatDate value="${customerLoss.confirmLossTime}" pattern="yyyy-MM-dd"/>"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="lossReason" class="layui-form-label">
                <span class="x-red"></span>流失原因
            </label>
            <div class="layui-input-inline">
                <input type="text" id="lossReason" value="${customerLoss.lossReason}" name="lossReason" required=""
                       lay-verify="lossReason" autocomplete="off" class="layui-input">
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
        //日期
        laydate.render({
            elem: '#L_lastOrderTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });

        //日期
        laydate.render({
            elem: '#L_confirmLossTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });

        //自定义验证规则
        /*   form.verify({
               name: function (value) {
                   if (value.length < 2) {
                       return '菜单名至少2个字符';
                   }
               },
               sort: function (value) {
                   if (value.length <= 0) {
                       return '请填写整数排序值';
                   }
               }
           });*/

        //监听提交
        form.on('submit(add)', function (data) {

            $.ajax({
                url:"${staticPath}/customerLoss/save",
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