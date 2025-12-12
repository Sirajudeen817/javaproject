<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
<style>
h2 { text-align:center; color:#2c3e50; }
table {
    width: 80%;
    margin: 2rem auto;
    border-collapse: collapse;
    background-color: white;
}

table th, table td {
    padding: 0.5rem;
    border: 1px solid #ccc;
}

table th {
    background-color: #2c3e50;
    color: white;
}
.correct { background-color: #b0f0b0; }
.wrong { background-color: #f0b0b0; }

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
<jsp:include page="UserHeader.jsp" />

<h2>Your Score: <%= request.getAttribute("score") %></h2>

<table>
<tr><th>Question</th><th>Your Answer</th><th>Correct Answer</th></tr>
<%
    List<Map<String,String>> review = (List<Map<String,String>>) request.getAttribute("review");
    for (Map<String,String> r : review) {
        String chosen = r.get("chosen");
        String correct = r.get("correct");
%>
<tr class="<%= chosen.equalsIgnoreCase(correct) ? "correct" : "wrong" %>">
    <td><%= r.get("question") %></td>
    <td><%= chosen %></td>
    <td><%= correct %></td>
</tr>
<% } %>
</table>

<div style="text-align:center;">
    <a class="action-btn" href="User/Leaderboard.jsp">View Leaderboard</a>
    <a class="action-btn" href="User/UserDashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
