<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<!-- 网页使用的语言 -->
<html lang="zh-CN">
<head>
    <!-- 指定字符集 -->
    <meta charset="utf-8">
    <!-- 使用Edge最新的浏览器的渲染方式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- viewport视口：网页可以根据设置的宽度自动进行适配，在浏览器的内部虚拟一个容器，容器的宽度与设备的宽度相同。
    width: 默认宽度与设备的宽度相同
    initial-scale: 初始的缩放比，为1:1 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户信息管理系统</title>

    <!-- 1. 导入CSS的全局样式 -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 2. jQuery导入，建议使用1.9以上的版本 -->
    <script src="js/jquery-2.1.0.min.js"></script>
    <!-- 3. 导入bootstrap的js文件 -->
    <script src="js/bootstrap.min.js"></script>
    <style type="text/css">
        td, th {
            text-align: center;
        }
    </style>
    <script>
        function deletet(id) {
            if (confirm("你确定要删除吗")) {
                location.href = "${pageContext.request.contextPath}/deleteServlet?id=" + id;
            }
        }

        window.onload = function () {
            document.getElementById("deleteall").onclick = function () {
                if (confirm("你确定删除所有选定的用户吗")) {
                    var flag = false;
                    var ele = document.getElementsByName("uid");
                    for (var a = 0; a < ele.length; a++) {
                        if (ele[a].checked) {
                            flag = true;
                        }
                    }
                    if (flag) {
                        document.getElementById("form").submit();
                    }
                }
            }
            document.getElementById("quanxuan").onclick = function () {
                var ele = document.getElementsByName("uid");
                for (var a = 0; a < ele.length; a++) {
                    ele[a].checked = this.checked;
                }
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h3 style="text-align: center">用户信息列表</h3>

    <div style="float: left;">

        <form class="form-inline" action="${pageContext.request.contextPath}/fenyeServlet" method="post">
            <div class="form-group">
                <label for="exampleInputName2">姓名</label>
                <input type="text" class="form-control" id="exampleInputName2" name="name" value="${map.name[0]}">
            </div>
            <div class="form-group">
                <label for="exampleInputName3">籍贯</label>
                <input type="text" class="form-control" id="exampleInputName3" name="address" value="${map.address[0]}">
            </div>

            <div class="form-group">
                <label for="exampleInputEmail2">邮箱</label>
                <input type="email" class="form-control" id="exampleInputEmail2" name="emall" value="${map.emall[0]}">
            </div>
            <button type="submit" class="btn btn-default">查询</button>
        </form>

    </div>

    <div style="float: right;margin: 5px;">

        <a class="btn btn-primary" href="add.jsp">添加联系人</a>
        <a class="btn btn-primary" href="javascript:void(0);" id="deleteall">删除选中</a>

    </div>
    <form action="${pageContext.request.contextPath}/deletedServlet" method="post" id="form">
        <table border="1" class="table table-bordered table-hover">
            <tr class="success">
                <th><input type="checkbox" id="quanxuan"></th>
                <th>编号</th>
                <th>姓名</th>
                <th>性别</th>
                <th>年龄</th>
                <th>籍贯</th>
                <th>QQ</th>
                <th>邮箱</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${beanPage.list}" var="user" varStatus="s">
                <tr>
                    <td><input type="checkbox" name="uid" value="${user.id}"></td>
                    <td>${s.count}</td>
                    <td>${user.name}</td>
                    <td>${user.gender}</td>
                    <td>${user.age}</td>
                    <td>${user.address}</td>
                    <td>${user.qq}</td>
                    <td>${user.emall}</td>
                    <td><a class="btn btn-default btn-sm"
                           href="${pageContext.request.contextPath}/fandServlet?id=${user.id}">
                        修改</a>&nbsp;<a class="btn btn-default btn-sm"
                                       href="javascript:deletet (${user.id});">删除</a></td>
                </tr>
                <%--//${pageContext.request.contextPath}/deleteServlet?id=${user.id}--%>
            </c:forEach>


        </table>
    </form>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <c:if test="${beanPage.danqianyema==1}">
                    <li class="disabled">
                </c:if>
                    <c:if test="${beanPage.danqianyema!=1}">
                    <li >
                        </c:if>
                    <a href="${pageContext.request.contextPath}/fenyeServlet?danqianyema=${beanPage.danqianyema-1}&Meiyecount=8&name=${map.name[0]}$address=${map.address[0]}&emall=${map.emall[0]}" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <c:forEach begin="1" end="${beanPage.zongYeshu}" var="s">
                    <c:if test="${beanPage.danqianyema!=s}">
                        <li>
                            <a href="${pageContext.request.contextPath}/fenyeServlet?danqianyema=${s}&Meiyecount=8&name=${map.name[0]}$address=${map.address[0]}&emall=${map.emall[0]}">${s}</a>
                        </li>
                    </c:if>
                    <c:if test="${beanPage.danqianyema==s}">
                        <li class="active">
                            <a href="${pageContext.request.contextPath}/fenyeServlet?danqianyema=${s}&Meiyecount=8&name=${map.name[0]}$address=${map.address[0]}&emall=${map.emall[0]}">${s}</a>
                        </li>
                    </c:if>
                </c:forEach>
                <li>
                        <a href="${pageContext.request.contextPath}/fenyeServlet?danqianyema=${beanPage.danqianyema+1}&Meiyecount=8&name=${map.name[0]}$address=${map.address[0]}&emall=${map.emall[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                </li>
                <span style="font-size: 25px;margin-left: 5px;">
                    共${beanPage.zongCount}条记录，共${beanPage.zongYeshu}页
                </span>

            </ul>
        </nav>


    </div>


</div>


</body>
</html>
