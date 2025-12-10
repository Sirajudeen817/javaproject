package com.quizportal.controller;

import com.quizportal.dao.LeaderboardDAO;
import com.quizportal.dao.QuizDAO;
import com.quizportal.model.LeaderboardEntry;
import com.quizportal.model.Quiz;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet({"/leaderboard", "/admin/view-leaderboard"})
public class LeaderboardServlet extends HttpServlet {
    private final LeaderboardDAO leaderboardDAO = new LeaderboardDAO();
    private final QuizDAO quizDAO = new QuizDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String quizIdStr = req.getParameter("id");
        if (quizIdStr == null) {
            resp.sendRedirect(req.getContextPath() + "/quizzes");
            return;
        }
        int quizId = Integer.parseInt(quizIdStr);
        List<LeaderboardEntry> entries = leaderboardDAO.leaderboardForQuiz(quizId);
        Quiz quiz = quizDAO.findByIdWithQuestions(quizId);

        req.setAttribute("quizName", quiz != null ? quiz.getName() : "Quiz");
        req.setAttribute("entries", entries);

        String path = req.getServletPath();
        if ("/admin/view-leaderboard".equals(path)) {
            req.getRequestDispatcher("/jsp/admin/viewLeaderboard.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("/jsp/user/leaderboard.jsp").forward(req, resp);
        }
    }
}
