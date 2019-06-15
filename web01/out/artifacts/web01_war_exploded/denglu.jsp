<%--
  Created by IntelliJ IDEA.
  User: 没有哆啦A梦的大雄
  Date: 2019/4/23
  Time: 17:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/day18/servletdenglu" method="post">
    <table border="1"  align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>用户名</td>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>密码</td>
            <td><input type="text" name="password"></td>
        </tr>
        <tr>
            <td>验证码</td>
            <td><input type="text" name="chckedimg"></td>
            <td><img src="/day18/Servletcheckimg" id="uio"></td>
        </tr>
        <tr>
            <td><input type="submit" value="登陆"></td>
        </tr>
    </table>
</form>
<script>
    window.onload=function () {
        document.getElementById("uio").onclick=function () {
            this.src="/day18/Servletcheckimg?time="+new Date().getTime();
        }
    }
</script>

<div><%=request.getAttribute("error")==null?"":request.getAttribute("error")%></div>
<div><%=request.getAttribute("errorppp")==null?"":request.getAttribute("errorppp")%></div>

</body>
</html>
