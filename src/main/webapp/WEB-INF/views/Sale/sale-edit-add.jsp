<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>更新与新增</title>
</head>

<body>
<div class="x-body">

    <form class="layui-form">
        <input type="text" id="id" value="${saleChance.id}" name="id" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="L_name" class="layui-form-label">
                <span class="x-red">*</span>客户名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_name" value="${saleChance.customerName}" name="customerName" required=""
                       lay-verify="name" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为客户唯一名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_chanceSource" class="layui-form-label">
                <span class="x-red"></span>机会来源
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_chanceSource" value="${saleChance.chanceSource}" name="chanceSource"
                       required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_linkMan" class="layui-form-label">
                <span class="x-red"></span>联系人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_linkMan" value="${saleChance.linkMan}" name="linkMan" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_linkPhone" class="layui-form-label">
                <span class="x-red"></span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_linkPhone" value="${saleChance.linkPhone}" name="linkPhone" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_cgjl" class="layui-form-label">
                <span class="x-red"></span>成功几率
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_cgjl" value="${saleChance.cgjl}" name="cgjl" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>(范围是 0 ~ 100)
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_overView" class="layui-form-label">
                <span class="x-red"></span>概要
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_overView" value="${saleChance.overView}" name="overView" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_description" class="layui-form-label">
                <span class="x-red"></span>机会描述
            </label>
            <div class="layui-input-inline">
                <textarea id="L_description"  name="description" required=""
                          lay-verify="css"
                          autocomplete="off" class="layui-input">${saleChance.description}</textarea>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_createMan" class="layui-form-label">
                <span class="x-red"></span>创建人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_createMan" value="${saleChance.createMan}" name="createMan" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_assignMan" class="layui-form-label">
                <span class="x-red"></span>指派给
            </label>
            <div class="layui-input-inline">
                <select id="L_assignMan" name="assignMan" lay-verify="required" lay-search="">
                    <option value="">请选择分配状态</option>
                    <option ${saleChance.assignMan==3?"selected":""} value="3">小明</option>
                    <option ${saleChance.assignMan==4?"selected":""} value="4">小红</option>
                    <option ${saleChance.assignMan==5?"selected":""} value="5">小张</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_createTime" class="layui-form-label">
                <span class="x-red"></span>创建时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_createTime" placeholder="yyyy-MM-dd" name="createTime" required=""
                       lay-verify="css"
                       value="<fmt:formatDate value="${saleChance.createTime}" pattern="yyyy-MM-dd"/>"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_assignTime" class="layui-form-label">
                <span class="x-red"></span>指派时间
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_assignTime" placeholder="yyyy-MM-dd" name="assignTime" required=""
                       lay-verify="css"
                       value="<fmt:formatDate value="${saleChance.assignTime}" pattern="yyyy-MM-dd"/>"
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
        //日期
        laydate.render({
            elem: '#L_createTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });

        //日期
        laydate.render({
            elem: '#L_assignTime'
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
            var isUpdate = false;
            if (data.field.id && data.field.id.length > 0) {
                isUpdate = true;
            }
            $.ajax({
                url: isUpdate ? "${staticPath}/saleChances/edit.do" : "${staticPath}/saleChances/add.do",
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