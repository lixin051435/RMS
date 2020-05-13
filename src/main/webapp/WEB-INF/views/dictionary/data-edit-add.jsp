<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <input type="text" id="id" value="${dataDic.id}" name="id" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="dataDicName" class="layui-form-label">
                <span class="x-red">*</span>数据字典
            </label>
            <div class="layui-input-inline">
                <input type="text" id="dataDicName" value="${dataDic.dataDicName}" name="dataDicName" required=""
                       lay-verify="dataDicName" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="dataDicValue" class="layui-form-label">
                <span class="x-red"></span>数据字典值
            </label>
            <div class="layui-input-inline">
                <input type="text" id="dataDicValue" value="${dataDic.dataDicValue}" name="dataDicValue"
                       required="" lay-verify="css"
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
        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            var isUpdate = false;
            if (data.field.id && data.field.id.length > 0) {
                isUpdate = true;
            }
            $.ajax({
                url: isUpdate ? "${staticPath}/dataDic/update" : "${staticPath}/dataDic/save",
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