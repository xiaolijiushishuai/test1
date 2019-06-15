<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: 没有哆啦A梦的大雄
  Date: 2019/4/25
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
List list=new ArrayList();
list.add(123);
list.add(43);
list.add(123);
request.setAttribute("list",list);
int a=9;
session.setAttribute("number",a);
request.setAttribute("xingqi",2);
%>
<c:if test="${not empty list}">
    不是空
</c:if>
<c:if test="${number%2==1}">
    是奇数
</c:if>
<c:choose>
<c:when test="${xingqi==1}">星期一</c:when>
<c:when test="${xingqi==2}">星期二</c:when>
    <c:otherwise>sb</c:otherwise>
</c:choose>
<c:forEach begin="1" end="10" var="a" step="2" varStatus="s">
    ${a}<br>
   <h1>${s.index}</h1>
    ${s.count}
</c:forEach>
<hr>
<c:forEach items="${list}" var="w" varStatus="op">
    ${op.index}<br>
    ${op.count}<br>
    ${w}<br>
</c:forEach>
</body>
</html>
