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
                <input type="text" id="L_name" readonly value="${saleChance.customerName}" name="customerName"
                       required=""
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
                <input type="text" readonly id="L_chanceSource" value="${saleChance.chanceSource}"
                       name="chanceSource"
                       required="" lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
            <div class="layui-form-item">
                <label for="L_linkMan" class="layui-form-label">
                    <span class="x-red"></span>联系人
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_linkMan" readonly value="${saleChance.linkMan}" name="linkMan"
                           required=""
                           lay-verify="css"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                </div>
                <div class="layui-form-item">
                    <label for="L_linkPhone" class="layui-form-label">
                        <span class="x-red"></span>联系电话
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" id="L_linkPhone" readonly value="${saleChance.linkPhone}" name="linkPhone"
                               required=""
                               lay-verify="css"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="L_cgjl" class="layui-form-label">
                <span class="x-red"></span>成功几率
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_cgjl" value="${saleChance.cgjl}" readonly name="cgjl" required=""
                       lay-verify="css"
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
                <input type="text" id="L_overView" readonly value="${saleChance.overView}" name="overView"
                       required=""
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
                <textarea id="L_description" readonly text="${saleChance.description}" name="description" required=""
                          lay-verify="css"
                          autocomplete="off" class="layui-input"></textarea>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_createMan" class="layui-form-label">
                <span class="x-red"></span>创建人
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_createMan" readonly value="${saleChance.createMan}" name="createMan"
                       required=""
                       lay-verify="css"
                       autocomplete="off" class="layui-input">
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
            <div class="layui-form-item">
                <label for="L_createTime" class="layui-form-label">
                    <span class="x-red"></span>创建时间
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_createTime" value="<fmt:formatDate value='${saleChance.createTime}' pattern='yyyy-MM-dd'/>" readonly placeholder="yyyy-MM-dd" name="createTime"
                           required=""
                           lay-verify="css"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_assignMan" class="layui-form-label">
                <span class="x-red"></span>指派给
            </label>
            <div class="layui-input-inline">
                <select id="L_assignMan" readonly name="assignMan" lay-verify="required" lay-search="">
                    <option value="">请选择分配状态</option>
                    <option ${saleChance.assignMan==3 ?"selected":""} value="3">小明</option>
                    <option ${saleChance.assignMan==4 ?"selected":""} value="4">小红</option>
                    <option ${saleChance.assignMan==5 ?"selected":""} value="5">小张</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
            </div>
            <div class="layui-form-item">
                <label for="L_assignTime" class="layui-form-label">
                    <span class="x-red"></span>指派时间
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_assignTime" placeholder="yyyy-MM-dd" name="assignTime"
                           required=""
                           value="<fmt:formatDate value='${saleChance.assignTime}' pattern='yyyy-MM-dd'/>"
                           lay-verify="css"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                </div>
            </div>
        </div>
    </form>
    <div class="layui-card-body ">
        <label class="layui-form-label">
            <span class="x-red"></span>开发计划项
        </label>
        <table class="layui-hide" id="table" lay-filter="member"></table>
    </div>

</div>
<script>
    layui.use(['form', 'table', 'layer', 'laydate'], function () {
        $ = layui.jquery;
        var table = layui.table;
        var form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate;

        var id = $("#id").val();
        console.log(id);
        table.render({
            elem: '#table'
            , url: '${staticPath}/cusDevPlan/list.do?id=' + id  //数据接口
            , cols: [
                [ //表头
                    {field: 'id', title: '编号 '},
                    {field: 'planDate', title: '日期 '},
                    {field: 'planItem', title: '计划内容'},
                    {field: 'exeAffect', title: '执行效果 '}
                ]
            ]
        });


        //监听提交
        /*  form.on('submit(add)', function (data) {
              console.log(data);
              var isUpdate = false;
              if (data.field.id && data.field.id.length > 0) {
                  isUpdate = true;
              }
              $.ajax({
                  url: isUpdate ? "[[

        /saleChances/edit.do" : "[[

        /saleChances/add.do",
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
          });*/
    });

</script>
</body>
</html>