<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>客户贡献分析</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">客户贡献分析</a>
        <a>
          <cite>客户贡献分析</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card-body ">
                <form class="layui-form  layui-col-space5">
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
            <div class="layui-card-body ">
                <table class="layui-hide" id="table" lay-filter="member"></table>
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
            , url: '${staticPath}/customer/findCutomerGx' //数据接口
            , page: true //开启分页
            , cols: [
                [ //表头
                    {"type": 'checkbox', "fixed": 'left'},
                    {field: 'name', title: '客户名称 '},
                    {field: 'gx', title: '订单总金额(元)'},
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


        //高级查询
        form.on('submit(search)', function (data) {
            var name = data.field.name;

            table.render({
                elem: '#table'
                , url: '${staticPath}/customer/findCutomerGx' //数据接口
                , page: true //开启分页
                , id: 'testReload'
                , method: 'post'
                , toolbar: '#toolbarDemo'
                , where: {
                    "name": name,
                }
                , cols: [
                    [ //表头
                        {"type": 'checkbox', "fixed": 'left'},
                        {field: 'name', title: '客户名称 '},
                        {field: 'gx', title: '订单总金额(元)'},
                    ]
                ]
                , id: 'testReload'
            });
            return false;
        });

    });

</script>
