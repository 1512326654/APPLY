<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/8/1
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-cn">
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/front.css">
    <link rel="stylesheet" href="/css/dy.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</head>

<body>
<div class="x-body layui-anim layui-anim-up">
    <textarea name="demo" id="boradContext" style="display: none;">
        <%--占位--%>
    </textarea>
    <div class="layui-form-item">
        <br>
    </div>
    <div class="layui-form-item">
        <a id="borad" class="layui-btn">修改公告</a>
    </div>
</div>
<script type="text/javascript">
    CKEDITOR.replace("demo",{
        height:'60%',
        uiColor:'#EEEEEE',
    });

</script>
<script>
    layui.use(['layer'], function() {
        $ = layui.jquery;
        var layer = layui.layer;
        $("#borad").click(function () {
            $.ajax({
                url:"../AdminBackStageServlet",
                type:"POST",
                data:{
                    operating:"updateReportBorad",
                    boradContext:CKEDITOR.instances.boradContext.getData(),
                },
                success:function () {
                    layer.msg("修改公告板成功", {icon: 6 })
                },
                error:function () {

                }
            })
        })
        $.ajax({
            url:"../AdminBackStageServlet",
            type:"POST",
            data:{
                operating:"showReportBorad",
            },
            success:function (result) {
                CKEDITOR.instances.boradContext.setData(JSON.parse(result))
            },
            error:function () {

            }
        });
    }
    )
</script>
</body>
</html>
