<%--
  Created by IntelliJ IDEA.
  User: heiyu
  Date: 2024/10/5
  Time: 17:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>管理员登录</title>
    <style>
        /* 确保所有元素的宽度计算包含内边距和边框 */
        * {
            box-sizing: border-box;
        }
        /* 将整个页面的内容居中对齐 */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        /* 登录表单容器 */
        .login-container {
            background-color: #ffffff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            width: 400px; /* 容器宽度 */
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: -125px; /* 页面偏上移 */
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        /* 表单元素的样式 */
        label {
            margin-bottom: 10px;
            color: #555;
            font-size: 14px;
            width: 100%;
        }

        input {
            padding: 10px;
            margin-bottom: 20px;
            width: 100%;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        /* 提交按钮样式 */
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        /* 错误信息 */
        .error-message {
            color: red;
            margin-top: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>管理员登录</h2>
    <form action="LoginServlet" method="post">
        <label for="username">用户名:</label>
        <input type="text" id="username" name="username" required>

        <label for="password">密码:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="登录">
    </form>

    <!-- 显示错误信息 -->
    <p class="error-message"><%= request.getAttribute("errorMessage") != null ?
            request.getAttribute("errorMessage") : "" %></p>
</div>
</body>
</html>




