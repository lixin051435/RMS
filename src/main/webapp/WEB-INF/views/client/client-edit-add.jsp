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
        <input type="text" id="id" value="${customer.id}" name="id" style="display:none;" autocomplete="off"
               class="layui-input">
        <div class="layui-form-item">
            <label for="L_name" class="layui-form-label">
                <span class="x-red">*</span>客户名称
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_name" value="${customer.name}" name="name" required=""
                       lay-verify="name" autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>将会成为客户唯一名
            </div>
        </div>
        <div class="layui-form-item">
            <label for="area" class="layui-form-label">
                <span class="x-red"></span>客户地区
            </label>
            <div class="layui-input-inline">
                <select id="area" for="area" value="${customer.area}" name="area" lay-search="">
                    <option value="">请选择</option>
                    <option value="北京">北京</option>
                    <option value="上海">上海</option>
                    <option value="广州">广州</option>
                    <option value="深圳">深圳</option>
                    <option value="杭州">杭州</option>
                    <option value="南京">南京</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="cusManager" class="layui-form-label">
                <span class="x-red"></span>客户经理
            </label>
            <div class="layui-input-inline">
                <select id="devResult" for="cusManager" value="${customer.cusManager}"   name="cusManager" lay-search="">
                    <option value="">请选择</option>
                    <option value="小明">小明</option>
                    <option value="小张">小张</option>
                    <option value="小红">小红</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="level" class="layui-form-label">
                <span class="x-red"></span>客户等级
            </label>
            <div class="layui-input-inline">
                <select id="level" for="level" value="${customer.level}" name="level" lay-search="">
                    <option value="">请选择</option>
                    <option value="普通用户">普通用户</option>
                    <option value="重点开发客户">重点开发客户</option>
                    <option value="大客户">大客户</option>
                    <option value="合作伙伴">合作伙伴</option>
                    <option value="战略合作伙伴">战略合作伙伴</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="myd" class="layui-form-label">
                <span class="x-red"></span>客户满意度
            </label>
            <div class="layui-input-inline">
                <select id="myd" for="level" value="${customer.myd}" name="myd" lay-search="">
                    <option value="">请选择</option>
                    <option value="☆">☆</option>
                    <option value="☆☆">☆☆</option>
                    <option value="☆☆☆">☆☆☆</option>
                    <option value="☆☆☆☆">☆☆☆☆</option>
                    <option value="☆☆☆☆☆">☆☆☆☆☆</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="xyd" class="layui-form-label">
                <span class="x-red"></span>客户信用度
            </label>
            <div class="layui-input-inline">
                <select id="xyd" for="xyd" value="${customer.xyd}" name="xyd" lay-search="">
                    <option value="">请选择</option>
                    <option value="☆">☆</option>
                    <option value="☆☆">☆☆</option>
                    <option value="☆☆☆">☆☆☆</option>
                    <option value="☆☆☆☆">☆☆☆☆</option>
                    <option value="☆☆☆☆☆">☆☆☆☆☆</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="address" class="layui-form-label">
                <span class="x-red"></span>客户地址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="address" value="${customer.address}" name="address" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="postCode" class="layui-form-label">
                <span class="x-red"></span>邮政编码
            </label>
            <div class="layui-input-inline">
                <input type="text" id="postCode" value="${customer.postCode}" name="postCode" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="phone" class="layui-form-label">
                <span class="x-red"></span>联系电话
            </label>
            <div class="layui-input-inline">
                <input type="text" id="phone" value="${customer.phone}" name="phone" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="fax" class="layui-form-label">
                <span class="x-red"></span>传真
            </label>
            <div class="layui-input-inline">
                <input type="text" id="fax" value="${customer.phone}" name="fax" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="webSite" class="layui-form-label">
                <span class="x-red"></span>网址
            </label>
            <div class="layui-input-inline">
                <input type="text" id="webSite" value="${customer.webSite}" name="webSite" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="yyzzzch" class="layui-form-label">
                <span class="x-red"></span>营业执照注册号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="yyzzzch" value="${customer.yyzzzch}" name="yyzzzch" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="fr" class="layui-form-label">
                <span class="x-red"></span>法人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="fr" value="${customer.fr}" name="fr" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="zczj" class="layui-form-label">
                <span class="x-red"></span>注册资金(万元)
            </label>
            <div class="layui-input-inline">
                <input type="text" id="zczj" value="${customer.zczj}" name="zczj" required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>





        <div class="layui-form-item">
            <label for="nyye" class="layui-form-label">
                <span class="x-red"></span> 年营业额
            </label>
            <div class="layui-input-inline">
                <input type="text" id="nyye" value="${customer.nyye}" name="nyye" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="khyh" class="layui-form-label">
                <span class="x-red"></span> 开户银行
            </label>
            <div class="layui-input-inline">
                <input type="text" id="khyh" value="${customer.khyh}" name="khyh" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="khzh" class="layui-form-label">
                <span class="x-red"></span> 开户帐号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="khzh" value="${customer.khzh}" name="khzh" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="dsdjh" class="layui-form-label">
                <span class="x-red"></span> 地税登记号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="dsdjh" value="${customer.dsdjh}" name="dsdjh" required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
                <span class="x-red">*</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="gsdjh" class="layui-form-label">
                <span class="x-red"></span> 国税登记号
            </label>
            <div class="layui-input-inline">
                <input type="text" id="gsdjh" value="${customer.gsdjh}" name="gsdjh" required="" lay-verify="css"
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
                url: isUpdate ? "${staticPath}/customer/editDo" : "${staticPath}/customer/save",
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