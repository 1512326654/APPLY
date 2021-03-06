<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/8/2
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报提交页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../layui/css/layui.css">
    <link rel="stylesheet" href="../css/xadmin.css">
    <link rel="stylesheet" href="../css/front.css">
    <link rel="stylesheet" href="../css/dy.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../js/xadmin.js"></script>
    <script type="application/javascript" src="../js/weekstring.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .dy-textarea{
        height: 55%;
    }
</style>
<body>
<div class="x-body">
    &nbsp;&nbsp;如果您对该网站有好的建议或者想法亦或是发现的BUG，都可以写下来，作者真心感谢。
    <br><br>
    <div class="layui-form layui-form-pane">
        <%--个人周报--%>
        <div class="layui-form-item layui-form-text">
            <div class="layui-input-block">
                <textarea placeholder="请输入你的建议·······" class="layui-textarea dy-textarea"></textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <a class="layui-btn">传送建议</a>
        </div>
    </div>
</div>
<script>
    var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
    $(".layui-btn").click(function () {
        if ($(".dy-textarea").val().length != 0 ){
            $.ajax({
                url: "/student/addSuggest",
                type: "POST",
                data: {
                    stuClass: ${requestScope.info.student.stuClass},
                    stuName:'${requestScope.info.student.stuName}',
                    suContent:$(".dy-textarea").val(),
                },
                success: function (result) {
                    var data = JSON.parse(result);
                    if (data.indexOf("成功") != -1){
                        layer.msg(data, {icon: 6});
                        setTimeout(function () {
                            parent.layer.close(index);
                        },500);
                    }else {
                        layer.msg(data, {icon: 5});
                    }
                },
                error: function () {
                }
            });
        } else {
            layer.msg("建议为空不能提交！！", {icon: 5});
        }
    })
</script>
</body>
</html>
