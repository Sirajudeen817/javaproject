<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
  body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f6f9;
  }

  header {
    background: #2c3e50;
    color: #fff;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  header h2 { margin: 0; font-size: 20px; }
  header a.logout {
    color: #fff;
    text-decoration: none;
    font-weight: bold;
  }
  header a.logout:hover { text-decoration: underline; }

  nav {
    background: #34495e;
    width: 220px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    padding-top: 70px;
  }

  nav a {
    display: block;
    padding: 12px 20px;
    color: #eee;
    text-decoration: none;
    font-size: 15px;
  }
  nav a:hover { background: #2c3e50; }

  .content {
    margin-left: 240px;
    padding: 30px;
  }

  .welcome {
    font-size: 18px;
    font-weight: 500;
    color: #333;
  }
</style>
</head>
<body>

<header>
  <h2>Admin Dashboard</h2>
  <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
</header>

<nav>
  <a href="<%=request.getContextPath()%>/admin/QuizList.jsp">Quiz List</a>
  <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">Create Quiz</a>
  <a href="AddQuestion.jsp">Add Question</a>
  <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
  <a href="<%=request.getContextPath()%>/User/Leaderboard.jsp">Leaderboard</a>
</nav>

<div class="content">
  <p class="welcome">Welcome, <strong><%= admin.getUsername() %></strong></p>
</div>

</body>
</html>
