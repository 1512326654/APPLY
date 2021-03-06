<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/13
  Time: 23:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改管理员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="css/verify.css">
    <link rel="stylesheet" href="css/dy.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <script type="text/javascript" src="./js/verify.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-body layui-anim layui-anim-up">
    <form class="layui-form">
        <!--原密码-->
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>原密码</label>
            <div class="layui-input-inline">
                <input type="text" lay-verify="o_pass" id="o_pass" class="layui-input dy-input-wd400" placeholder="请输入原密码">
            </div>
            <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
        </div>
        <!--新密码-->
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>新密码</label>
            <div class="layui-input-inline">
                <input type="text" lay-verify="n_pass" id="n_pass" class="layui-input dy-input-wd400" placeholder="请输入新密码">
            </div>
            <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
        </div>
        <!--确认密码-->
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="x-red">*</span>确认密码</label>
            <div class="layui-input-inline">
                <input type="text" lay-verify="n_repass" id="n_repass" class="layui-input dy-input-wd400" placeholder="请再次输入新密码">
            </div>
            <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
        </div>
        <%--验证码--%>
        <div class="layui-form-item">
            <label class="layui-form-label">
                <span class="x-red">*</span>验证
            </label>
            <div class="layui-input-inline" id="captcha">

            </div>
            <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
        </div>
        <!--按钮-->
        <div class="layui-form-item">
            <label class="layui-form-label"><!--占位--></label>
            <button id="editbtn" disabled="disabled" class="layui-btn layui-btn-disabled" lay-filter="add" lay-submit="">点击修改</button>
        </div>
    </form>
</div>
<script type="text/javascript">
    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form,layer = layui.layer;
        //自定义验证规则
        form.verify({
            // 姓名验证
            o_pass: function(value){
                if (value == ""){
                    return "原密码不得为空";
                }
            },
            n_pass: function(value){
                if (value == ""){
                    return "新密码不得为空";
                }
            },
            n_repass: function(value){
                if (value == ""){
                    return "确认不得为空";
                }
            },
        });

        // 图片验证码
        $('#captcha').pointsVerify({
            defaultNum : 6,	//默认的文字数量
            checkNum : 2,	//校对的文字数量
            vSpace : 5,	//间隔
            imgName : ['1.jpg', '2.jpg'],
            imgSize : {
                // 图片大小
                width: '400px',
                height: '150px',
            },
            barSize : {
                width : '400px',
                height : '40px',
            },
            ready : function() {
            },
            success : function() {
                // 验证成功
                $("#editbtn").removeClass("layui-btn-disabled");
                $("#editbtn").attr("disabled",false);
            },
            error : function() {
            }
        });

        //监听提交
        form.on('submit(add)', function(data){
            if ($("#n_pass").val() == $("#n_repass").val()){
                layer.msg("验证通过", {icon: 6},function () {
                    //此处异步请求
                    $.ajax({
                        data:{
                        }
                    })
                });
            }else {
                layer.msg("两次密码比一至", {
                    icon: 5 ,
                },function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
            }
        })
    });
</script>
</body>
</html>
