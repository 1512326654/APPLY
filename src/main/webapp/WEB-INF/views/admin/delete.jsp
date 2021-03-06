<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/10
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>je-table</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="wcodeth=device-wcodeth, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/jeui.css" media="all">
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/layer/layer.js"></script>
    <style>
        .dydiv{
            /*border: 1px solid red;*/
            margin: 20px 30px;
        }
        .dydiv label{
            /*border: 1px solid red;*/
            margin-top: 50px;
            padding-top:30px;
        }
    </style>
</head>
<body>
<div class="je-p20">
    <blockquote class="je-quote je-f16">
        <fieldset class="je-field je-field-title">
            <legend class="je-f22 je-red">删除信息</legend>
        </fieldset>
        <fieldset class="je-field je--p10" style="margin-top: 20px;">

            <legend class="je-f18 je-red">请确认信息</legend>
            <div class="dydiv">
                <label class="je-f16 je-blue text">姓名：${param.s_name}</label><br><br>
                <label class="je-f16 je-blue text">班级：${param.s_class}</label><br><br>
                <label class="je-f16 je-blue text">组别：${param.s_group}</label><br>
            </div>
        </fieldset>
        <a class="je-btn je-bg-red" id="delete">删 除</a>
    </blockquote>
</div>
<script type="text/javascript">
    $("#delete").click(function () {
        layer.open({
            type: 1 ,
            title: false, //不显示标题栏
            closeBtn: false,
            area: '50%;',
            shade: 0.8,
            id: 'LAY_layuipro' ,//设定一个id，防止重复弹出
            btn: ['确认删除', '点错啦，不删除'],
            btnAlign: 'c',
            moveType: 1, //拖拽模式，0或者1
            content: '<div style="padding: 50px; line-height: 22px; background-color: #429742; color: #fff; font-weight: 300; text-align: center;"><label class="je-f20">该操作后数据将无法恢复</label></div>',
            success: function(layero){
                var btn = layero.find('.layui-layer-btn');
                btn.find('.layui-layer-btn0').click(function () {
                    $.ajax({
                        url:"../AdminServlet",
                        type: "post",
                        data:{
                        operating:"deleteinfo",
                        s_name:"${param.s_name}"
                        },
                        success: function (result) {
                        var dataObj2 = JSON.parse(result);
                            layer.msg(dataObj2, {icon: 6});
                            setTimeout(function () {
                                //返回到上个页面，并进行刷新
                                self.location = document.referrer;
                            }, 3000);
                        },
                        error: function (res) {
                            layer.msg('删除失败！原因可能是${param.s_name}已经报过名！', {icon: 5});
                            setTimeout(function () {
                                //返回到上个页面，并进行刷新
                                self.location = document.referrer;
                            }, 3000);
                        }
                    });
                });
            }
        })
    })



</script>

</body>
</html>
