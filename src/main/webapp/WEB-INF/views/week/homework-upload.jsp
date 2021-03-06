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
    <a href="">作业提交</a>
    <a><cite>思维导图提交</cite></a>
  </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe666;</i></a>
</div>

<!--导航结束-->
<div class="x-body">
    <blockquote class="layui-elem-quote">
        注意：<br>
        上传的格式必须为zip或者rar压缩文件，并且文件不得超过2MB
    </blockquote>
    <div class="layui-upload-drag" id="uploadFile">
        <i class="layui-icon"></i>
        <p>点击上传，或将文件拖拽到此处</p>
    </div>
</div>
<!--操作工具体结束-->
<script>
    $.ajax({
        url:"/student/isSubmit.do",
        type: "GET",
        data:{
            classNum:${param.stuClass},
            groupNum:${param.stuGroup}
        },
        success: function (result) {
            var dataObj2 = JSON.parse(result);
            if (dataObj2 != false){

                $(".layui-upload-drag").removeAttr("id");
                $(".layui-upload-drag").html(dataObj2);
            }

        },
        error: function (res) {
        }
    })
</script>
<script type="text/javascript">
    layui.use(['upload','layer'], function(){
        var $ = layui.jquery;
        var upload = layui.upload;
        var layer = layui.layer;
        //拖拽上传
        upload.render({
            elem: '#uploadFile',
            url: '/student/upload.do',
            method:'POST',
            accept:'file',
            size:'2048',
            exts:'zip|rar',
            //obj参数包含的信息，
            before: function(obj){
                layer.load(1, {
                    title: '上传中',
                });
            },
            done: function(res, index, upload){
                // alert(JSON.parse(res));
                if(res.code == 0){
                    if (res.msg.indexOf("成功") != -1){
                        layer.msg(res.msg,{icon:6});
                        setTimeout(function () {
                            location.reload();
                        },2000)
                    } else {
                        layer.msg(res.msg,{icon:5});
                    }
                    //关闭loading
                    layer.closeAll('loading');
                }
            },
            error: function(index, upload){
                //关闭loading
                layer.closeAll('loading');
            }
        });
    })
</script>
</body>
</html>