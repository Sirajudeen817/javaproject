<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attempt Quiz</title>
<style>
form { 
    background-color: white; 
    padding: 1rem 2rem; 
    border-radius: 8px; 
    max-width: 600px; 
    margin: 2rem auto; 
    box-shadow: 0 2px 8px rgba(0,0,0,0.2);
}
input[type=submit] {
    background-color: #2c3e50;
    color: white;
    border: none;
    padding: 0.5rem 1rem;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover { background-color: #34495e; }
</style>
</head>
<body>
<jsp:include page="UserHeader.jsp" />

<%
    List<Map<String,Object>> questions = (List<Map<String,Object>>) session.getAttribute("questions");
    if (questions == null) { response.sendRedirect("User/UserDashboard.jsp"); return; }
%>

<h2 style="text-align:center;">Quiz Attempt</h2>
<form action="<%=request.getContextPath() %>/submitQuiz" method="post">
<%
    int qNo = 1;
    for (Map<String,Object> q : questions) {
%>
    <p><b><%= qNo++ %>. <%= q.get("question_text") %></b></p>
    <input type="radio" name="q<%= q.get("id") %>" value="A"> <%= q.get("option_a") %><br>
    <input type="radio" name="q<%= q.get("id") %>" value="B"> <%= q.get("option_b") %><br>
    <input type="radio" name="q<%= q.get("id") %>" value="C"> <%= q.get("option_c") %><br>
    <input type="radio" name="q<%= q.get("id") %>" value="D"> <%= q.get("option_d") %><br><br>
<% } %>
<input type="submit" value="Submit Quiz">
</form>
</body>
</html>
