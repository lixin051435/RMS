<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html class="x-admin-sm">
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>clientDevList列表</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">客户开发记录</a>
        <a>
          <cite>开发计划列表</cite></a>
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
                            <input type="text" id="customerName" name="customerName" placeholder="请输入客户名"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" id="overView" name="overView" placeholder="请输入概要"
                                   autocomplete="off"
                                   class="layui-input">
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <div class="layui-input-inline">
                                <select id="devResult" name="devResult" lay-search="">
                                    <option value="">请选择客户开发状态</option>
                                    <option value="0">未开发</option>
                                    <option value="1">开发中</option>
                                    <option value="2">开发成功</option>
                                    <option value="3">开发失败</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" lay-submit="" lay-filter="search"><i
                                    class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-header">
                </div>

                <div class="layui-card-body ">
                    <table class="layui-hide" id="table" lay-filter="member"></table>
                </div>

                <div class="layui-card-body ">
                    <script type="text/html" id="barDemo">
                        {{#  if(d.devResult ==0){ }}
                        <a class="layui-btn layui-btn-xs" lay-event="del">开发</a>
                        {{# }if(d.devResult ==1) { }}
                        <a class="layui-btn layui-btn-xs  " lay-event="del">继续开发</a>
                        {{# }if(d.devResult ==2) { }}
                        <a class="layui-btn layui-btn-xs  layui-btn-warm" lay-event="edit">查看详细信息</a>
                        {{# }if(d.devResult ==3) { }}
                        <a class="layui-btn layui-btn-xs  layui-btn-warm" lay-event="edit">查看详细信息</a>
                        {{#  } }}
                    </script>
                    <script type="text/html" id="barMan">
                        {{#  if( d.assignMan ==3){ }}
                        <a>小明</a>
                        {{# }if(d.assignMan ==4) { }}
                        <a>小红</a>
                        {{# }if(d.assignMan ==5) { }}
                        <a>小张</a>
                        {{#  } }}
                    </script>
                    <script type="text/html" id="barResult">
                        {{#  if( d.devResult ==0){ }}
                        <a>未开发</a>
                        {{# }if(d.devResult ==1) { }}
                        <a>开发中</a>
                        {{# }if(d.devResult ==2) { }}
                        <a>开发成功</a>
                        {{# }if(d.devResult ==3) { }}
                        <a>开发失败</a>
                        {{#  } }}
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
            , url: '${staticPath}/saleChances/listPage?state=1' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'id', title: '编号 '},
                    {field: 'customerName', title: '客户名称 '},
                    {field: 'overView', title: '概要'},
                    {field: 'linkMan', title: '联系人 '},
                    {field: 'createMan', title: '创建人 '},
                    {field: 'createTime', title: '创建时间'},
                    {field: 'assignMan', title: '指派人 ', toolbar: '#barMan'},
                    {field: 'assignTime', title: '指派时间 '},
                    {field: 'devResult', title: '开发状态', toolbar: '#barResult'}
                    , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
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

        //监听工具条
        table.on('tool(member)', function (obj) {
            var data = obj.data;
            if (obj.event === 'del') {
                var id = data.id;//当前行的id
                xadmin.open('开发信息', '${staticPath}/cusDevPlan/detailAddDev?id=' + id);
            } else if (obj.event === 'edit') {
                var id = data.id;//当前行的id
                xadmin.open('开发信息', '${staticPath}/cusDevPlan/detailDev?id=' + id);
            }
        });
        //高级查询
        form.on('submit(search)', function (data) {
            var customerName = data.field.customerName;
            var overView = data.field.overView;
            var devResult = data.field.devResult;
            table.render({
                elem: '#table'
                , url: '${staticPath}/saleChances/findUserByFuzzyUserName.do' //数据接口
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "state": 1,
                    "customerName": customerName,
                    "overView": overView,
                    "devResult": devResult
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'id', title: '编号 '},
                        {field: 'customerName', title: '客户名称 '},
                        {field: 'overView', title: '概要'},
                        {field: 'linkMan', title: '联系人 '},
                        {field: 'createMan', title: '创建人 '},
                        {field: 'createTime', title: '创建时间'},
                        {field: 'assignMan', title: '指派人 ', toolbar: '#barMan'},
                        {field: 'assignTime', title: '指派时间 '},
                        {field: 'devResult', title: '开发状态', toolbar: '#barResult'}
                        , {fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150}
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });
    });

</script>
