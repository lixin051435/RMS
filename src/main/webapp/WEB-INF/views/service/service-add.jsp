<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>Service新增</title>
</head>

<body>
<div class="x-body">
    <form class="layui-form" style="margin-top: 20px">
        <div class="layui-form-item">
            <label for="serveType" class="layui-form-label">
                <span class="x-red">*</span>服务类型
            </label>
            <div class="layui-input-inline">
                <select id="serveType" name="serveType" lay-filter="required">
                    <option value="">请选择</option>

                </select>
            </div>
        </div>
        <div class="layui-form-mid layui-word-aux">
            <span class="x-red">*</span>
        </div>
        <div class="layui-form-item">
            <label for="overview" class="layui-form-label">
                <span class="x-red"></span>概要
            </label>
            <div class="layui-input-inline">
                <input type="text" id="overview" name="overview"
                       required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="customer" class="layui-form-label">
                <span class="x-red"></span>客户
            </label>
            <div class="layui-input-inline">
                <input type="text" id="customer" name="customer"
                       required="" lay-verify="css"
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
                <input type="text" id="servicerequest" name="servicerequest" required=""
                       lay-verify="css"
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
                <input type="text" id="createPeople" name="createPeople" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="createTime" class="layui-form-label">
                <span class="x-red"></span>创建日期
            </label>
            <div class="layui-input-inline">
                <input type="text" id="createTime" placeholder="yyyy-MM-dd"
                       name="createTime" required=""
                       lay-verify="css" autocomplete="off" class="layui-input">
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
            elem: '#createTime'
            , format: 'yyyy-MM-dd' //可任意组合
        });

        //动态加载职位
        $.ajax({
            url: "${staticPath}/dataDic/findDataDic?dataDicName=服务类型",
            type: 'POST',
            dataType: 'json',
            success: function (result) {
                var list = result.data; //返回的数据
                for (var i = 0; i < list.length; i++) {
                    //追加option
                    $("#serveType").append("<option value=" + list[i].dataDicValue + ">" + list[i].dataDicValue + "</option>");
                    //渲染刷新
                    form.render('select');
                }
            },
        });


        //监听提交
        form.on('submit(add)', function (data) {
            console.log(JSON.stringify(data.field));
            $.ajax({
                url: "${staticPath}/customerService/save",
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
                            layer.close();
                            // 可以对父窗口进行刷新
                            location.reload();
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