<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/7/11
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>系统参数</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="wcodeth=device-wcodeth, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../css/jeui.css" media="all">
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="../js/layer/layer.js"></script>
</head>
<body>
<div class="je-p20">
    <form class="je-form-item">
        <table class="je-table je-f14">
            <colgroup>
                <col width="20%">
                <col width="50%">
                <col>
            </colgroup>
            <thead>
            <tr>
                <th>参数说明</th>
                <th>参数值</th>
                <th>变量名</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>LOGO标题</td>
                <td><input type="text" class="je-input cmsName" lay-verify="required" placeholder="请输入LOGO标题名称"></td>
                <td>title</td>
            </tr>
            <tr>
                <td>一级标题</td>
                <td><input type="text" class="je-input version" placeholder="请输入一级标题"></td>
                <td>applytitle1</td>
            </tr>
            <tr>
                <td>二级标题</td>
                <td><input type="text" class="je-input author" placeholder="请输入二级标题"></td>
                <td>applytitle2</td>
            </tr>
            <tr>
                <td>版权信息</td>
                <td><input type="text" class="je-input powerby" placeholder="请输入网站版权信息"></td>
                <td>footer</td>
            </tr>
            <tr>
                <td>ICP/IP备案号</td>
                <td><input type="text" class="je-input record" placeholder="请输入ICP/IP备案号"></td>
                <td>beian</td>
            </tr>
            <tr>
                <td>公安备案号</td>
                <td><input type="text" class="je-input" id="sbeian" placeholder="请输入公安备案号"></td>
                <td>sbeian</td>
            </tr>
            <tr>
                <td colspan="3" align="center"><a class="je-btn je-bg-red">进行修改</a></td>
            </tr>
            </tbody>
        </table>
    </form>
</div>
<script type="text/javascript">
        // 进行AJAX请求
     $.ajax({
         url:"../SystemServlet",
         type: "post",
         data:{
             operating:"selsysinfo"
         },
         success: function (result) {
             var dataObj = JSON.parse(result);
             //设置参数
             $(".cmsName").attr("value",dataObj.title);
             $(".version").attr("value",dataObj.applytitle1);
             $(".author").attr("value",dataObj.applytitle2);
             $(".powerby").attr("value",dataObj.footer);
             $(".record").attr("value",dataObj.beian);
             $("#sbeian").attr("value",dataObj.sbeian);
         },
         error: function (res) {
         }
     });
     //检测按钮按下
     $(".je-bg-red").click(function () {
          //示范一个公告层
         layer.open({
             type: 1 ,
             title: false, //不显示标题栏
             closeBtn: false,
             area: '50%;',
             shade: 0.8,
             id: 'LAY_layuipro' ,//设定一个id，防止重复弹出
             btn: ['确认修改', '点错啦，退出修改'],
             btnAlign: 'c',
             moveType: 1, //拖拽模式，0或者1
             content: '<div style="padding: 50px; line-height: 22px; background-color: #429742; color: #fff; font-weight: 300;">您即将修改系统显示的信息</div>',
             success: function(layero){
                 var btn = layero.find('.layui-layer-btn');
                 btn.find('.layui-layer-btn0').click(function () {
                     var title = $(".cmsName").val();
                     var applytitle1 = $(".version").val();
                     var applytitle2 = $(".author").val();
                     var footer = $(".powerby").val();
                     var beian = $(".record").val();
                     var sbeian = $("#sbeian").val();
                     // alert(title);
                     // alert(applytitle1);
                     // alert(applytitle2);
                     // alert(footer);
                     // alert(beian);
                     $.ajax({
                         url:"../SystemServlet",
                         type: "post",
                         data:{
                             operating:"updatesysinfo",
                             title:title,
                             applytitle1:applytitle1,
                             applytitle2:applytitle2,
                             footer:footer,
                             beian:beian,
                             sbeian:sbeian
                         },
                         success: function (result) {
                             layer.msg(JSON.parse(result), {icon: 6});
                             setTimeout(function () {
                                 window.location.href="system.jsp";
                             }, 3000);
                         },
                         error: function (res) {
                             layer.msg(JSON.parse(res), {icon: 5});
                         }
                     });
                 });
             }
         })
     })
</script>
<!--
http://www.qdfuns.com/notes/13967/3cdebc6a132f33a3e65aa2b6019a7487.html
http://www.jq22.com/demo/jQueryNavHover20161129/
-->
</body>
</html>
