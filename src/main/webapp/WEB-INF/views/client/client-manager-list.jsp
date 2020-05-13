<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>Client列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">Client列表</a>
        <a>
          <cite>Client列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form  layui-col-space5">
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="khno" placeholder="客户名编号"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="name" placeholder="请输入客户名称"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-header">
                    <button class="layui-btn" onclick="xadmin.open('新增','${staticPath}/customer/add')"><i
                            class="layui-icon"></i>新增
                    </button>
                </div>
                <table class="layui-hide" id="table" lay-filter="member"></table>
                <script type="text/html" id="toolbarDemo">
                    <div class="layui-btn-container">
                        <button class="layui-btn layui-btn-danger" lay-event="getCheckData1"><i class="layui-icon"></i>联系人管理
                        </button>
                        <button class="layui-btn layui-btn-danger" lay-event="getCheckData2"><i class="layui-icon"></i>交往记录管理
                        </button>
                        <button class="layui-btn layui-btn-danger" lay-event="getCheckData3"><i class="layui-icon"></i>历史订单
                        </button>
                    </div>
                </script>

                <div class="layui-card-body ">
                    <script type="text/html" id="barDemo">
                        <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                        <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                    </script>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
<script type="text/javascript">
    layui.use('table', function () {
        $ = layui.jquery;
        var table = layui.table,
            form = layui.form;
        table.render({
            elem: '#table'
            , url: '${staticPath}/customer/list' //数据接口
            , toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            , defaultToolbar: ['filter', 'exports', 'print', { //自定义头部工具栏右侧图标。如无需自定义，去除该参数即可
                title: '提示'
                , layEvent: 'LAYTABLE_TIPS'
                , icon: 'layui-icon-tips'
            }]
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'khno', title: '客户编号 ', width: 150},
                    {field: 'name', title: '客户名称 ', width: 150},
                    {field: 'cusManager', title: '客户经理 ', width: 100},
                    {field: 'level', title: '客户等级', width: 120},
                    {field: 'phone', title: '联系电话 ', width: 150},
                    {field: 'area', title: '客户地区', width: 150},
                    {field: 'myd', title: '客户满意度', width: 150},
                    {field: 'xyd', title: '客户信用度', width: 150},
                    {field: 'address', title: '客户地址', width: 150},
                    {field: 'postCode', title: '邮政编码', width: 150},
                    {field: 'fax', title: '传真', width: 150},
                    {field: 'webSite', title: '网址', width: 150},
                    {field: 'yyzzzch', title: '营业执照注册号', width: 200},
                    {field: 'fr', title: '法人', width: 150},
                    {field: 'zczj', title: '注册资金(万元)', width: 150},
                    {field: 'nyye', title: '年营业额', width: 150},
                    {field: 'khyh', title: '开户银行', width: 180},
                    {field: 'khzh', title: '开户帐号', width: 200},
                    {field: 'dsdjh', title: '地税登记号', width: 200},
                    {field: 'gsdjh', title: '国税登记号', width: 200},
                    {fixed: 'right', title: '操作', toolbar: '#barDemo',width:150}
                ]
            ]
            , id: 'testReload'

        });

        var $ = layui.$, active = {
            reload: function () {
                //执行重载
                table.reload('testReload', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    , where: {
                        key: {
                            id: $("#id").val()
                        }
                    }
                });
            }
        };
        //搜索
        $('#searchBtn').on('click', function () {
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //头工具栏事件
        table.on('toolbar(member)', function (obj) {
            var checkStatus = table.checkStatus(obj.config.id);
            console.log("-----------------------------")
            switch (obj.event) {
                case 'getCheckData1':
                    var data = checkStatus.data;
                    if (data.length == 0) {
                        layer.alert("请选择数据操作！")
                        return;
                    } else if (data.length >= 2) {
                        layer.alert("请选择一条数据操作！")
                        return;
                    }
                    var id = 0;
                    for (let i = 0; i < data.length; i++) {
                        id = data[i].id
                        break;
                    }
                    xadmin.open('信息', '${staticPath}/customer/linkman?id=' + id)
                    break;
                case 'getCheckData2':
                    var data = checkStatus.data;
                    if (data.length == 0) {
                        layer.alert("请选择数据操作！")
                        return;
                    } else if (data.length >= 2) {
                        layer.alert("请选择一条数据操作！")
                        return;
                    }
                    var id = 0;
                    for (let i = 0; i < data.length; i++) {
                        id = data[i].id
                        break;
                    }
                    xadmin.open('信息', '${staticPath}/customer/contact?id=' + id)
                    break;
                case 'getCheckData3':
                    var data = checkStatus.data;
                    if (data.length == 0) {
                        layer.alert("请选择数据操作！")
                        return;
                    } else if (data.length >= 2) {
                        layer.alert("请选择一条数据操作！")
                        return;
                    }
                    var id = 0;
                    for (let i = 0; i < data.length; i++) {
                        id = data[i].id
                        break;
                    }
                    xadmin.open('信息', '${staticPath}/customer/order?id=' + id)
                    break;
            }

        });
        //监听工具条
        table.on('tool(member)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: "${staticPath}/customer/delete",
                        type: "GET",
                        data: {id: data.id},
                        dataType: 'json',
                        success: function (result) {
                            if (result.code == 200) {
                                layer.alert("删除成功", {icon: 1}, function (index1) {
                                    layer.close(index1);
                                    // 可以对父窗口进行刷新
                                    location.reload();
                                });
                            } else {
                                layer.alert(result.msg);
                            }

                        },
                    });
                });
            } else if (obj.event === 'edit') {
                var id = data.id;//当前行的id
                xadmin.open('编辑信息', '${staticPath}/customer/edit?id=' + id);
            }
        });
        //高级查询
        form.on('submit(search)', function (data) {
            var khno = data.field.khno;
            var name = data.field.name;
            table.render({
                elem: '#table'
                , url: '${staticPath}/customer/findUserByFuzzyUserName' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "khno": khno,
                    "name": name
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'khno', title: '客户编号 ', width: 150},
                        {field: 'name', title: '客户名称 ', width: 150},
                        {field: 'cusManager', title: '客户经理 ', width: 100},
                        {field: 'level', title: '客户等级', width: 120},
                        {field: 'phone', title: '联系电话 ', width: 150},
                        {field: 'area', title: '客户地区', width: 150},
                        {field: 'myd', title: '客户满意度', width: 150},
                        {field: 'xyd', title: '客户信用度', width: 150},
                        {field: 'address', title: '客户地址', width: 150},
                        {field: 'postCode', title: '邮政编码', width: 150},
                        {field: 'fax', title: '传真', width: 150},
                        {field: 'webSite', title: '网址', width: 150},
                        {field: 'yyzzzch', title: '营业执照注册号', width: 200},
                        {field: 'fr', title: '法人', width: 150},
                        {field: 'zczj', title: '注册资金(万元)', width: 150},
                        {field: 'nyye', title: '年营业额', width: 150},
                        {field: 'khyh', title: '开户银行', width: 180},
                        {field: 'khzh', title: '开户帐号', width: 200},
                        {field: 'dsdjh', title: '地税登记号', width: 200},
                        {field: 'gsdjh', title: '国税登记号', width: 200},
                        {fixed: 'right', title: '操作', toolbar: '#barDemo',width:150}
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });
    });
</script>
