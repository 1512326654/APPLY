<%--
  Created by IntelliJ IDEA.
  User: 董尧
  Date: 2018/8/14
  Time: 0:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页面跳转</title>
</head>
<body>
<script language=JavaScript>
    alert(${requestScope.info.flag});
    <%--<jsp:forward page="/student/toTndex" />--%>
    <%--alert(${requestScope.info.student.stuName});--%>
    window.location="/student/toTndex"
</script>
</body>
</html>
