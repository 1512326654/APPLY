<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/dy.css">
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
    <div class="x-body layui-anim layui-anim-up">
        <div class="layui-form">
            <%--班级--%>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>班级</label>
                <div class="layui-input-inline">
                    <select id="classSelect">
                        <option value="">请选择发布班级</option>
                        <option value="1">一班</option>
                        <option value="2">二班</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux"><!--占位--></div>
            </div>
            <%--班级--%>
            <div class="layui-form-item">
                <label class="layui-form-label"><span class="x-red">*</span>班级</label>
                <div class="layui-input-inline">
                    <select id="catalogSelect">
                        <option value="">请选择发布类型</option>
                        <option value="1">思维导图</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux"><!--占位--></div>
            </div>
            <%--姓名--%>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>作业名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" lay-verify="homeworkName" id="homeworkName" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>确保本序号在班级唯一，而且对应Excel表格顺序一致
                </div>
            </div>
            <%--姓名--%>
            <div class="layui-form-item">
                <label class="layui-form-label">
                    <span class="x-red">*</span>工作表序号
                </label>
                <div class="layui-input-inline">
                    <input type="text" lay-verify="sheetNumber" id="sheetNumber" class="layui-input" value="${param.stuSheet}">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>确保本序号在班级唯一，而且对应Excel表格顺序一致
                </div>
            </div>
            <%--按钮--%>
            <div class="layui-form-item">
                <label class="layui-form-label"><!--占位--></label>
                <button class="layui-btn" lay-filter="add" lay-submit="">点击修改</button>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function () {
            // 设置默认
            $("#classSelect").val("${param.stuClass}");
            $("#groupSelect").val("${param.stuGroup}");
            $("#leaderSelect").val("${param.stuLeader}");
        });

        layui.use(['form','layer'], function(){
            $ = layui.jquery;
            var form = layui.form,layer = layui.layer;
            //自定义验证规则
            form.verify({
                // 姓名验证
                sheetNumber: function(value){
                    if (value == ""){
                        return "工作表序号不得为空";
                    } ;
                }
            });
            //监听提交
            form.on('submit(add)', function(data){
                var s_name = $("#stuId").val();
                var s_class = $("#groupSelect option:selected").val();
                var s_group = $("#leaderSelect option:selected").val();
                alert(s_name);
                alert(s_class);
                alert(s_group);
                //此处异步请求
                $.ajax({
                    data:{

                    }
                })
                layer.msg("添加成功", {
                    icon: 6 ,

                },function () {
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                //设置姓名框为空
                $("#s_name").val("");
                //设置班级选中默认
                // $("#s_class").find(option[value=""]).attr("selected", true);
                //设置分组选中默认
                // $("#s_group").find(option[value='']).attr("selected", true);
                return false;
            });
        });
    </script>
</body>
</html>