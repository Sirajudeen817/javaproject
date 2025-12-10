package com.quizportal.controller;

import com.quizportal.dao.UserDAO;
import com.quizportal.model.User;
import com.quizportal.util.PasswordUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/common/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        User u = userDAO.findByUsername(username);
        if (u != null && PasswordUtils.matches(password, u.getPasswordHash())) {
            HttpSession session = req.getSession(true);
            session.setAttribute("user", u);
            resp.sendRedirect(req.getContextPath() + "/quizzes");
        } else {
            req.setAttribute("error", "Invalid credentials");
            req.getRequestDispatcher("/jsp/common/login.jsp").forward(req, resp);
        }
    }
}
