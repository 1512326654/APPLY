<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/22
  Time: 18:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/dy.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/time.js"></script>

</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <%--当头欢迎--%>
    <blockquote class="layui-elem-quote">欢迎管理员：
        <span class="x-red">${param.adminName}</span>！当前时间:<label id="time"></label>
    </blockquote>
        <%----------------------------------------------------------------一班--------------------------------------------------------------------%>
    <%--一班当周各组数据统计--%>
    <fieldset class="layui-elem-field dy-show-disable classOne">
        <legend>一班各组提交周报总数数据统计</legend>
        <div class="layui-field-box" id="classOne">
            <%--占位--%>
        </div>
    </fieldset>
    <%--一班当周各组数据统计--%>
    <fieldset class="layui-elem-field dy-show-disable classOne">
        <legend>一班各组组周报提交状态</legend>
        <div class="layui-field-box" id="classOneStatus">
            <%--占位--%>
        </div>
    </fieldset>
        <%----------------------------------------------------------------二班--------------------------------------------------------------------%>
    <%--二班当周各组数据统计--%>
    <fieldset class="layui-elem-field dy-show-disable classTwo">
        <legend>二班各组提交周报总数数据统计</legend>
        <div class="layui-field-box" id="classTwo">
            <%--占位--%>
        </div>
    </fieldset>
    <%--一班当周各组数据统计--%>
    <fieldset class="layui-elem-field dy-show-disable classTwo">
        <legend>二班各组组周报提交状态</legend>
        <div class="layui-field-box" id="classTwoStatus">
            <%--占位--%>
        </div>
    </fieldset>
    <%--周报提交状态--%>
    <fieldset class="layui-elem-field">
        <legend>周报提交状态</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody id="memberstatus">
                <%--占位--%>
                </tbody>
            </table>
        </div>
    </fieldset>
    <%--系统信息--%>
    <fieldset class="layui-elem-field">
        <legend>系统信息</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>后台版本</th>
                    <td>2.5</td></tr>
                <tr>
                    <th>服务器地址</th>
                    <td>119.29.205.96</td></tr>
                </tbody>
            </table>
        </div>
    </fieldset>
    <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,jquery提供技术支持。</blockquote>
</div>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            show_menberReportes_status(${param.classNum}, 0, "#memberstatus");
        },2000)
        var classNum = ${param.classNum};

        if (classNum == 1){
            $(".classOne").removeClass("dy-show-disable");

            setTimeout(function () {
                getEachClassGroupReportedNum(1,"classOne");
                setTimeout(function () {
                    showGroupReportStatus(1, "classOneStatus");
                    setTimeout(function () {
                        showMemberReportStatus(1, 0, memberstatus);
                    },500)
                },500)
            },500)
        }

        if (classNum == 2){
            $(".classTwo").removeClass("dy-show-disable");
            setTimeout(function () {
                getEachClassGroupReportedNum(2,"classTwo");
                setTimeout(function () {
                    showGroupReportStatus(2, "classTwoStatus");
                    setTimeout(function () {
                        showMemberReportStatus(2, 0, memberstatus);
                    },500)
                },500)
            },500)
        }
        if(classNum == 0){
            $(".classOne").removeClass("dy-show-disable");
            $(".classTwo").removeClass("dy-show-disable");
            setTimeout(function () {
                getEachClassGroupReportedNum(1,"classOne");
                showGroupReportStatus(1, "classOneStatus");
                setTimeout(function () {
                    getEachClassGroupReportedNum(2,"classTwo");
                    showGroupReportStatus(2, "classTwoStatus");
                    showMemberReportStatus(0, 0, memberstatus);
                },700)
            },700)
        }


        // 成员周报提交状态
        function showMemberReportStatus(STUCALSS, STUGROUP, SHOWID) {
            $.ajax({
                url:"/student/showMemberGroupReportStatus.do",
                type:"POST",
                data:{
                    stuClass:STUCALSS,
                    stuGroup:STUGROUP,
                    index:true
                },
                success: function (result) {
                    var data = JSON.parse(result);
                    var trstyle;
                    $.each(data,function(index,element){
                        if ((data[index].status).indexOf("未提交") != -1) {
                            trstyle = "<tr style='color: #F8784D'>"
                        }
                        if ((data[index].status).indexOf("已提交") != -1) {
                            trstyle = "<tr style='color: ##3FF388'>"
                        }
                        $(SHOWID).append(
                            trstyle +
                            "<th>" + data[index].stuName + "</th>" +
                            "<td>" + data[index].status + "</td>" +
                            "</tr>"
                        )
                    })
                },
                error: function (res) {
                    layer.msg("数据获取失败",{icon:5})
                }
            })
        };


        function getEachClassGroupReportedNum( CLASSNUM , DIVID) {
            $.ajax({
                url: "/admin/eachClassGroupReportedNum.do",
                type: "POST",
                data: {
                    repClass: CLASSNUM
                },
                success: function (result) {
                    var data = JSON.parse(result);
                    // 判断一行是否超过六个
                    var flag = 0;
                    $.each(data , function (index , elem) {
                        if (( index % 6 ) == 0){
                            flag ++;
                            $("#" + DIVID).append(
                                "<div class='layui-col-md12'>" +
                                "<div class='layui-card'>" +
                                "<div class='layui-card-body'>" +
                                "<div class='layui-carousel x-admin-carousel x-admin-backlog' style='width: 100%; height: 90px;'>" +
                                "<div>" +
                                "<ul class='layui-row layui-col-space10 layui-this' id='" + (DIVID + flag) + "'>" +
                                "</ul>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>"
                            );
                        }
                        $("#" + DIVID + flag).append(
                            "<li class='layui-col-xs2'>" +
                            "<a href='javascript:;' class='x-admin-backlog-body'>" +
                            "<h3>第" + elem.stuGroup + "组提交人数</h3>" +
                            "<p>" +
                            "<cite>" + elem.reportedNum + "/" + elem.groupNum + "</cite></p>" +
                            "</a>" +
                            "</li>"
                        );

                    })
                },
                error: function (res) {
                    layer.msg("数据获取失败", {icon: 5})
                }
            })
        };

        function showGroupReportStatus(CLASSNUM, DIVID) {
            $.ajax({
                url: "/admin/showGroupReportStatus.do",
                type: "GET",
                data: {
                    stuClass:CLASSNUM
                },
                success: function (result) {
                    var data = JSON.parse(result);
                    // 判断一行是否超过六个
                    var flag = 0;
                    $.each(data , function (index , elem) {
                        if (( index % 6 ) == 0){
                            flag ++;
                            $("#" + DIVID).append(
                                "<div class='layui-col-md12'>" +
                                "<div class='layui-card'>" +
                                "<div class='layui-card-body'>" +
                                "<div class='layui-carousel x-admin-carousel x-admin-backlog' style='width: 100%; height: 90px;'>" +
                                "<div>" +
                                "<ul class='layui-row layui-col-space10 layui-this' id='" + (DIVID + flag) + "'>" +
                                "</ul>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>" +
                                "</div>"
                            );
                        }
                        $("#" + DIVID + flag).append(
                            "<li class='layui-col-xs2'>" +
                            "<a href='javascript:;' class='x-admin-backlog-body'>\n" +
                            "<h3>第" + elem.stuName + "组组周报提交状态</h3>" +
                            "<p>" +
                            "<cite>" + elem.status + "</cite></p>" +
                            "</a>" +
                            "</li>"
                        );

                    })
                },
                error: function (res) {
                    layer.msg("数据获取失败", {icon: 5})
                }
            })
        }

    });
</script>
</body>
</html>
