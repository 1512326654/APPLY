<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/13
  Time: 18:30
  To change this template use File | Settings | File Templates.
  更新成功，2018-07-28
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>蓝桥-学委平台</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
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
    <div class="logo"><a href="./index.jsp">江湖中的小妖 v1.8</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe668;</i>
    </div>
    <ul class="dy-show-disable layui-nav left fast-add" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">+新增</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a onclick="x_admin_show('资讯','http://www.baidu.com')"><i class="iconfont">&#xe6a2;</i>资讯</a></dd>
                <dd><a onclick="x_admin_show('图片','http://www.baidu.com')"><i class="iconfont">&#xe6a8;</i>图片</a></dd>
                <dd><a onclick="x_admin_show('用户','http://www.baidu.com')"><i class="iconfont">&#xe6b8;</i>用户</a></dd>
            </dl>
        </li>
    </ul>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${admin.adName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
                <dd><a class="dy-show-disable" onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd><a class="dy-show-disable" onclick="x_admin_show('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                <dd><a href="/page/admin">退出</a></dd>
            </dl>
        </li>
        <%--<li class="layui-nav-item to-index"><a href="/">前台首页</a></li>--%>
    </ul>

</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <%--学生管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe770;</i>
                    <cite>学生管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/admin/studentList.do?classNum=${admin.adRole}">
                            <i class="iconfont">&#xe623;</i>
                            <cite>学生列表</cite>

                        </a>
                    </li >
                    <li>
                        <a _href="student-add.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>添加学生</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="../page/404.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>学生删除</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="/admin/constautsList">
                            <i class="iconfont">&#xe623;</i>
                            <cite>关联状态</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/admin/userList.do?classNum=${admin.adRole}">
                            <i class="iconfont">&#xe623;</i>
                            <cite>关联管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--报名管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe6b2;</i>
                    <cite>报名管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="apply-list.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>报名列表</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--周报管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe655;</i>
                    <cite>周报管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/admin/reportList.do?classNum=${admin.adRole}">
                            <i class="iconfont">&#xe623;</i>
                            <cite>周报列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="/admin/reportDownload.do?classNum=${admin.adRole}">
                            <i class="iconfont">&#xe623;</i>
                            <cite>上传下载</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--公告管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe642;</i>
                    <cite>作业管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/admin/homeworkList.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>发布作业</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="../404.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>收取作业</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--公告管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe66e;</i>
                    <cite>公告管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/admin/reportBorad.do">
                            <i class="iconfont">&#xe623;</i>
                            <cite>周报首页公告</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="../404.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>报名首页公告</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--保留--%>
            <li style="display: none">
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>城市联动</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="city.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>三级地区联动</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--管理员管理--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe613;</i>
                    <cite>管理员管理</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="admin-list.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>管理员列表</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-add.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>添加管理员</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="../404.html">
                            <i class="iconfont">&#xe623;</i>
                            <cite>角色管理</cite>
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
                        <a _href="admin-list.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>我的信息</cite>
                        </a>
                    </li >
                    <li>
                        <a _href="admin-pass.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>密码管理</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <%--系统设置--%>
            <li>
                <a href="javascript:;">
                    <i class="iconfont" style="color:#74B9FF">&#xe716;</i>
                    <cite>系统设置</cite>
                    <i class="iconfont nav_right">&#xe61a;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="frontsys.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>前台参数设置</cite>
                        </a>
                    </li>
                    <li>
                        <a _href="adminsys.jsp">
                            <i class="iconfont">&#xe623;</i>
                            <cite>后台参数设置</cite>
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
                <iframe src='/admin/welcome.do?adminName=${admin.adName}&classNum=${admin.adRole}' frameborder="0" scrolling="yes" class="x-iframe"></iframe>
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