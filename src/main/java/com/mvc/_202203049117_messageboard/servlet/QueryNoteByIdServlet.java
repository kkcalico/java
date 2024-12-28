package com.mvc._202203049117_messageboard.servlet;

import com.mvc._202203049117_messageboard.dao.UserDAO;
import com.mvc._202203049117_messageboard.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "QueryNoteByIdServlet", value = "/QueryNoteByIdServlet")
public class QueryNoteByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String source = request.getParameter("source"); // 获取来源页面标识
        // id查询
        UserDAO userDAO = new UserDAO();
        User user = userDAO.queryUserById(id);
        if (user != null) {
            // 查询结果存储到请求属性中
            request.setAttribute("user", user);

            // 根据来源页面进行不同的跳转
            if ("admin".equals(source)) {
                request.getRequestDispatcher("adminSearchResult.jsp").forward(request, response); // 管理员页面的搜索结果
            } else {
                request.getRequestDispatcher("indexSearchResult.jsp").forward(request, response); // 普通用户页面的搜索结果
            }
        } else {
            // 如果没有找到结果，可以根据来源页面跳转到不同的错误页面
            if ("admin".equals(source)) {
                request.setAttribute("errorMessage", "未找到该留言");
                request.getRequestDispatcher("admin.jsp").forward(request, response);
            } else {
                request.setAttribute("errorMessage", "未找到该留言");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
