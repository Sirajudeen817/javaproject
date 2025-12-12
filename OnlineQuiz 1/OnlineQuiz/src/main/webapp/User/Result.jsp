<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quiz Result</title>
<style>
  body {
    font-family: 'Segoe UI', sans-serif;
    background-color: #f2f5fa;
    margin: 0;
    padding: 0;
  }

  h2 {
    text-align: center;
    margin-top: 40px;
    color: #004aad;
  }

  .score-banner {
    max-width: 400px;
    margin: 20px auto;
    padding: 15px 20px;
    background-color: #004aad;
    color: white;
    text-align: center;
    font-size: 20px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  }

  table {
    width: 90%;
    max-width: 800px;
    margin: 20px auto;
    border-collapse: collapse;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
  }

  table th, table td {
    padding: 10px 12px;
    border-bottom: 1px solid #ddd;
    text-align: left;
  }

  table th {
    background-color: #004aad;
    color: white;
    font-weight: 600;
  }

  table tr.correct { background-color: #b0f0b0; }
  table tr.wrong { background-color: #f0b0b0; }

  a.action-btn {
    display: inline-block;
    margin: 10px 5px;
    padding: 10px 20px;
    background-color: #004aad;
    color: white;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 600;
    transition: 0.2s;
  }

  a.action-btn:hover {
    background-color: #003580;
  }

  @media (max-width: 600px) {
    table th, table td {
      font-size: 14px;
      padding: 8px;
    }

    a.action-btn {
      display: block;
      width: 80%;
      margin: 10px auto;
      text-align: center;
    }
  }
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />

<div class="score-banner">
    Your Score: <%= request.getAttribute("score") %>
</div>

<table>
<tr>
    <th>Question</th>
    <th>Your Answer</th>
    <th>Correct Answer</th>
</tr>
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

<div style="text-align:center; margin-bottom: 30px;">
    <a class="action-btn" href="User/Leaderboard.jsp">View Leaderboard</a>
    <a class="action-btn" href="User/UserDashboard.jsp">Back to Dashboard</a>
</div>

</body>
</html>
