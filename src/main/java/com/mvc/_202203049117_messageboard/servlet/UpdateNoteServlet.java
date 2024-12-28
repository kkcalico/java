package com.mvc._202203049117_messageboard.servlet;

import com.mvc._202203049117_messageboard.dao.UserDAO;
import com.mvc._202203049117_messageboard.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdateNoteServlet", value = "/UpdateNoteServlet")
public class UpdateNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 设置请求编码
        response.setContentType("text/html;charset=UTF-8"); // 设置响应编码
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 设置请求编码
        response.setContentType("text/html;charset=UTF-8"); // 设置响应编码

        int id = Integer.parseInt(request.getParameter("id"));
        String content = request.getParameter("content");

        // 创建 User 对象并设置属性
        User user = new User();
        user.setId(id);
        user.setContent(content);

        // 创建 UserDAO 对象并调用更新方法
        UserDAO userDAO = new UserDAO();
        userDAO.updateUser(user);  // 更新用户信息

        // 更新完成后重定向到用户列表页面
        response.sendRedirect("admin.jsp");
    }
}
