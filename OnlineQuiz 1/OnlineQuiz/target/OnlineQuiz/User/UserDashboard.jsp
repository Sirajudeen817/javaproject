<%@ page import="java.sql.* , com.quiz.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
<style>
table {
    width: 80%;
    margin: 2rem auto;
    border-collapse: collapse;
    background-color: white;
}

table th, table td {
    padding: 0.5rem;
    border: 1px solid #ccc;
    text-align: left;
}

table th {
    background-color: #2c3e50;
    color: white;
}

.action-btn {
    padding: 0.3rem 0.6rem;
    border: none;
    background-color: #2c3e50;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    text-decoration: none;
}

.action-btn:hover {
    background-color: #34495e;
}
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />
<h2 style="text-align:center;">Welcome, <%= session.getAttribute("username") %></h2>

<table>
<tr><th>ID</th><th>Quiz Name</th><th>Action</th></tr>
<%
    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement("SELECT * FROM quiz");
        ResultSet rs = ps.executeQuery();
        while(rs.next()) {
%>
<tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td>
        <a class="action-btn" href="<%=request.getContextPath() %>/attemptQuiz?quizId=<%= rs.getInt("id") %>">Attempt Quiz</a>
    </td>
</tr>
<% } } catch(Exception e){ out.println("Error: "+e.getMessage()); } %>
</table>

<br>
</body>
</html>
