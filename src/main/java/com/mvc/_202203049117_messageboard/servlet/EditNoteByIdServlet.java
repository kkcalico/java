package com.mvc._202203049117_messageboard.servlet;

import com.mvc._202203049117_messageboard.dao.UserDAO;
import com.mvc._202203049117_messageboard.pojo.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditNoteByIdServlet", value = "/EditNoteByIdServlet")
public class EditNoteByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        UserDAO userDAO = new UserDAO();
        User user=userDAO.queryUserById(Integer.parseInt(id));
        if(user!=null) {
            request.setAttribute("user", user);
            request.getRequestDispatcher("editNote.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}