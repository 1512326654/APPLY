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
    <title>提交列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
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
    <a href="">组员管理</a>
    <a><cite>重置密码</cite></a>
  </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe666;</i></a>
</div>
<!--导航结束-->
<div class="x-body">
    <!--表格开始-->
    <table class="layui-table" lay-filter="demo" id="test"></table>
    <!--表格结束-->
</div>
<!--操作工具条开始-->
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="reset">重置密码</a>
</script>
<!--操作工具体结束-->
<script type="application/javascript">
    layui.use('table', function () {
        var table = layui.table;
        table.render({
            elem: '#test',
            url: '/user/showStudentInfo?stuClass=${param.stuClass}&stuGroup=${param.stuGroup}',
            method: 'GET',
            cols: [[
                // {field: 'userId', width: 100, title: '姓名', unresize:true},
                {field: 'userName', title: '用户名', unresize: true},
                {field: 'stuName', title: '关联学生姓名', sort: true, unresize: true},
                {field: 'stuClass', title: '关联班级', sort: true, unresize: true},
                {field: 'stuGroup', title: '关联组别', sort: true, unresize: true},
                {field: 'stuSheet', title: '关联编号', sort: true, unresize: true},
                {fixed: 'right', width: '16%', unresize: true, title: '操作', align: 'center', toolbar: '#barDemo'}
            ]],
            //是否分页
            // page: true,
            id: 'idTest'
        });
        //监听工具条
        table.on('tool(demo)', function (obj) {
            var data = obj.data;
            if (obj.event === 'reset') {
                var index = layer.confirm('您确定要重置<font style="font-size:18px ;color: red">' + data.stuName + '</font>的密码？', {
                        btn: ['确定', '取消'],
                        title: '操作确认'
                    }, function () {
                        $.ajax({
                            url: "/user/alterPass",
                            type: "POST",
                            data: {
                                userId: data.userId
                            },
                            success: function (result) {
                                var dataObj2 = JSON.parse(result);
                                if (dataObj2 == 1) {
                                    layer.msg("操作成功", {icon: 6});
                                    setTimeout(function () {
                                        layer.close(index);
                                    }, 700);
                                } else {
                                    layer.msg("操作失败", {icon: 5});
                                    setTimeout(function () {
                                        layer.close(index);
                                    }, 700);
                                }
                            },
                            error: function (res) {
                                layer.msg("操作异常", {icon: 5});
                                setTimeout(function () {
                                    layer.close(index);
                                }, 700);
                            }
                        })
                    });

            }
        });
    })
</script>
</body>
</html>
