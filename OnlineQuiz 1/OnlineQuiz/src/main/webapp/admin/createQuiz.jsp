<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.quiz.dao.QuizDAO" %>
<%
    QuizDAO dao = new QuizDAO();
    List<String> categories = dao.getAllCategories();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Quiz</title>
<style>
  body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f6f9;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .quiz-box {
    background: #fff;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
    width: 380px;
  }

  h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #2c3e50;
  }

  label {
    display: block;
    margin-top: 12px;
    font-weight: 500;
    color: #333;
  }

  input[type="text"], select {
    width: 100%;
    padding: 8px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
  }

  button {
    margin-top: 20px;
    width: 100%;
    padding: 10px;
    background: #27ae60;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
  }

  button:hover { background: #1e8449; }

  .footer { margin-top: 20px; text-align: center; font-size: 13px; color: #777; }
</style>
</head>
<body>

<div class="quiz-box">
  <h2>Create New Quiz</h2>
  <form action="../CreateQuizServlet" method="post">
    <label>Quiz Title</label>
    <input type="text" name="title" placeholder="Enter quiz title" required>

    <label>Category</label>
    <select name="category" required>
      <option value="" disabled selected>-- Select Category --</option>
      <% for(String cat : categories) { %>
        <option value="<%=cat%>"><%=cat%></option>
      <% } %>
    </select>

    <button type="submit">Create Quiz</button>
  </form>
  <div class="footer">© 2025 Quiz Portal</div>
</div>

</body>
</html>
