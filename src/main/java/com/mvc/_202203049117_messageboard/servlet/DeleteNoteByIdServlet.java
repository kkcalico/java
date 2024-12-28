package com.mvc._202203049117_messageboard.servlet;

import com.mvc._202203049117_messageboard.dao.UserDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DeleteNoteByIdServlet", value = "/DeleteNoteByIdServlet")
public class DeleteNoteByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 获取用户 ID
        int id = Integer.parseInt(request.getParameter("id"));

        // 创建 UserDAO 对象并调用删除方法
        UserDAO userDAO = new UserDAO();
        userDAO.deleteById(id);  // 删除用户

        // 删除完成后重定向到用户列表页面
        response.sendRedirect("admin.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
