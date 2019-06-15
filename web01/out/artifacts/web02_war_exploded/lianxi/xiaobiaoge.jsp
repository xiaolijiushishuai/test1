<%@ page import="lianxi01.jsplianxi.users" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 没有哆啦A梦的大雄
  Date: 2019/4/25
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <style>
        .op {
            border: 1px red solid;
        }
    </style>
</head>
<body>
<%
    users use = new users();
    List<users> list = new ArrayList<>();
    list.add(new users("小红", "女", new Date()));
    list.add(new users("小红", "男", new Date()));
    list.add(new users("小红", "时男时女", new Date()));
    request.setAttribute("users", list);
%>
<table border="1" align="center" width="50%">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>性别</th>
        <th>生日</th>
    </tr>
    <c:forEach items="${users}" varStatus="s" var="use">
        <c:if test="${s.count%2==1}">
            <tr bgcolor="yellow">
                <td>${s.count}</td>
                <td>${use.name}</td>
                <td>${use.gender}</td>
                <td>${use.brithday}</td>
            </tr>
        </c:if>
        <c:if test="${s.count%2==0}">
            <tr bgcolor="red">
                <td>${s.count}</td>
                <td>${use.name}</td>
                <td>${use.gender}</td>
                <td>${use.brithday}</td>
            </tr>
        </c:if>
    </c:forEach>
</table>
</body>
</html>
