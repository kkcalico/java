package com.mvc._202203049117_messageboard.servlet;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "123456";
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取页面输入的账号密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // 检查用户名和密码
        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {
            // 登录成功，创建会话
            HttpSession session = request.getSession(); // 获取当前用户的会话
            session.setAttribute("isAdmin", true); // 在当前会话中存储一个属性，表示该用户是管理员。
            // 重定向到管理员页面
            response.sendRedirect("admin.jsp");
        } else {
            // 登录失败，返回登录页面并显示错误信息
            request.setAttribute("errorMessage", "用户名或密码错误");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
