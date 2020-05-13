<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/commons/basejs.jsp" %>
    <meta charset="UTF-8">
    <title>客户构成分析图</title>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">客户构成分析图</a>
        <a>
          <cite>客户构成分析图</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>

<div class="layui-fluid">
    <div class="layui-row  layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card-body">
                <div class="layui-card-header" style="text-align: center;size: A3">客户服务分析</div>
                <div id="main1" class="layui-col-sm12" style="height: 300px;"></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script type="text/javascript">


    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main1'));
    $.ajax({
        url: '${staticPath}/customer/findCutomerFw',
        type: 'POST',
        dataType: 'json',
        success: function (result) {
            // 指定图表的配置项和数据
            var option = {
                tooltip : {
                    trigger: 'item',
                    formatter: "{a} <br/>{b} : {c} ({d}%)"
                },
                legend: {
                    orient: 'vertical',
                    left: 'left',
                    data: result.data.serveType
                },
                series : [
                    {
                        name: '访问来源',
                        type: 'pie',
                        radius : '55%',
                        center: ['50%', '60%'],
                        data:result.data.echartsDto,
                        itemStyle: {
                            emphasis: {
                                shadowBlur: 10,
                                shadowOffsetX: 0,
                                shadowColor: 'rgba(0, 0, 0, 0.5)'
                            }
                        }
                    }
                ]
            };
            // 使用刚指定的配置项和数据显示图表。
            myChart.setOption(option);
        }

    })


</script>
