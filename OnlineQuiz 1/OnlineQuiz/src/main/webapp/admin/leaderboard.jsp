<%@ page import="java.sql.*, com.quiz.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Leaderboard</title>
<style>
  body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f4f6f9;
    margin: 0;
  }

  h2 {
    text-align: center;
    margin: 30px 0;
    color: #2c3e50;
  }

  table {
    width: 90%;
    max-width: 700px;
    margin: auto;
    border-collapse: collapse;
    background: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0,0,0,0.1);
  }

  th, td {
    padding: 12px 15px;
    text-align: left;
  }

  th {
    background: #3498db;
    color: #fff;
    text-transform: uppercase;
    font-size: 13px;
  }

  tr:nth-child(even) { background: #f9f9f9; }
  tr:hover { background: #ecf0f1; }

  td { font-size: 14px; color: #333; }
</style>
</head>
<body>

<h2>Leaderboard</h2>

<table>
  <tr>
    <th>Rank</th>
    <th>Username</th>
    <th>Quiz</th>
    <th>Score</th>
  </tr>

<%
try (Connection conn = DBConnector.getConnection()) {
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
<%
    }
} catch(Exception e){
%>
  <tr>
    <td colspan="4" style="text-align:center; color:red;">Error: <%= e.getMessage() %></td>
  </tr>
<% } %>
</table>

</body>
</html>
