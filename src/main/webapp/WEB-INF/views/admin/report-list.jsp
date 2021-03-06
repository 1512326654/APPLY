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
    <title>周报列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/layui/css/layui.css">
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
<!--导航开始-->
<div class="x-nav">
  <span class="layui-breadcrumb">
    <a href="">首页</a>
    <a href="">周报系统</a>
    <a><cite>周报列表</cite></a>
  </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="iconfont" style="line-height:30px">&#xe666;</i></a>
</div>
<!--导航结束-->
<div class="x-body">
    <!--工具栏开始-->
    <blockquote class="layui-elem-quote">
        <!--条件工具条开始-->
        <div class="layui-row">
            <div class="layui-form layui-col-md12 x-so">
                <!--班级-->
                <div class="layui-input-inline dy-show-disable">
                    <select id="s_class">
                        <option value="0">请选择班级</option>
                        <option value="1">一班</option>
                        <option value="2">二班</option>
                    </select>
                </div>
                <!--分组-->
                <div class="layui-input-inline">
                    <select id="s_group">
                        <option value="0">请选择分组</option>
                        <option value="1">1组</option>
                        <option value="2">2组</option>
                        <option value="3">3组</option>
                        <option value="4">4组</option>
                        <option value="5">5组</option>
                        <option value="6">6组</option>
                        <option value="7">7组</option>
                        <option value="8">8组</option>
                        <option value="9">9组</option>
                    </select>
                </div>
                <!--周次-->
                <div class="layui-input-inline">
                    <select id="s_week">
                        <option value="">请选择周次</option>
                        <option value="1">一</option>
                        <option value="2">二</option>
                    </select>
                </div>
                <!--姓名-->
                <div class="layui-input-inline">
                    <input type="text" name="username"  placeholder="请输入姓名[可选]" autocomplete="off" class="layui-input">
                </div>
                <!--查找按钮-->
                <div class="layui-input-inline">
                    <button class="layui-btn search-btn"><i class="layui-icon">&#xe615;</i>查找</button>
                </div>
                <span class="x-right dy-count" style="line-height:40px"></span>
            </div>
        </div>
        <!--条件工具条结束-->
    </blockquote>
    <!--工具栏结束-->
    <!--表格开始-->
    <table class="layui-table" lay-filter="demo" id="test"></table>
    <!--表格结束-->
</div>
<!--操作工具条开始-->
<script id="barDemo" type="text/html">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
</script>
<!--操作工具体结束-->
<script type="application/javascript">
    layui.use('table', function() {
        var table = layui.table;
        var roleNum = ${param.classNum};
        if (roleNum == 0){
            $(".dy-show-disable").removeClass("dy-show-disable");
        }
        //将数据库获取的数据添加到表格
        setTimeout(function () {
            addToData(roleNum,0);
        },700)
        //监听工具条
        table.on('tool(demo)', function(obj){
            var data = obj.data;
            if(obj.event === 'detail'){
                x_admin_show(data.stuName + '周报',"/student/reportLook.do?&repId=" + data.repId ,1000,620);
            } else if(obj.event === 'edit'){
                x_admin_show("修改" + data.stuName + "周报","/student/reportEdit.do?&repId=" + data.repId +"&stuName=" + data.stuName + "&repClass=" + data.repClass +"&stuGroup=" + data.stuGroup+"&repWeek=" + data.repWeek,1000,620);
            }
        });
        // 侦听查找按钮
        $(".search-btn").click(function () {
            var classNum = $("#s_class option:selected").val();
            var groupNum = $("#s_group option:selected").val();
            if (roleNum != 0){
                classNum = roleNum;
            }
            addToData(classNum,groupNum);
        });
        // 给表格添加数据函数
        function addToData(CLASSNUM,GROUPNUM) {
            table.render({
                elem: '#test',
                url: '/admin/showGroupReportList.do?stuClass=' + CLASSNUM + '&stuGroup=' + GROUPNUM,
                request: {
                    pageName: 'pageName', //页码的参数名称，默认：page
                    limitName: 'limitName' //每页数据量的参数名，默认：limit
                },
                method: 'POST',
                limit:6,
                limits:[6,12],
                loading:true,
                cols: [[
                    // {field: 'repId', width: 100, title: '姓名', unresize:true},
                    {field: 'stuName', width:'8%', title: '姓名', unresize:true},
                    {field: 'repClass', width:'7%', title: '班级', sort: true, unresize:true},
                    {field: 'stuGroup', width:'7%', title: '组别', sort: true, unresize:true},
                    {field: 'repWeek', width:'10%', title: '当前周次', sort: true, unresize:true},
                    {field: 'repAddTime', width:'27%', title: '周报提交时间', sort: true, unresize:true},
                    {field: 'repUpdate', width:'27%',title: '周报修改时间', sort: true, unresize:true},
                    {fixed:'right', width:'12%', unresize:true, title:'操作',align:'center', toolbar: '#barDemo'}
                ]],
                //是否分页
                page: true,
                id: 'idTest',
                done: function (res, curr, count) {
                    $(".dy-count").html("共" + count + "条数据，当前第" + curr + "页");
                }
            });
        }
    })
</script>
</body>
</html>
