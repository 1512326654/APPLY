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
    <title>用户注册页面</title>
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
    <link rel="stylesheet" href="/css/verify.css">
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script type="application/javascript" src="/js/weekstring.weekInfo.js"></script>
    <script type="text/javascript" src="/js/verify.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<style>
    .dy-page-content {
        top: 120px;
        /*background-color: #0f74a8;*/
        width: 100%;
        height: calc(100% - 110px);
    }

    .dy-page-content iframe {
        width: 100%;
        height: 100%;
    }
</style>
<body>
<%--左边导航--%>
<ul class="layui-nav layui-bg-blue" style="margin:0 auto;align-content: center">
    <li class="layui-nav-item">用户注册</li>
</ul>
<div class="dy-page-content">
    <div class="dy-context">
        <div class="dy-content-center" style="padding-top: 40px">
            <div class="layui-card" style="padding:20px">
                <fieldset class="layui-elem-field">
                    <legend>用户注册</legend>
                    <div class="layui-field-box" style="text-align: center ; padding: auto 10%; margin: auto 15%"
                         align="center">
                        <div class="layui-tab tab layui-row layui-col-space15" style="text-align: center"
                             align="center">
                            <form class="layui-form">
                                <!--用户名-->
                                <div class="layui-form-item">
                                    <label class="layui-form-label"><span class="x-red">*</span>用户名</label>
                                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
                                        <input type="text" lay-verify="username" id="username"
                                               class="layui-input" placeholder="请输入用户名">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
                                </div>
                                <!--新密码-->
                                <div class="layui-form-item">
                                    <label class="layui-form-label"><span class="x-red">*</span>密码</label>
                                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
                                        <input type="password" lay-verify="n_pass" id="n_pass"
                                               class="layui-input" placeholder="密码长度为3~12位">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux"></div>
                                </div>
                                <!--确认密码-->
                                <div class="layui-form-item">
                                    <label class="layui-form-label"><span class="x-red">*</span>确认密码</label>
                                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
                                        <input type="password" lay-verify="n_repass" id="n_repass"
                                               class="layui-input" placeholder="请再次输入密码">
                                    </div>
                                    <div class="layui-form-mid layui-word-aux"><!-- 占位 --></div>
                                </div>
                                <%--验证码--%>
                                <div class="layui-form-item">
                                    <label class="layui-form-label">
                                        <span class="x-red">*</span>验证码
                                    </label>
                                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8" id="captcha">
                                        <%--验证码占位--%>
                                    </div>
                                </div>
                                <!--按钮-->
                                <div class="layui-form-item" style="text-align: center">
                                    <label class="layui-form-label"></label>
                                    <div class="layui-col-xs4 layui-col-sm7 layui-col-md8">
                                        <a id="editbtn" class="layui-btn layui-btn-normal" lay-filter="add" lay-submit=""
                                           style="margin: auto;width: 20%">注&nbsp;&nbsp;&nbsp;&nbsp;册
                                        </a>
                                        <a class="layui-btn layui-btn-normal" style="margin-left: 15%;width: 20%"
                                           a href="/page/login.do">
                                            返回登录
                                        </a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </fieldset>
            </div>
        </div>
    </div>
</div>
</div>
<%--页面页脚--%>
<div class="dy-footer">
    <div class="copyright">
        <a href="http://www.worldyao.cn"><cite>2018 © www.worldyao.cn</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a href="http://www.miibeian.gov.cn"><cite>鄂ICP备18011582-1号</cite></a>&nbsp;&nbsp;|&nbsp;&nbsp;
        <a target="_blank" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=42110202000149">
            <img src="/images/sec.png"/>&nbsp;<cite>鄂公网安备 42110202000149号</cite>
        </a>
    </div>
</div>
<script src="/js/xt-report.js" type="text/javascript"></script>
<script>
    function navTab(SRC) {
        $('.x-iframe').attr("src", SRC);
    }
</script>
<script>
    layui.use(['layer', 'form'], function () {
        $ = layui.jquery;
        var layer = layui.layer;
        var form = layui.form;

        //自定义验证规则
        form.verify({
            username: function (value) {
                if (value == "") {
                    return "注册用户名不得为空";
                }
                ;
                if (value.length > 12 || value.length < 3) {
                    return "用户名过长或者过短";
                }
                ;
            },
            n_pass: function (value) {
                if (value == "") {
                    return "密码不得为空";
                }
                if (value.length > 12 || value.length < 3) {
                    return "密码过长或者过短";
                }
                ;
            },
            n_repass: function (value) {
                if (value == "") {
                    return "确认密码不得为空";
                }
            },
        });

        $('#captcha').codeVerify({
            type: 2,
            figure: 100,	//位数，仅在type=2时生效
            arith: 0,	//算法，支持加减乘，不填为随机，仅在type=2时生效
            width: '180px',
            height: '37px',
            fontSize: '22px',
            btnId: 'editbtn',
            ready: function () {
            },
            success: function () {
                form.on('submit(add)', function (data) {
                    if ($("#n_pass").val() == $("#n_repass").val()) {
                        //此处异步请求
                        $.ajax({
                            url: '/user/userRegist.do',
                            type: 'POST',
                            data: {
                                userName: $("#username").val(),
                                userPass: $("#n_repass").val()
                            },
                            success: function (result) {
                                var data = JSON.parse(result);
                                if (data.indexOf("成功") != -1){
                                    layer.msg(data + "，3秒后自动跳转登录界面", {
                                        icon: 5,
                                        time: 1000,
                                    });
                                    setTimeout(function () {
                                        window.location.href = "/page/login"
                                    },3000)
                                }
                            }
                        })
                    } else {
                        layer.msg("两次密码不一致", {
                            icon: 5,
                        }, function () {
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                        });
                        return false;
                    }
                })
            },
            error: function () {
                layer.msg("验证码验证不通过！！！", {
                    icon: 5,
                    time: 1000,
                })
            }
        });
    })
</script>
</body>
</html>