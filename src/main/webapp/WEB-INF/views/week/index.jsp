<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/13
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报管理</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/front.css">
    <link rel="stylesheet" href="/css/dy.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo"><a href="./index.jsp">周报管理--组长版</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe668;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">组长：${requestScope.info.student.stuName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd class="dy-show-disable"><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd class="dy-show-disable"><a onclick="x_admin_show('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                <dd><a href="/student/loginOut">退出登录</a></dd>
            </dl>
        </li>
        <%--<li class="dy-show-disable layui-nav-item to-index"><a href="">周报填写系统首页</a></li>--%>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <%--周报管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe63c;</i>
                    <cite>周报管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/student/reportStatus.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>周报提交状态</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/student/groupReportList.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>周报提交列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/student/groupReportAdd.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>提交周报</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="layui-icon" style="color:#74B9FF">&#xe655;</i>
                    <cite>作业提交</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/student/homeWorkUpload.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>思维导图</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/student/groupReportList.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>周报提交列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--组员管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe770;</i>
                    <cite>组员管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/user/userList?stuClass=${requestScope.info.student.stuClass}&stuGroup=${requestScope.info.student.stuGroup}">
                            <i class="iconfont">&#xe623;</i>
                            <cite>密码重置</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--个人中心--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe674;</i>
                    <cite>个人中心</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/page/404">
                            <i class="iconfont">&#xe623;</i>
                            <cite>我的信息</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/page/404">
                            <i class="iconfont">&#xe623;</i>
                            <cite>密码管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>后台首页</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src='/student/reportWelcome' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
        </div>
    </div>
</div>
<div class="page-content-bg"></div>
<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<!-- 底部开始 -->
<div class="dy-footer">
    <div class="copyright">
        <a href="http://www.worldyao.cn"><cite>2018 © www.worldyao.cn</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="http://www.miibeian.gov.cn"><cite>鄂ICP备18011582-1号</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42110202000149">
            <img src="/images/sec.png"/>&nbsp;<cite>鄂公网安备 42110202000149号</cite>
        </a>
    </div>
</div>
<!-- 底部结束 -->
</body>
</html>
