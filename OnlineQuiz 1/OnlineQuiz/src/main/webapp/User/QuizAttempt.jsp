<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attempt Quiz</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background: radial-gradient(circle at top, #1e1e2f, #151521 70%);
    color: #fff;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
    overflow-x: hidden;
  }

  /* NAVBAR */
  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    backdrop-filter: blur(12px);
    background: rgba(255,255,255,0.05);
    padding: 16px 45px;
    border-bottom: 1px solid rgba(255,255,255,0.1);
  }

  .brand {
    font-size: 25px;
    font-weight: 700;
    color: #00eaff;
    display: flex;
    align-items: center;
    gap: 10px;
    letter-spacing: 1px;
    text-shadow: 0 0 10px rgba(0,234,255,0.6);
  }

  .nav-links {
    list-style: none;
    display: flex;
    gap: 35px;
  }

  .nav-links li a {
    text-decoration: none;
    font-size: 16px;
    color: #e0e0e0;
    font-weight: 500;
    padding: 10px 14px;
    border-radius: 8px;
    transition: 0.3s;
  }

  .nav-links li a:hover {
    background: rgba(0,234,255,0.15);
    color: #00eaff;
    transform: translateY(-2px);
  }

  /* HEADING */
  h2 {
    text-align: center;
    margin-top: 30px;
    font-size: 32px;
    font-weight: 700;
    letter-spacing: 1px;
    color: #00eaff;
    text-shadow: 0 0 14px rgba(0,234,255,0.5);
    animation: fadeIn 1s ease forwards;
  }

  /* MAIN CONTENT WRAPPER */
  .main-content {
    flex: 1;
    display: flex;
    justify-content: center;
    padding: 25px;
  }

  /* FORM GLASS CARD */
  form {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255,255,255,0.12);
    border-radius: 18px;
    padding: 40px;
    max-width: 900px;
    width: 90%;
    box-shadow: 0 0 25px rgba(0,234,255,0.15);
    animation: fadeInUp 0.8s ease;
  }

  /* QUESTION CARD */
  .question-card {
    background: rgba(255,255,255,0.05);
    padding: 25px;
    margin-bottom: 25px;
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.1);
    transition: 0.3s;
  }

  .question-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 14px rgba(0,234,255,0.2);
  }

  p.question {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 18px;
    color: #ffffff;
  }

  /* OPTIONS */
  .option {
    padding: 14px;
    margin: 10px 0;
    display: flex;
    align-items: center;
    gap: 12px;
    border: 1px solid rgba(255,255,255,0.15);
    background: rgba(255,255,255,0.07);
    border-radius: 10px;
    cursor: pointer;
    transition: 0.25s;
  }

  .option:hover {
    background: rgba(0,234,255,0.16);
    border-color: #00eaff;
    transform: scale(1.02);
  }

  .option input[type="radio"] {
    transform: scale(1.4);
  }

  /* SUBMIT BUTTON */
  input[type="submit"] {
    display: block;
    width: 60%;
    margin: 40px auto 0 auto;
    padding: 16px;
    font-size: 18px;
    font-weight: 700;
    border-radius: 12px;
    border: none;
    color: #fff;
    cursor: pointer;
    background: linear-gradient(135deg, #00c6ff, #0072ff);
    transition: 0.3s;
    box-shadow: 0 4px 12px rgba(0,112,255,0.4);
  }

  input[type="submit"]:hover {
    transform: translateY(-3px);
    box-shadow: 0 8px 25px rgba(0,112,255,0.6);
  }

  /* ANIMATIONS */
  @keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
  }

  @keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
  }

  /* MOBILE VIEW */
  @media (max-width: 700px) {
    .navbar {
      flex-direction: column;
      gap: 12px;
      text-align: center;
    }

    input[type="submit"] {
      width: 100%;
      padding: 14px;
    }
  }
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
  <div class="brand"> Quiz Portal</div>
  <ul class="nav-links">
    <li><a href="/OnlineQuiz/User/UserDashboard.jsp"> Dashboard</a></li>
    <li><a href="/OnlineQuiz/User/Leaderboard.jsp"> Leaderboard</a></li>
    <li><a href="/OnlineQuiz/User/User.jsp"> Logout</a></li>
  </ul>
</div>

<h2>Quiz Attempt</h2>

<%
    List<Map<String,Object>> questions = (List<Map<String,Object>>) session.getAttribute("questions");
    if (questions == null) { response.sendRedirect("User/UserDashboard.jsp"); return; }
%>

<div class="main-content">
<form action="<%=request.getContextPath() %>/submitQuiz" method="post">

<%
    int qNo = 1;
    for (Map<String,Object> q : questions) {
%>
    <div class="question-card">
        <p class="question"><%= qNo++ %>. <%= q.get("question_text") %></p>

        <label class="option">
            <input type="radio" name="q<%= q.get("id") %>" value="A"> <%= q.get("option_a") %>
        </label>

        <label class="option">
            <input type="radio" name="q<%= q.get("id") %>" value="B"> <%= q.get("option_b") %>
        </label>

        <label class="option">
            <input type="radio" name="q<%= q.get("id") %>" value="C"> <%= q.get("option_c") %>
        </label>

        <label class="option">
            <input type="radio" name="q<%= q.get("id") %>" value="D"> <%= q.get("option_d") %>
        </label>
    </div>
<% } %>

<input type="submit" value="Submit Quiz">

</form>
</div>

</body>
</html>
