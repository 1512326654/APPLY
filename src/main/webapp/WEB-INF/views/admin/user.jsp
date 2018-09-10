<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/9
  Time: 17:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>演示-普通内容列表</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/jeui.css" media="all">
    <link rel="stylesheet" href="../css/skin/jebox.css"  media="all">
    <link rel="stylesheet" href="../css/skin/jedate.css"  media="all">
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/modules/jeui.js"></script>
    <style>
        .userphoto{width: 60px;height: 60px;overflow: hidden;}
    </style>
</head>
<body>
<div class="je-p20">

    <blockquote class="je-quote green je-f16 je-ovh  je-mb10">
        <p class="je-pb5">
            <input type="text" name="title" id="inpstart" placeholder="开始日期" readonly class="je-input je-pl5 je-pr5">
            <input type="text" name="title" id="inpend" placeholder="结束日期" readonly class="je-input je-pl5 je-pr5">
            <input type="text" name="title" autocomplete="off" placeholder="请输入关键字" class="je-input je-pl5 je-pr5">
            <button class="je-btn je-f14">查询</button>
        </p>
        <p>
            <button class="je-btn" id="addart"><i class="je-icon je-f20">&#xe66e;</i> 添加会员</button>
            <button class="je-btn je-bg-orange"><i class="je-icon je-f20">&#xe62b;</i> 审核会员</button>
            <button class="je-btn je-bg-red"><i class="je-icon je-f20">&#xe63e;</i> 删除会员</button>
        </p>
    </blockquote>
    <table class="je-table je-mb20" id="newCheck">
        <thead>
        <tr>
            <th width="30"><input type="checkbox" name="checkbox" id="gocheck" jename="chunk"></th>
            <th width="80" align="left">序号</th>
            <th>姓名</th>
            <th>用户名</th>
            <th>角色</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="remark">

        </tbody>
    </table>
</div>
<script type="text/javascript">
    jeui.use(["jquery","jeBox","jeDate","jeCheck"],function () {

        var start = {
            format: 'YYYY-MM-DD hh:mm:ss',
            minDate: '2014-06-16 23:59:59', //设定最小日期为当前日期
            isinitVal:true,
            //festival:true,
            ishmsVal:false,
            maxDate: $.nowDate({DD:0}), //最大日期
            choosefun: function(elem, val, date){
                end.minDate = date; //开始日选好后，重置结束日的最小日期
                endDates();
            }
        };
        var end = {
            format: 'YYYY-MM-DD hh:mm:ss',
            minDate: $.nowDate({DD:0}), //设定最小日期为当前日期
            //festival:true,
            maxDate: '2099-06-16 23:59:59', //最大日期
            choosefun: function(elem, val, date){
                start.maxDate = date; //将结束日的初始值设定为开始日的最大日期
            }
        };
        //这里是日期联动的关键
        function endDates() {
            //将结束日期的事件改成 false 即可
            end.trigger = false;
            $("#inpend").jeDate(end);
        }
        $('#inpstart').jeDate(start);
        $('#inpend').jeDate(end);
        $("#newCheck").jeCheck({
            jename:"chunk",
            attrName:[false,"勾选"],
            itemfun: function(elem,bool) {
                console.log(bool)
                //console.log(elem.prop('checked'))
            },
            success:function(elem){
                jeui.chunkSelect(elem,'#gocheck','on')

            }
        })
    });
</script>
<script type="text/javascript">
    /**
     * $(function () { })
     * 所有的DOM加载完成后加载
     */
    $(function () {
        // alert("studentinfo");
        $.ajax({
            url:"../AdminServlet",
            type: "post",
            // dataType:"json",
            // contentType:"application/json",
            // data:JSON.stringify({"STR":1}),
            data:{
                operating:"userinfo"
            },
            // contentType:"application/json;charset=utf-8",
            success: function (result) {
                var dataObj2 = JSON.parse(result);
                $.each(dataObj2, function(i, value) {
                    var name = value.s_name;
                    $("#remark").append(
                        "<tr>" +
                        "<td align='center' width='100px'><input type='checkbox' name='checkbox' jename='chunk'></td>" +
                        "<td width='70px'>" + value.u_id + "</td>" +
                        "<td width='100px'>" + value.u_name + "</td>" +
                        "<td>" + value.u_username + "</td>" +
                        "<td>" + value.u_role + "</td>" +
                        "<td align='center' width='100px'>" +
                        "<button class='je-btn je-btn-mini je-f12' onclick='b(" + value.s_name + ")'>编辑</button>'" +
                        "<button class='je-btn je-btn-mini je-bg-red je-f12'>删除</button>" +
                        "</td>" +
                        "<tr>"
                    );
                });
            },
            error: function (res) {
            }
        });
    })
</script>
</body>
</html>
