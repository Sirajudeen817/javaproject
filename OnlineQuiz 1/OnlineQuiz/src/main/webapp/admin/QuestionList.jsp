<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.model.Question" %>
<%
    com.quiz.model.Admin admin = (com.quiz.model.Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/AdminLogin.jsp");
        return;
    }
    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Question List - Admin</title>
<style>
  body { font-family: "Segoe UI", Arial, sans-serif; margin: 0; background: #f4f6f9; }
  header {
    background: #2c3e50; color: #fff; padding: 12px 20px;
    display: flex; justify-content: space-between; align-items: center;
  }
  header h2 { margin: 0; font-size: 20px; }
  header a.logout {
    color: #fff; text-decoration: none; font-weight: bold;
  }
  header a.logout:hover { text-decoration: underline; }

  nav {
    background: #34495e; width: 220px; height: 100vh;
    position: fixed; top: 0; left: 0; padding-top: 70px;
  }
  nav a {
    display: block; padding: 12px 20px; color: #eee;
    text-decoration: none; font-size: 15px;
  }
  nav a:hover { background: #2c3e50; }

  .content { margin-left: 240px; padding: 30px; }
  .welcome { font-size: 16px; margin-bottom: 20px; }

  table {
    width: 100%; border-collapse: collapse; background: #fff;
    border-radius: 8px; overflow: hidden;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
  }
  th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
  th { background: #3498db; color: #fff; text-transform: uppercase; font-size: 13px; }
  tr:nth-child(even) { background: #f9f9f9; }
  tr:hover { background: #ecf0f1; }
</style>
</head>
<body>

<header>
  <h2>Admin Dashboard</h2>
  <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
</header>

<nav>
  <a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">Create Quiz</a>
  <a href="<%=request.getContextPath()%>/admin/QuizList.jsp">Quiz List</a>
  <a href="<%=request.getContextPath()%>/admin/AddQuestion.jsp">Add Question</a>
  <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
  <a href="<%=request.getContextPath()%>/admin/leaderboard.jsp">Leaderboard</a>
</nav>

<div class="content">
  <p class="welcome">Welcome, <strong><%= admin.getUsername() %></strong></p>
