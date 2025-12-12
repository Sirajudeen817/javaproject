<%@ page import="java.util.List, com.quiz.model.Quiz, com.quiz.model.Question, com.quiz.dao.QuizDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    // --- Quiz Pagination Setup ---
    int currentPage = 1; // default currentPage
    int recordsPerPage = 5; // quizzes per page
    int questionsPerPage = 3; // questions per quiz per inner page

    if(request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }

    int offset = (currentPage - 1) * recordsPerPage;

    QuizDAO dao = new QuizDAO();
    int totalRecords = dao.getTotalQuizCount();
    int totalPages = (int)Math.ceil(totalRecords * 1.0 / recordsPerPage);

    List<Quiz> quizzes = dao.getQuizzesWithQuestions(offset, recordsPerPage);

    int prevPage = currentPage - 1;
    int nextPage = currentPage + 1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Quizzes</title>
<style>
    body { font-family: Arial; padding: 20px; background: #f0f2f5; }
    table { width: 100%; border-collapse: collapse; background: #fff; box-shadow: 0 4px 10px rgba(0,0,0,0.1);}
    th, td { border: 1px solid #b2bec3; padding: 8px; text-align: left; }
    th { background: #0984e3; color: #fff; }
    tr:nth-child(even) { background: #dfe6e9; }
    .pager a { margin: 0 5px; text-decoration: none; color: #0984e3; font-weight: bold; }
    .pager span { margin: 0 5px; }
    .question-table { width: 100%; margin-top: 5px; border-collapse: collapse; }
    .question-table th, .question-table td { border: 1px solid #b2bec3; padding: 5px; font-size: 13px; }
    .question-table th { background: #00b894; color: #fff; }
    .questionPager a { margin: 0 3px; text-decoration: none; color: #00b894; font-weight: bold; font-size: 12px; }
    .questionPager span { margin: 0 3px; font-size: 12px; }
</style>
</head>
<body>

<h2>All Quizzes</h2>

<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Quiz Name</th>
            <th>Category</th>
            <th>Questions</th>
        </tr>
    </thead>
    <tbody>
    <%
        int count = offset + 1;
        for(Quiz quiz : quizzes) {
            List<Question> allQuestions = quiz.getQuestions();
            int totalQuestions = allQuestions.size();

            // --- Determine inner question page for this quiz ---
            int questionPage = 1;
            String param = request.getParameter("qPage_" + quiz.getId());
            if(param != null) {
                questionPage = Integer.parseInt(param);
            }
            int questionOffset = (questionPage - 1) * questionsPerPage;
            int questionEnd = Math.min(questionOffset + questionsPerPage, totalQuestions);
    %>
        <tr>
            <td><%= count++ %></td>
            <td><%= quiz.getQuizName() %></td>
            <td><%= quiz.getCategory() %></td>
            <td>
                <table class="question-table">
                    <tr>
                        <th>#</th>
                        <th>Question</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>Correct</th>
                    </tr>
                    <%
                        int qCount = questionOffset + 1;
                        for(int i = questionOffset; i < questionEnd; i++) {
                            Question q = allQuestions.get(i);
                    %>
                        <tr>
                            <td><%= qCount++ %></td>
                            <td><%= q.getQuestionText() %></td>
                            <td><%= q.getOptionA() %></td>
                            <td><%= q.getOptionB() %></td>
                            <td><%= q.getOptionC() %></td>
                            <td><%= q.getOptionD() %></td>
                            <td><%= q.getCorrectOption() %></td>
                        </tr>
                    <%
                        }
                    %>
                </table>

                <%-- Inner pager for questions --%>
                <div class="questionPager">
                    <%
                        int totalQuestionPages = (int)Math.ceil((double)totalQuestions / questionsPerPage);
                        for(int qp = 1; qp <= totalQuestionPages; qp++) {
                            if(qp == questionPage) {
                    %>
                        <span style="font-weight:bold; color:#d63031;"><%=qp%></span>
                    <%
                            } else {
                    %>
                        <a href="quizList.jsp?currentPage=<%=currentPage%>&qPage_<%=quiz.getId()%>=<%=qp%>"><%=qp%></a>
                    <%
                            }
                        }
                    %>
                </div>
            </td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>

<%-- Outer pager for quizzes --%>
<div class="pager">
    <% if(prevPage >= 1) { %>
        <a href="quizList.jsp?currentPage=<%=prevPage%>">« Previous</a>
    <% } else { %>
        <span style="color: #b2bec3;">« Previous</span>
    <% } %>

    <%
        for(int i = 1; i <= totalPages; i++) {
            if(i == currentPage) {
    %>
        <span style="font-weight:bold; color:#d63031;"><%=i%></span>
    <%
            } else {
    %>
        <a href="quizList.jsp?currentPage=<%=i%>"><%=i%></a>
    <%
            }
        }
    %>

    <% if(nextPage <= totalPages) { %>
        <a href="quizList.jsp?currentPage=<%=nextPage%>">Next »</a>
    <% } else { %>
        <span style="color: #b2bec3;">Next »</span>
    <% } %>
</div>

</body>
</html>
