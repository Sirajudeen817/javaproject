package com.quizportal.controller;

public class Registration {

}
package com.quizportal.controller;

import com.quizportal.dao.UserDAO;
import com.quizportal.util.ValidationUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/common/register.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if (!ValidationUtils.isValidUsername(username)
                || !ValidationUtils.isValidEmail(email)
                || !ValidationUtils.isNonEmpty(password)) {
            req.setAttribute("error", "Invalid inputs");
            req.getRequestDispatcher("/jsp/common/register.jsp").forward(req, resp);
            return;
        }

        try {
            boolean ok = userDAO.createUser(username, email, password, "USER");
            if (ok) {
                resp.sendRedirect(req.getContextPath() + "/login");
            } else {
                req.setAttribute("error", "Registration failed");
                req.getRequestDispatcher("/jsp/common/register.jsp").forward(req, resp);
            }
        } catch (RuntimeException e) {
            req.setAttribute("error", "Username or email already exists");
            req.getRequestDispatcher("/jsp/common/register.jsp").forward(req, resp);
        }
    }
}
