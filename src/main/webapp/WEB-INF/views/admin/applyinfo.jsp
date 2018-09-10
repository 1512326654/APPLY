<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/9
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>报名信息列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/jeui.css" media="all">
    <link rel="stylesheet" href="../css/skin/jebox.css"  media="all">
    <link rel="stylesheet" href="../css/skin/jedate.css"  media="all">
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/modules/jeui.js"></script>
</head>
<body>
<div class="je-p20">
    <blockquote class="je-quote green je-f16 je-ovh  je-mb10">
        <p class="je-pb5 checkbox">
            <label class="test" id="select_class">
                <select class="myselect">
                    <option value="default" selected>请选择班级</option>
                    <option value="1">一班</option>
                    <option value="2">二班</option>
                </select>
            </label>
            <select class="myselect" id="select_group">
                <option value="default" selected>请选择组别</option>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
                <option value="7">7</option>
                <option value="8">8</option>
                <option value="9">9</option>
            </select>
            <%--<input type="text" name="title" id="inpstart" placeholder="开始日期" readonly class="je-input je-pl5 je-pr5">--%>
            <%--<input type="text" name="title" id="inpend" placeholder="结束日期" readonly class="je-input je-pl5 je-pr5">--%>
            <input type="text" autocomplete="off" placeholder="按姓名查找[可选]" class="je-input je-pl5 je-pr5" id="s_name">
            <button class="je-btn je-f14" id="search">查询</button>
        </p>
    </blockquote>
    <table class="je-table je-mb20" id="newCheck">
        <thead>
        <tr>
            <th align="left">报名ID</th>
            <th>姓名</th>
            <th>时间</th>
            <th>星期</th>
            <th>班级</th>
            <th>组别</th>
        </tr>
        </thead>
        <!--AJAX回调显示结果---开始-->
        <tbody id="remark">
            <!--此处是AJAX回调显示结果-->
            <!--此处是AJAX回调显示结果-->
            <!--此处是AJAX回调显示结果-->
            <!--此处是AJAX回调显示结果-->
            <!--此处是AJAX回调显示结果-->
        </tbody>
        <!--AJAX回调显示结果---结束-->
    </table>
</div>
<script type="text/javascript">
    /**
     * $(function () { })
     * 所有的DOM加载完成后加载
     */
    $(function () {
        var role = "${param.role}";
        //如果为超级管理员显示按班级查找
        if (role == 0){
            $("#select_class").removeClass("test");
        }
        //根据角色进行异步调用数据库中的报名信息
        $.ajax({
            url:"../AdminServlet",
            type: "post",
            data:{
                operating:"applyinfo",
                role:role
            },
            success: function (result) {
                var dataObj = JSON.parse(result);
                $.each(dataObj, function(i, value) {
                    $("#remark").append(
                        "<tr>" +
                        "<td width='70px'>" + value.a_id + "</td>" +
                        "<td width='100px'>" + value.a_name + "</td>" +
                        "<td>" + value.a_time + "</td>" +
                        "<td>" + value.a_week + "</td>" +
                        "<td>" + value.s_class + "</td>" +
                        "<td>" + value.s_group + "</td>" +
                        "<tr>"
                    );

                });
            },
            error: function (res) {
            }
        });
        $("#search").click(function () {
            $("#remark").html("");
            var s_class = $("#select_class option:selected").val();
            var s_group = $("#select_group option:selected").val();
            var s_name = $("#s_name").val();
            if (s_class == "default" && s_group == "default" && s_name == "") {
                $.ajax({
                    url:"../AdminServlet",
                    type: "post",
                    data:{
                        operating:"applyinfo",
                        role:role
                    },
                    success: function (result) {
                        var dataObj = JSON.parse(result);
                        $.each(dataObj, function(i, value) {
                            $("#remark").append(
                                "<tr>" +
                                "<td width='70px'>" + value.a_id + "</td>" +
                                "<td width='100px'>" + value.a_name + "</td>" +
                                "<td>" + value.a_time + "</td>" +
                                "<td>" + value.a_week + "</td>" +
                                "<td>" + value.s_class + "</td>" +
                                "<td>" + value.s_group + "</td>" +
                                "<tr>"
                            );

                        });
                    },
                    error: function (res) {
                    }
                });
            }else {
                if (s_class == "default"){
                    s_class = 0;
                }
                if (s_group == "default"){
                    s_group = 0;
                }
                if (s_name == ""){
                    s_name = "null";
                }
                $.ajax({
                    url:"../AdminServlet",
                    type: "post",
                    data:{
                        operating:"searchApply",
                        s_class:s_class,
                        s_group:s_group,
                        s_name:s_name
                    },
                    success: function (result) {

                        var dataObj = JSON.parse(result);
                        $.each(dataObj, function(i, value) {
                            $("#remark").append(
                                "<tr>" +
                                "<td width='70px'>" + value.a_id + "</td>" +
                                "<td width='100px'>" + value.a_name + "</td>" +
                                "<td>" + value.a_time + "</td>" +
                                "<td>" + value.a_week + "</td>" +
                                "<td>" + value.s_class + "</td>" +
                                "<td>" + value.s_group + "</td>" +
                                "<tr>"
                            );
                        });
                    },
                    error: function (res) {
                    }
                });
            }


        })
    })
</script>
<script type="text/javascript">
    jeui.use(["jeSelect"],function () {
        $(".myselect").jeSelect({
            sosList: false
        });
    });
</script>
<style>
    .test{
        display: none;
    }
</style>
</body>
</html>
