<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/19
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报提交状态</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!--导航开始-->
<div class="x-nav">
  <span class="layui-breadcrumb">
    <a href="">首页</a>
    <a href="">周报管理</a>
    <a><cite>周报提交状态</cite></a>
  </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe666;</i></a>
</div>
<!--导航结束-->
<div class="x-body">
    <blockquote class="layui-elem-quote">
        这里显示的是已经提交周报的组员信息
    </blockquote>
    <!--表格开始-->
    <table class="layui-table" lay-filter="demo" id="test"></table>
    <!--表格结束-->
</div>
<!--操作工具体结束-->
<script type="application/javascript">

    layui.use('table', function() {
        var table = layui.table;
        table.render({
            elem: '#test',
            url: '/student/showMemberGroupReportStatus.do?stuClass=${requestScope.info.student.stuClass}&stuGroup=${requestScope.info.student.stuGroup}&index=false',
            method:'POST',
            cols: [[
                {field: 'stuName', title: '姓名', unresize:true},
                {field: 'status',title: '周报提交状态', unresize:true},
            ]],
            //是否分页
            // page: true,
            id: 'idTest',
        });
    })
</script>
</body>
</html>