<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/21
  Time: 0:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报上传下载</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="layui-anim layui-anim-up">
<!--面包屑导航开始-->
<div class="x-nav">
  <span class="layui-breadcrumb">
    <a href="">首页</a>
    <a href="">周报系统</a>
    <a><cite>Excel周报下载</cite></a>
  </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe666;</i></a>
</div>
<!--面包屑导航结束-->
<!--内容主体开始-->
<div class="x-body">


    <blockquote class="layui-elem-quote">
        <fieldset class="layui-elem-field">
            <legend>编号设置</legend>
            <div class="layui-field-box">
                <div class="layui-form-item">
                    <%--一班--%>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
                        <label class="layui-form-label"></label>
                        <label class="layui-col-xs8 layui-col-sm8 layui-col-md8" style="color: red ; font-size: 18px">
                            <i class="iconfont">&#xe60b;</i>注意:编号格式为"1,2,3,4,5,6,7,8,9",中间由逗号隔开
                        </label>
                    </div>
                </div>
                <div class="layui-form-item">
                    <%--一班--%>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
                        <label class="layui-form-label">一班</label>
                        <div class="layui-col-xs8 layui-col-sm8 layui-col-md5">
                            <input type="text" class="layui-input classOne">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <%--二班--%>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
                        <label class="layui-form-label">二班</label>
                        <div class="layui-col-xs8 layui-col-sm8 layui-col-md5">
                            <input type="text" class="layui-input classTwo">
                        </div>
                    </div>
                </div>
                <div class="layui-form-item">
                    <%--修改按钮--%>
                    <div class="layui-col-xs12 layui-col-sm12 layui-col-md8">
                        <label class="layui-form-label"></label>
                        <a class="layui-btn" href="javascript:;" onclick="setLeaderSheetNum()">
                            <i class="iconfont">&#xe642;</i>点击修改
                        </a>
                    </div>
                </div>
            </div>
        </fieldset>
    </blockquote>


    <!--工具栏开始-->
    <blockquote class="layui-elem-quote">
        <!--条件工具条开始-->
        <div class="layui-row">
            <div class="layui-form layui-col-md12 x-so">
                <!--班级-->
                <a id="toExcel" class="layui-btn">
                    <i class="iconfont">&#xe656;</i>&nbsp;&nbsp;数据库到Excel文件&nbsp;&nbsp;<i class="iconfont">&#xe60a;</i>
                </a>
            </div>
        </div>
        <!--条件工具条结束-->
        <a class="layui-btn layui-btn-warm" href="/admin/Download?stuClass=${param.classNum}"><i class="iconfont">&#xe601;</i>&nbsp;&nbsp;下载Excel文件</a>
    </blockquote>
    <!--工具栏结束-->
</div>
<!--内容主体结束-->
</body>
<script>
    layui.use(['layer'], function () {
        $ = layui.jquery;
        var layer = layui.layer;
        var indexConfirm;
        var indexLoading;

        getLeaderSheetNum();

        $("#toExcel").click(function () {
            indexConfirm = layer.confirm('<font color="red">转换须知<br>这一步是最终操作，操作后，周报内容将无法修改！！<br>转换需要一定的时间。</font>', {
                title: ['操作确认', 'color:red;'],
                btn: ['取消', '确认'],//按钮
                btn1: function (index, layero) {
                    layer.close(indexConfirm);
                },
                btn2: function (index, layero) {
                    $.ajax({
                        url: "/admin/writeToExcel",
                        type: "post",
                        data: {
                            stuClass:${param.classNum}
                        },
                        // dataType: 'json',
                        beforeSend: function () {       //ajax发送请求时的操作，得到请求结果前有效
                            indexLoading = layer.msg('加载中', {icon: 16, shade: 0.5, time: 1000 * 60 * 5});
                        },
                        complete: function () {            //ajax得到请求结果后的操作
                        },
                        success: function (msg) {
                            var data = JSON.parse(msg);
                            layer.close(indexLoading);
                            layer.msg('转换结束', {icon: 6});
                        }
                    });
                }
            });
        });
    })

    // 获取编号设置
    function getLeaderSheetNum() {
        $.ajax({
            url: "/admin/getLeaderSheetNum",
            type: "post",
            success: function (result) {
                var data = JSON.parse(result);
                $(".classOne").val(data.classOne);
                $(".classTwo").val(data.classTwo);
            }
        });
    };

    // 修改编号
    function setLeaderSheetNum() {
        $.ajax({
            url: "/admin/setLeaderSheetNum",
            type: "post",
            contentType: 'application/json;charset=UTF-8',
            // dataType:"json",
            data: JSON.stringify({
                classOne:$(".classOne").val(),
                classTwo:$(".classTwo").val()
            }),
            success: function (result) {
                var data = JSON.parse(result);
                layer.msg(data.msg, {icon: (5 + data.code)});
            }
        });
    }
</script>
</html>