<%@ page import="java.util.List, com.quiz.model.Quiz, com.quiz.model.Question, com.quiz.dao.QuizDAO" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    int currentPage = 1;
    int recordsPerPage = 5;
    int questionsPerPage = 3;

    if(request.getParameter("currentPage") != null) {
        currentPage = Integer.parseInt(request.getParameter("currentPage"));
    }

    int offset = (currentPage - 1) * recordsPerPage;

    QuizDAO dao = new QuizDAO();
    int totalRecords = dao.getTotalQuizCount();
    int totalPages = (int)Math.ceil(totalRecords * 1.0 / recordsPerPage);

    List<Quiz> quizzes = dao.getQuizzesWithQuestions(offset, recordsPerPage);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Quizzes</title>
<style>
    body {
        font-family: "Segoe UI", sans-serif;
        background: linear-gradient(135deg, #eef2f3, #d9e2ec);
        margin: 0;
        padding: 30px;
    }

    h2 {
        text-align: center;
        color: #004aad;
        margin-bottom: 30px;
        letter-spacing: 1px;
    }

    .quiz-card {
        background: white;
        border-radius: 12px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        margin-bottom: 25px;
        padding: 20px;
        transition: transform 0.2s ease, box-shadow 0.2s ease;
    }

    

    .quiz-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        cursor: pointer;
    }

    .quiz-title {
        font-size: 20px;
        font-weight: 600;
        color: #2c3e50;
    }

    .quiz-category {
        background: #004aad;
        color: white;
        padding: 5px 12px;
        border-radius: 8px;
        font-size: 14px;
    }

    .question-section {
        margin-top: 15px;
        display: none;
        animation: fadeIn 0.3s ease-in-out;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        background: #f8f9fa;
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        border: 1px solid #dcdde1;
        padding: 10px;
        text-align: left;
    }

    th {
        background-color: #004aad;
        color: white;
        font-weight: 500;
    }

    tr:nth-child(even) {
        background: #f1f2f6;
    }

    .pager, .questionPager {
        text-align: center;
        margin-top: 15px;
    }

    .pager a, .questionPager a {
        text-decoration: none;
        color: #004aad;
        font-weight: bold;
        margin: 0 5px;
    }

    .pager span, .questionPager span {
        color: #d63031;
        font-weight: bold;
        margin: 0 5px;
    }

    @keyframes fadeIn {
        from {opacity: 0; transform: translateY(-10px);}
        to {opacity: 1; transform: translateY(0);}
    }
</style>
</head>
<body>

<h2>📋 Quiz List</h2>

<%
    int quizCount = offset + 1;
    for(Quiz quiz : quizzes) {
        List<Question> questions = quiz.getQuestions();
%>
    <div class="quiz-card">
        <div class="quiz-header" onclick="toggleQuestions('q<%=quiz.getId()%>')">
            <div class="quiz-title"><%= quizCount++ %>. <%= quiz.getQuizName() %></div>
            <div class="quiz-category"><%= quiz.getCategory() %></div>
        </div>

        <div id="q<%=quiz.getId()%>" class="question-section">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Question</th>
                        <th>A</th>
                        <th>B</th>
                        <th>C</th>
                        <th>D</th>
                        <th>Correct</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int qNum = 1;
                        for(Question q : questions) {
                    %>
                    <tr>
                        <td><%= qNum++ %></td>
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
                </tbody>
            </table>
        </div>
    </div>
<%
    }
%>

<div class="pager">
    <% if(currentPage > 1) { %>
        <a href="quizList.jsp?currentPage=<%=currentPage - 1%>">« Previous</a>
    <% } else { %>
        <span>« Previous</span>
    <% } %>

    <% for(int i = 1; i <= totalPages; i++) {
        if(i == currentPage) { %>
            <span><%=i%></span>
        <% } else { %>
            <a href="quizList.jsp?currentPage=<%=i%>"><%=i%></a>
        <% }
    } %>

    <% if(currentPage < totalPages) { %>
        <a href="quizList.jsp?currentPage=<%=currentPage + 1%>">Next »</a>
    <% } else { %>
        <span>Next »</span>
    <% } %>
</div>

<script>
function toggleQuestions(id) {
    let section = document.getElementById(id);
    section.style.display = (section.style.display === 'block') ? 'none' : 'block';
}
</script>

</body>
</html>
