<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
         import="java.sql.*" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>留言板首页</title>
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
<body>

<h2>欢迎来到留言板系统</h2>

<!-- 导航栏 -->
<div class="navbar">
    <a href="addNote.jsp">发布留言</a>
    <a href="login.jsp">管理员登录</a>
</div>

<!-- 搜索栏和表格内容容器 -->
<div class="content-wrapper">
    <!-- 搜索栏 -->
    <div class="search-container">
        <form action="QueryNoteByIdServlet" method="get">
            <input type="text" name="id" placeholder="搜索留言ID..." required>
            <input type="hidden" name="source" value="index"> <!-- 标识来源为普通用户页面 -->
            <input type="submit" value="搜索">
        </form>
    </div>
</div>


<h3 style="text-align:center">最新留言展示</h3>

<!-- 显示留言内容 -->
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
    </tr>

    <%
        // 查询数据库中的最新留言并显示
        try {
            // 加载数据库
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 定义连接数据库的参数
            String URL = "jdbc:mysql://localhost:3306/202203049117_messageboard?userSSL=false" +
                    "&useUnicode=true&characterEncoding=utf-8&serverTimezone=Asia/Shanghai";
            String USER = "root";
            String PASSWORD = "kiana1207";
            // 创建链接
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            String sql = "SELECT * FROM note";
            // 创建语句处理对象
            Statement stmt = conn.createStatement();
            // 查询
            ResultSet rs = stmt.executeQuery(sql);

            // 读取数据
            while (rs.next()) {
                int id = rs.getInt("id");
                String userid = rs.getString("userid");
                String title = rs.getString("title");
                String content = rs.getString("content");
                String email = rs.getString("email");
                String url = rs.getString("url");
                String ip = rs.getString("ip");
                Timestamp writetime = rs.getTimestamp("writetime");
    %>
    <tr>
        <td><%= id %></td>
        <td><%= userid %></td>
        <td><%= title %></td>
        <td><%= content %></td>
        <td><a href="mailto:<%= email %>"><%= email %></a></td>
        <td><a href="<%= url %>" target="_blank"><%= url %></a></td>
        <td><%= ip %></td>
        <td><%= writetime %></td>
    </tr>
    <%
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
</table>

<div class="footer">
    <p>留言板系统 | 组长学号：202203049117</p>
</div>

</body>
</html>




