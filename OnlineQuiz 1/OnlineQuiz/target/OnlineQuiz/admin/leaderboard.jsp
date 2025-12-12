<%@ page import="java.sql.*, com.quiz.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>
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

a.action-btn {
    display:inline-block;
    margin: 1rem;
    padding: 0.3rem 0.6rem;
    border: none;
    background-color: #2c3e50;
    color: white;
    border-radius: 4px;
    text-decoration: none;
}

a.action-btn:hover { background-color: #34495e; }
</style>
</head>
<body>


<h2 style="text-align:center;">Leaderboard</h2>
<table>
<tr><th>Rank</th><th>Username</th><th>Quiz</th><th>Score</th></tr>
<%
    try (Connection conn = DBConnection.getConnection()) {
        PreparedStatement ps = conn.prepareStatement(
            "SELECT u.username, q.name, r.score FROM result r " +
            "JOIN user u ON r.user_id=u.id JOIN quiz q ON r.quiz_id=q.id " +
            "ORDER BY r.score DESC"
        );
        ResultSet rs = ps.executeQuery();
        int rank = 1;
        while (rs.next()) {
%>
<tr>
    <td><%= rank++ %></td>
    <td><%= rs.getString("username") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getInt("score") %></td>
</tr>
<% } } catch(Exception e){ out.println("Error: "+e.getMessage()); } %>
</table>

<div style="text-align:center;">
    <a class="action-btn" href="UserDashboard.jsp">Back to Dashboard</a>
</div>
</body>
</html>
