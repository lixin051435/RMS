<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>开发计划新增</title>
</head>

<body>
<div class="x-body">

    <form class="layui-form" style="margin-top: 20px">
        <input type="text" id="id" value="${byId.id}" name="saleId" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="L_planDate" class="layui-form-label">
                <span class="x-red"></span>日期
            </label>
            <div class="layui-input-inline">

                <input type="text" id="L_planDate" placeholder="yyyy-MM-dd"
                       value="<fmt:formatDate value="${cusDevPlan.planDate}" pattern="yyy-MM-dd"/>" name="planDate" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_planItem" class="layui-form-label">
                <span class="x-red"></span>计划内容
            </label>
            <div class="layui-input-inline">
                <textarea type="text" id="L_planItem" placeholder="请输入计划内容" name="planItem" required=""
                       lay-verify="css"
                          autocomplete="off" class="layui-input">${cusDevPlan.planItem}</textarea>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_exeAffect" class="layui-form-label">
                <span class="x-red"></span>执行效果
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_exeAffect" placeholder="请输入执行效果"
                       value="${cusDevPlan.exeAffect}" name="exeAffect" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <button style="margin-left: 120px" class="layui-btn" lay-filter="add" lay-submit="">
                保存计划
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
            elem: '#L_planDate'
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
            console.log(data);
            $.ajax({
                url: "${staticPath}/cusDevPlan/save",
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