package com.quizportal.controller;

import com.quizportal.dao.QuestionDAO;
import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Question;
import com.quizportal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet({"/quizzes", "/admin/dashboard", "/admin/create-quiz", "/admin/add-question"})
public class QuizServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();
    private final QuestionDAO questionDAO = new QuestionDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String path = req.getServletPath();
        if ("/quizzes".equals(path)) {
            req.setAttribute("quizzes", quizDAO.listPublished());
            req.getRequestDispatcher("/jsp/user/quizList.jsp").forward(req, resp);
        } else if ("/admin/dashboard".equals(path)) {
            User u = (User) req.getSession().getAttribute("user");
            if (u == null || !"ADMIN".equals(u.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/admin/login");
                return;
            }
            req.setAttribute("totalQuizzes", quizDAO.countQuizzes());
            req.setAttribute("totalQuestions", quizDAO.countQuestions());
            req.setAttribute("totalUsers", quizDAO.countUsers());
            req.getRequestDispatcher("/jsp/admin/dashboard.jsp").forward(req, resp);
        } else if ("/admin/create-quiz".equals(path)) {
            if (!ensureAdmin(req, resp)) return;
            req.setAttribute("questions", questionDAO.listAll());
            req.getRequestDispatcher("/jsp/admin/createQuiz.jsp").forward(req, resp);
        } else if ("/admin/add-question".equals(path)) {
            if (!ensureAdmin(req, resp)) return;
            req.getRequestDispatcher("/jsp/admin/addQuestion.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {
        String path = req.getServletPath();
        if ("/admin/create-quiz".equals(path)) {
            if (!ensureAdmin(req, resp)) return;
            String name = req.getParameter("name");
            String[] selected = req.getParameterValues("questionIds");
            List<Integer> ids = new ArrayList<>();
            if (selected != null) for (String s : selected) ids.add(Integer.parseInt(s));
            quizDAO.createQuiz(name, ids, true);
            resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
        } else if ("/admin/add-question".equals(path)) {
            if (!ensureAdmin(req, resp)) return;
            Question q = new Question();
            q.setContent(req.getParameter("content"));
            q.setOptionA(req.getParameter("optionA"));
            q.setOptionB(req.getParameter("optionB"));
            q.setOptionC(req.getParameter("optionC"));
            q.setOptionD(req.getParameter("optionD"));
            q.setCorrectOption(req.getParameter("correctOption"));
            questionDAO.addQuestion(q);
            resp.sendRedirect(req.getContextPath() + "/admin/create-quiz");
        }
    }

    private boolean ensureAdmin(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        User u = (User) req.getSession().getAttribute("user");
        if (u == null || !"ADMIN".equals(u.getRole())) {
            resp.sendRedirect(req.getContextPath() + "/admin/login");
            return false;
        }
        return true;
    }
}
