<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<style>
  body {
    margin: 0;
    font-family: "Segoe UI", Arial, sans-serif;
    background: #eef2f7;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }

  .login-box {
    background: #fff;
    padding: 35px;
    border-radius: 10px;
    box-shadow: 0 3px 12px rgba(0,0,0,0.15);
    width: 360px;
    text-align: center;
  }

  h2 {
    margin-bottom: 20px;
    color: #2c3e50;
  }

  img {
    width: 120px;
    border-radius: 50%;
    margin-bottom: 20px;
  }

  label {
    display: block;
    text-align: left;
    margin-top: 12px;
    font-weight: 500;
    color: #333;
  }

  input[type="text"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-top: 6px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
  }

  input:focus {
    border-color: #3498db;
    outline: none;
  }

  button {
    margin-top: 20px;
    width: 100%;
    padding: 10px;
    background: #3498db;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: background 0.3s ease;
  }

  button:hover { background: #2980b9; }

  .error {
    color: red;
    margin-top: 10px;
    font-weight: 500;
  }

  .footer {
    margin-top: 20px;
    font-size: 13px;
    color: #777;
  }
</style>
</head>
<body>

<div class="login-box">
  <h2>Admin Login</h2>
  <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Admin">

  <% 
    String error = (String) request.getAttribute("error");
    if (error != null) { 
  %>
    <div class="error"><%= error %></div>
  <% } %>

  <form action="<%=request.getContextPath()%>/Admin/AdminLoginServlet" method="post">
    <label for="username">Username</label>
    <input type="text" id="username" name="username" placeholder="Enter your username" required>

    <label for="password">Password</label>
    <input type="password" id="password" name="password" placeholder="Enter your password" required>

    <button type="submit">Login</button>
  </form>

  <div class="footer">© 2025 Online Quiz Portal</div>
</div>

</body>
</html>
