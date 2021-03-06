<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/13
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <link rel="stylesheet" href="css/front.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">系统设置</a>
        <a><cite>前台参数设置</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <blockquote class="layui-elem-quote">每个tr 上有两个属性 cate-id='1' 当前分类id fid='0' 父级id ,顶级分类为 0，有子分类的前面加收缩图标<i class="layui-icon x-show" status='true'>&#xe623;</i></blockquote>
    <table class="layui-table layui-form">
        <%--表头--%>
        <thead>
        <tr>
            <th width="20%">参数名称</th>
            <th>参数值</th>
            <th width="20%">参数说明</th>
        </thead>
        <%--表格--%>
        <tbody class="x-cate">
        <tr cate-id='1' fid='0' >
            <td>页面标题</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>pageTitle</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td>主标题</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>mainTitle</td>
        </tr>

        <tr cate-id='1' fid='0' >
            <td>副标题</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>产品管理</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td>公告板</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>notice</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td>版权信息</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>copyRight</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td>ICP/IP备案信息</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>icpipRecord</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td>公安网备案信息</td>
            <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>
            <td>policeRecord</td>
        </tr>
        <tr cate-id='1' fid='0' >
            <td colspan="3" align="center"><a class="layui-btn">—修改信息—</a></td>
        </tr>
        </tbody>
    </table>
</div>
<script type="text/javascript">
    $(function () {
        $(".layui-btn").click(function () {
            layer.open({
                type: 1
                ,title: false //不显示标题栏
                ,closeBtn: false
                ,area: ['50%','205px']
                ,shade: 0.8
                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,btn: ['—确定—', '—取消—']
                ,btnAlign: 'c'
                ,moveType: 1 //拖拽模式，0或者1
                ,content: '<div class="dy-layer-style"><h3>您的修改将直接影响到首页的显示,确认继续？</h3><br></div>'
                ,success: function(layero){
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').click(function () {
                        alert("你好")
                    });
                }
            });
        });
    })

</script>

</body>

</html>
