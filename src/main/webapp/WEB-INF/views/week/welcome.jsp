<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/19
  Time: 18:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>组长后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/js/time.js"></script>
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <blockquote class="layui-elem-quote">欢迎${requestScope.info.student.stuGroup}组组长：
        <span class="x-red">${requestScope.info.student.stuName}</span>！当前时间:<label id="time"></label>
    </blockquote>
    <fieldset class="layui-elem-field">
        <legend>数据统计</legend>
        <div class="layui-field-box">
            <div class="layui-col-md12">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside"
                             lay-arrow="none" style="width: 100%; height: 90px;">
                            <div carousel-item="">
                                <ul class="layui-row layui-col-space10 layui-this">
                                    <li class="layui-col-xs4">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>已提交周报人数</h3>
                                            <p>
                                                <cite id="reported"></cite></p>
                                        </a>
                                    </li>
                                    <li class="layui-col-xs4">
                                        <a href="javascript:;" class="x-admin-backlog-body">
                                            <h3>本组本周组周报提交状态</h3>
                                            <p>
                                                <cite id="reportedstatus"></cite></p>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>组员周报提交状态</legend>
        <div class="layui-field-box">
            <table class="layui-table" lay-skin="line">
                <tbody id="memberstatus">
                <%--占位--%>
                </tbody>
            </table>
        </div>
    </fieldset>
    <fieldset class="layui-elem-field">
        <legend>版本信息</legend>
        <div class="layui-field-box">
            <table class="layui-table">
                <tbody>
                <tr>
                    <th>组长版后台版本</th>
                    <td>1.3</td>
                </tr>
                <tr>
                    <th>周报前台版本</th>
                    <td>1.0</td>
                </tr>
                </tbody>
            </table>
        </div>
    </fieldset>
</div>
<script type="text/javascript" src="/js/xt-report.js"></script>
<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            showGroupDataStatistics(${requestScope.info.student.stuClass}, ${requestScope.info.student.stuGroup}, "#reported");
            setTimeout(function () {
                showGroupReportStatus(${requestScope.info.student.stuClass}, ${requestScope.info.student.stuGroup}, "#reportedstatus");
                setTimeout(function () {
                    showMemberReportStatus(${requestScope.info.student.stuClass}, ${requestScope.info.student.stuGroup}, "#memberstatus");
                }, 700)
            }, 600)
        }, 600)
    });

    // 组成员周报提交状态
    function showMemberReportStatus(CLASSNUM, GROUPNUM, SHOWID) {
        $.ajax({
            url: "/student/showMemberGroupReportStatus.do",
            type: "POST",
            data: {
                stuClass: CLASSNUM,
                stuGroup: GROUPNUM,
                index: true
            },
            success: function (result) {
                var data = JSON.parse(result);
                var trstyle;
                $.each(data, function (index, element) {
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
                layer.msg("数据获取失败", {icon: 5})
            }
        })
    };

    // 组周报提交状态
    function showGroupReportStatus(CLASSNUM, GROUPNUM, SHOWID) {
        $.ajax({
            url: "/student/showGroupReportStatus.do",
            type: "GET",
            data: {
                stuClass: CLASSNUM,
                stuGroup: GROUPNUM
            },
            success: function (result) {
                var data = JSON.parse(result);
                $(SHOWID).html(data[0].status)
            },
            error: function (res) {
                layer.msg("数据获取失败", {icon: 5})
            }
        })
    };
</script>
</body>
</html>
