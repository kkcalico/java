<%@ page import="java.util.List" %>
<%@ page import="com.mvc._202203049117_messageboard.dao.UserDAO" %>
<%@ page import="com.mvc._202203049117_messageboard.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: heiyu
  Date: 2024/10/5
  Time: 17:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            margin-top: 20px;
        }
        .navbar {
            text-align: center;
            margin-bottom: 20px;
        }
        .navbar a {
            padding: 10px 20px;
            margin: 0 10px;
            text-decoration: none;
            color: white;
            background-color: #007BFF;
            border-radius: 5px;
        }
        .navbar a:hover {
            background-color: #0056b3;
        }
        .message-table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .message-table th, .message-table td {
            border: 1px solid #ddd;
            padding: 12px;
        }
        .message-table th {
            background-color: #f2f2f2;
            text-align: center;
        }
        .message-table td {
            text-align: center;
        }
        .message-table a {
            color: #007BFF;
            text-decoration: none;
        }
        .message-table a:hover {
            text-decoration: underline;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
        }


        /* 搜索栏与表格容器 */
        .content-wrapper {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;

        }

        /* 搜索栏样式 */
        .search-container {
            display: flex;
            align-items: center;
        }

        .search-container input[type="text"] {
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .search-container input[type="submit"] {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-left: 5px;
        }

        .search-container input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<h2>管理员 - 留言管理</h2>

<!-- 返回导航栏 -->
<div class="navbar">
    <a href="index.jsp">返回用户页面</a>
</div>


<!-- 搜索栏和表格内容容器 -->
<div class="content-wrapper">
    <!-- 搜索栏 -->
    <div class="search-container">
        <form action="QueryNoteByIdServlet" method="get">
            <input type="text" name="id" placeholder="搜索留言ID..." required>
            <input type="hidden" name="source" value="admin"> <!-- 标识来源为管理员页面 -->
            <input type="submit" value="搜索">
        </form>
    </div>
</div>


<!-- 显示留言内容 -->
<table class="message-table">
    <tr>
        <th>ID</th>
        <th>用户</th>
        <th>标题</th>
        <th>留言内容</th>
        <th>邮箱</th>
        <th>网址</th>
        <th>IP地址</th>
        <th>留言时间</th>
        <th>操作</th>
    </tr>

    <%
        // userDAO对象
        UserDAO userDAO = new UserDAO();
        // 调用queryAll()
        List<User> listNote = userDAO.queryAll();
        // 将查询结果放入请求范围
        request.setAttribute("listNote", listNote);
    %>
    <c:forEach items="${listNote}" var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.userid}</td>
            <td>${user.title}</td>
            <td>${user.content}</td>
            <td><a href="mailto:${user.email}">${user.email}</a></td>
            <td><a href="${user.url}" target="_blank">${user.url}</a></td>
<%--            <td>${user.email}</td>--%>
<%--            <td>${user.url}</td>--%>
            <td>${user.ip}</td>
            <td>${user.writetime}</td>
            <td>
            <a href="EditNoteByIdServlet?id=${user.id}">编辑</a> |
            <a href="DeleteNoteByIdServlet?id=${user.id}" onclick="return confirm('确定要删除吗?')">删除</a>
        </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
