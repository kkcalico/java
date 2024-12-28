<%--
  Created by IntelliJ IDEA.
  User: heiyu
  Date: 2024/10/8
  Time: 18:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mvc._202203049117_messageboard.pojo.User" %>
<%@ page import="com.mvc._202203049117_messageboard.dao.UserDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>管理员搜索结果</title>
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
            margin: 20px auto;
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
    </style>
</head>
<body>

<h2>管理员搜索结果</h2>

<!-- 返回导航栏 -->
<div class="navbar">
    <a href="admin.jsp">返回管理员页面</a>
</div>

<!-- 显示搜索结果 -->
<table class="message-table">
    <tr>
        <th>ID</th>
        <th>用户ID</th>
        <th>标题</th>
        <th>留言内容</th>
        <th>邮箱</th>
        <th>网址</th>
        <th>IP地址</th>
        <th>留言时间</th>
        <th>操作</th>
    </tr>

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

</table>
</body>
</html>
