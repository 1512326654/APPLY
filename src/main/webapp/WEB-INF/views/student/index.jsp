<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/29
  更新
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报提交页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/front.css">
    <link rel="stylesheet" href="/css/dy.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="application/javascript" src="/js/weekstring.weekInfo.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .dy-page-content {
        top: 120px;
        /*background-color: #0f74a8;*/
        width: 100%;
        height: calc(100% - 110px);
    }

    .dy-page-content iframe {
        width: 100%;
        height: 100%;
    }
</style>

<body>
<%--左边导航--%>
<ul class="layui-nav layui-bg-blue" style="margin:0 auto">
    <li class="layui-nav-item"><h2>江湖中的小妖</h2></li>
    <li class="layui-nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    <li class="layui-nav-item layui-this dy-show-disable"><a href="javascript:;" onclick="navTab('/student/reportAdd')">周报提交系统</a>
    </li>
    <li class="layui-nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    <li class="layui-nav-item onespace"><a href="javascript:;" onclick="navTab('/student/oneSpace.do')">个人中心</a></li>
    <li class="layui-nav-item">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</li>
    <li class="layui-nav-item"><a href="javascript:;" onclick="navTab('/student/exerciseCata')">答题系统</a></li>
    <li class="layui-nav-item" style="float: right">
        <a href="javascript:;">学生：${requestScope.info.student.stuName}</a>
        <dl class="layui-nav-child">
            <dd><a href="/student/loginOut">退出登录</a></dd>
        </dl>
    </li>
</ul>
<div class="dy-page-content">
    <iframe src='/student/reportAdd.do' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
</div>
<%--页面页脚--%>
<div class="dy-footer">
    <div class="copyright">
        <a href="http://www.worldyao.cn"><cite>2018 © www.worldyao.cn</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="http://www.miibeian.gov.cn"><cite>鄂ICP备18011582号-1</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42110202000149">
            <img src="/images/sec.png"/>&nbsp;<cite>鄂公网安备 42110202000149号</cite>
        </a>
    </div>
</div>
<script>
    var flag = ${requestScope.info.flag};
    if (flag) {

    } else {
        $(".dy-show-disable").remove();
        $(".onespace").addClass("layui-this");
        $(".dy-page-content iframe").attr("src", "/student/oneSpace.do");
    }
    ;
</script>
<script src="/js/xt-report.js" type="text/javascript"></script>
<script>
    function navTab(SRC) {
        $('.x-iframe').attr("src", SRC);
    }
</script>

<script>
    layui.use(['layer', 'util'], function () {
        $ = layui.jquery;
        var util = layui.util;
        var layer = layui.layer;

        util.fixbar({
            bar1: true,
            css: {
                bottom: '70px',
                right: '40px'
            },
            bgcolor: '#74B9FF',
            click: function (type) {
                if (type === 'bar1') {
                    layer.open({
                        title: '我有好的建议',
                        type: 2,
                        area: ['800px', '500px'],
                        fixed: false, //不固定
                        maxmin: true,
                        content: '/student/suggest',
                        success: function (layero, index) {
                            var body = layer.getChildFrame('body', index);//获取子页面内容
                        }
                    });
                }
            }
        });
    })
</script>
</body>
</html>