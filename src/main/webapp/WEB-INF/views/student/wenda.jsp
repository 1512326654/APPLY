<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/29
  更新
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>周报提交页面</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/front.css">
    <link rel="stylesheet" href="/css/dy.css">
    <link rel="stylesheet" type="text/css" href="/css/verify.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="text/javascript" src="/js/verify.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .dy-textarea {
        height: 400px;
    }

    .dy-page-content {
        top: 120px;
        width: 100%;
        height: calc(100% - 110px);
    }

    .dy-page-content iframe {
        background-color: #00F7DE;
        width: 100%;
        height: 100%;
    }

    .dy-exercise {
        padding-left: 40px;
        background: #74B8FF;
    }

</style>
<body>
<div class="x-body">
    <div style="padding: 20px; background-color: #F2F2F2;">
        <div>
            <label style="font-size: 18px">当前试题：${param.exTitle}</label>
            <div class="layui-btn-group" style="float: right">
                <a class="layui-btn layui-btn-primary layui-btn-lg" href="/student/exerciseCata">
                    <i class="layui-icon">&#xe65c;</i>
                </a>
                <a class="layui-btn layui-btn-primary layui-btn-lg" href="javascript:location.replace(location.href);">
                    <i class="layui-icon">&#xe666;</i>
                </a>
            </div>
            <hr class="layui-bg-blue">
        </div>
        <div class="dy-context" style="height: auto">
            <%--            <blockquote class="layui-elem-quote" style="background-color: white ; font-size: 18px">
                            在数据库设计中，在概念设计阶段可用E-R方法，其设计出来的图称为________。
                        </blockquote>
                        <fieldset class="layui-elem-field">
                            <div class="layui-form layui-input-block">
                                <p><input name="sex" type="radio" value="A" title="A.ALTER"></p>
                                <p><input name="sex" type="radio" value="B" title="B.CREATE"></p>
                                <p><input name="sex" type="radio" value="C" title="C.UPDATE"></p>
                                <p><input name="sex" type="radio" value="D" title="D.INSERT"></p>
                            </div>
                        </fieldset>
                        <blockquote class="layui-elem-quote" style="background-color: white ; font-size: 18px">
                            在数据库设计中，在概念设计阶段可用E-R方法，其设计出来的图称为________。
                        </blockquote>
                        <fieldset class="layui-elem-field">
                            <div class="layui-form layui-input-block">
                                <p><input name="sex1" type="radio" value="A" title="A.ALTER"></p>
                                <p><input name="sex1" type="radio" value="B" title="B.CREATE"></p>
                                <p><input name="sex1" type="radio" value="C" title="C.UPDATE"></p>
                                <p><input name="sex1" type="radio" value="D" title="D.INSERT"></p>
                            </div>
                        </fieldset>--%>
        </div>
    </div>
</div>
<script>
    layui.use('form', function () {
        var form = layui.form;
        //各种基于事件的操作，下面会有进一步介绍
    });

    function applyAnswer() {
        var select = [];
        $("input:radio:checked").each(function (index, item) {
            var map = {exId: item.name, exAn: item.value};
            select.push(map);
        })
        console.log(JSON.stringify(select));

        $.ajax({
            url: "/student/getResultAnswer",
            type: "POST",
            datatype: "json",
            contentType: "application/json; charset=utf-8",
            data: {
                resultAnswer: JSON.stringify(select)
            },
            success: function (result) {

            },
            error: function (re) {
                alert(re)
            }
        })

    }

</script>
<script>
    $.ajax({
        url: "/student/showExercise",
        type: "POST",
        data: {
            extypeId:${param.extypeId},
            exCataId:${param.exCataId},
            pageNum:${param.pageNum}
        },
        success: function (result) {
            var data = JSON.parse(result);
            $.each(data, function (index, name) {
                $(".dy-context").append("" +
                    "<blockquote class='layui-elem-quote' style='background-color: white ; font-size: 18px'>"
                    + (index + 1) + "、" + name.exContent +
                    "</blockquote>");
                $(".dy-context").append("<fieldset class='layui-elem-field'><div class='layui-form layui-input-block EX" + name.exId + "'>");
                $(".dy-context").append(
                    "<div class='layui-form-item layui-form-text'>" +
                    "<label class='layui-form-label'>文本域</label>" +
                    "<div class='layui-input-block'>" +
                    "<textarea name='desc' placeholder='请输入内容' class='layui-textarea'></textarea>" +
                    "</div>" +
                    "</div>"
                )
                ;


            })
            $(".dy-context").append("<div align='center'>" +
                "<a href='javascript:;' onclick='applyAnswer()' class='layui-btn' style='align-content: center'>提交答案</a>" +
                "</div>")
        },
        error: function (re) {
            alert(re)
        }
    })

</script>
</body>
</html>