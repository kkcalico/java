package com.mvc._202203049117_messageboard.servlet;

import com.mvc._202203049117_messageboard.dao.UserDAO;
import com.mvc._202203049117_messageboard.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddNoteServlet", value = "/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 设置请求编码
        response.setContentType("text/html;charset=UTF-8"); // 设置响应编码
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); // 设置请求编码
        response.setContentType("text/html;charset=UTF-8"); // 设置响应编码

        String userid = request.getParameter("userid");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String email = request.getParameter("email");
        String url = request.getParameter("url");
        String ip = request.getParameter("ip");

        User user = new User();
        user.setUserid(userid);
        user.setTitle(title);
        user.setContent(content);
        user.setEmail(email);
        user.setUrl(url);
        user.setIp(ip);

        UserDAO userDAO = new UserDAO();
        userDAO.insertUser(user, request);

        // 更新留言程序
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }
}
