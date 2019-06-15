<%--
  Created by IntelliJ IDEA.
  User: 没有哆啦A梦的大雄
  Date: 2019/4/23
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><%=request.getSession().getAttribute("user")%></h1>
</body>
</html>
