package com.quizportal.controller;

import com.quizportal.dao.LeaderboardDAO;
import com.quizportal.dao.QuizDAO;
import com.quizportal.model.Question;
import com.quizportal.model.Quiz;
import com.quizportal.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/quiz/attempt")
public class AttemptQuizServlet extends HttpServlet {
    private final QuizDAO quizDAO = new QuizDAO();
    private final LeaderboardDAO leaderboardDAO = new LeaderboardDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String quizIdStr = req.getParameter("id");
        if (quizIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/quizzes");
            return;
        }
        int quizId = Integer.parseInt(quizIdStr);
        Quiz quiz = quizDAO.findByIdWithQuestions(quizId);
        if (quiz == null || !quiz.isPublished()) {
            resp.sendRedirect(req.getContextPath() + "/quizzes");
            return;
        }
        req.setAttribute("quiz", quiz);
        req.getRequestDispatcher("/jsp/user/attemptQuiz.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, Http