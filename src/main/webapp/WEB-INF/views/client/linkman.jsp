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
            <label for="L_linkName" class="layui-form-label">
                <span class="x-red">*</span>姓名
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_linkName" value="${linkMan.linkName}" name="linkName" required=""
                       lay-verify="name" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为客户唯一名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_sex" class="layui-form-label">
                <span class="x-red"></span>性别
            </label>
            <div id="L_sex" name="sex" value="${linkMan.sex}" class="layui-input-block">
                <input type="radio" name="sex" value="男" title="男" checked="">
                <input type="radio" name="sex" value="女" title="女">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_zhiwei" class="layui-form-label">
                <span class="x-red"></span>职位
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_zhiwei" value="${linkMan.zhiwei}" name="zhiwei" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_phone" class="layui-form-label">
                <span class="x-red"></span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_phone" value="${linkMan.phone}" name="phone" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_officePhone" class="layui-form-label">
                <span class="x-red"></span>办公电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_officePhone" value="${linkMan.officePhone}" name="officePhone" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
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
    layui.use(['form', 'layer'], function () {
        $ = layui.jquery;
        var form = layui.form
            , layer = layui.layer;


        //监听提交
        form.on('submit(add)', function (data) {
            console.log(data);
            $.ajax({
                url: "${staticPath}/linkMan/save",
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