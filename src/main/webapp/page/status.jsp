<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/6/29
  Time: 17:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>报名结果</title>
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">报名系统</a></div>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h2 class="text-center">黄冈师范学院蓝桥一班</h2><br>
            <h3 class="text-center">每日一讲主持人报名</h3>
        </div>
    </div>
</div>
<hr>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">
            <h3 class="text-left">系统检查到您的信息如下：</h3><br>
            <div class="well">
                <h4 class="text-left">姓名：${data[0].a_name}</h4><br>
                <h4 class="text-left">班级：蓝桥${data[0].s_class}班</h4><br>
                <h4 class="text-left">组别：${data[0].s_group}组</h4><br>
            </div>
            <h3 class="text-left">您的报名结果如下：</h3><br>
            <div class="well">
                <h4 class="text-left">${data[1]}</h4>
                <h4 class="text-left">您的报名编号：${data[0].a_id}</h4>
                <h4 class="text-left">您的报名时间：${data[0].a_time}&nbsp;${data[0].a_week}</h4>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">&nbsp;</div>
        <div class="col-md-6">&nbsp;</div>
    </div>
    <div class="row">
    </div>
</div>
<hr>
<div class="row text-center">
    <div class="row">
        <div class="text-center col-md-6 col-md-offset-3">
            <h4></h4>
            <p>Copyright &copy; 2018 &middot; 董尧 &middot; <a href="http://www.miibeian.gov.cn">鄂ICP备18011582号</a></p>
        </div>
        <div style="width:300px;margin:0 auto; padding:20px 0;">
            <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42110202000149" style="display:inline-block;text-decoration:none;height:20px;line-height:20px;"><img src="pic/sec.png" style="float:left;"/><p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px; color:#939393;">鄂公网安备 42110202000149号</p></a>
        </div>
    </div>
    <hr>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.3.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.js"></script>
</body>
</html>