<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/8/10
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>返回信息确认</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/dy.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <form class="layui-form">
        <!--姓名-->
        <div class="layui-form-item">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input id="stuName" disabled class="layui-input dy-input-disable"/>
            </div>
        </div>
        <!--性别-->
        <div class="layui-form-item">
            <label class="layui-form-label">班级</label>
            <div class="layui-input-inline">
                <input id="stuClass"  disabled class="layui-input dy-input-disable"/>
            </div>
        </div>
        <!--班级-->
        <div class="layui-form-item">
            <label class="layui-form-label">分组</label>
            <div class="layui-input-inline">
                <input id="stuGroup"  disabled class="layui-input dy-input-disable"/>
            </div>
        </div>
        <!--按钮-->
        <div class="layui-form-item">
            <label class="layui-form-label"><!--占位--></label>
            <a id="addbtn" class="layui-btn">确认关联</a>
        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    layui.use(['layer'], function () {
        var layer = layui.layer;
        $("#addbtn").click(function () {
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            $.ajax({
                url: "/student/connectionInfo.do",
                type: "POST",
                data: {
                    stuId: ${param.stuId},
                    userId: ${requestScope.info.userId},
                },
                success: function (result) {
                    var data = JSON.parse(result);
                    layer.msg(data, {icon: 6, time:500});
                    // window.opener.location.href=window.opener.location.href;
                    // parent.location.reload();
                    // window.opener.location.reload();
                    // self.opener.location.reload();
                    setTimeout(function () {
                        parent.layer.close(index);
                        window.parent.reset();
                    },600)
                },
                error: function (res) {
                    layer.msg("数据获取失败", {icon: 5})
                }
            })
        })
    });
</script>
</html>
