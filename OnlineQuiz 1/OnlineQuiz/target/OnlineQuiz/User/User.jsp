<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>
<style>
form {
    background-color: white;
    padding: 1rem 2rem;
    border-radius: 8px;
    max-width: 400px;
    margin: 2rem auto;
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}

form input[type=text], form input[type=password] {
    width: 100%;
    padding: 0.5rem;
    margin: 0.3rem 0 1rem 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

form input[type=submit] {
    background-color: #2c3e50;
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    cursor: pointer;
    margin-right: 0.5rem;
}

form input[type=submit]:hover {
    background-color: #34495e;
}

.message {
    text-align: center;
    margin-top: 1rem;
    color: blue;
}
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />

<h2 style="text-align:center;">User Portal</h2>

<form action="<%= request.getContextPath() %>/user" method="post">
    <label>Username:</label>
    <input type="text" name="username" required>

    <label>Password:</label>
    <input type="password" name="password" required>

    <input type="submit" name="action" value="Register">
    <input type="submit" name="action" value="Login">
</form>

<% 
String message = request.getParameter("msg");
if(message != null) {
%>
    <div class="message"><%= message %></div>
<% } %>

</body>
</html>
