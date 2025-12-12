<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Question</title>
<style>
  body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
  }

  header {
    background: #2c3e50;
    color: #fff;
    padding: 12px 20px;
    text-align: center;
    font-size: 18px;
    font-weight: 600;
  }

  main {
    max-width: 600px;
    margin: 40px auto;
    padding: 20px;
  }

  form {
    background: #fff;
    padding: 25px;
    border-radius: 8px;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }

  label {
    display: block;
    margin-top: 12px;
    font-weight: 500;
    color: #333;
  }

  input[type="text"], textarea, select {
    width: 100%;
    padding: 8px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
  }

  textarea { resize: none; }

  input[type="submit"] {
    margin-top: 20px;
    width: 100%;
    background: #2c3e50;
    color: #fff;
    border: none;
    padding: 10px;
    border-radius: 5px;
    font-size: 15px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background: #1a252f;
  }

  .message { text-align: center; margin-bottom: 15px; font-weight: bold; }
  .success { color: green; }
  .error { color: red; }

  a.back-link {
    display: block;
    text-align: center;
    margin-top: 15px;
    color: #2c3e50;
    text-decoration: none;
  }
  a.back-link:hover { text-decoration: underline; }
</style>
</head>
<body>

<header>Add New Question</header>

<main>
  <% 
    String success = request.getParameter("success");
    String error = request.getParameter("error");
    if (success != null) { 
  %>
    <p class="message success"><%= success %></p>
  <% } else if (error != null) { %>
    <p class="message error"><%= error %></p>
  <% } %>

  <form action="<%=request.getContextPath()%>/AddQuestionServlet" method="post">
    <label>Category:</label>
    <select name="category" required>
      <option value="">--Select--</option>
      <option>Java</option>
      <option>Python</option>
      <option>Web Development</option>
      <option>Databases</option>
      <option>Networking</option>
    </select>

    <label>Question:</label>
    <textarea name="questionText" rows="3" required></textarea>

    <label>Option A:</label>
    <input type="text" name="optionA" required>

    <label>Option B:</label>
    <input type="text" name="optionB" required>

    <label>Option C:</label>
    <input type="text" name="optionC" required>

    <label>Option D:</label>
    <input type="text" name="optionD" required>

    <label>Correct Option:</label>
    <select name="correctOption" required>
      <option value="">--Select--</option>
      <option value="A">Option A</option>
      <option value="B">Option B</option>
      <option value="C">Option C</option>
      <option value="D">Option D</option>
    </select>

    <input type="submit" value="Add Question">
  </form>

  <a href="<%=request.getContextPath()%>/admin/AdminDashboard.jsp" class="back-link">⬅ Back to Dashboard</a>
</main>

</body>
</html>
