<%--
  Created by IntelliJ IDEA.
  User: heiyu
  Date: 2024/10/5
  Time: 17:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑页面</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            margin: 50px auto;
            background-color: white;
            padding: 20px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 10px;
            font-weight: bold;
        }
        input, textarea {
            padding: 10px; /* 设置内边距为10像素，增加内容与边框之间的空间 */
            margin-bottom: 20px; /* 设置底部外边距为20像素，使元素之间有一定的间隔 */
            border: 2px solid #ccc; /* 设置边框像素的实线，颜色为浅灰色 (#ccc) */
            border-radius: 5px; /* 设置边框圆角，值为5像素，增加元素的视觉柔和感 */
        }
        input[type="submit"] {
            background-color: #007BFF; /* 设置按钮的背景颜色为蓝色 */
            color: white; /* 设置按钮文本颜色为白色 */
            border: none; /* 去掉按钮的边框 */
            cursor: pointer; /* 鼠标悬停时显示为手形 */
            padding: 10px; /* 设置按钮的内边距 */
            font-size: 20px; /* 设置按钮的字体大小 */
            margin-top: 20px; /* 设置提交按钮与上方元素的距离 */
            margin-bottom: 10px; /* 设置提交按钮与下方元素的距离 */
        }

        input[type="submit"]:hover {
            background-color: #0056b3; /* 鼠标悬停时按钮背景颜色变为稍暗的蓝色 */
        }

    </style>
</head>
<body>
<div class="container">
    <h2>编辑留言</h2>
    <form action="UpdateNoteServlet" method="post">
        <label for="id">id</label>
        <input type="text" id="id" name="id" value="${user.id}" readonly="readonly">

        <label for="userid">用户名:</label>
        <input type="text" id="userid"  name="userid" value="${user.userid}" readonly="readonly">

        <label for="title">标题:</label>
        <input type="text" id="title" name="title" value="${user.title}" readonly="readonly">

        <label for="content">留言内容:</label>
        <textarea id="content" name="content" rows="6">${user.content}</textarea>

        <label for="email">邮箱:</label>
        <input type="email" id="email" name="email" value="${user.email}" readonly="readonly">

        <label for="url">网址:</label>
        <input type="url" id="url" name="url" value="${user.url}" readonly="readonly">

        <label for="ip">ip:</label>
        <input type="ip" id="ip" name="ip" value="${user.ip}" readonly="readonly">

        <label for="writetime">写入时间:</label>
        <input type="writetime" id="writetime" name="writetime" value="${user.writetime}" readonly="readonly">

        <input type="submit" value="提交留言">
    </form>
</div>
</body>
</html>
