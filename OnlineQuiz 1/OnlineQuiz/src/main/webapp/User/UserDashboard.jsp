<%@ page import="java.sql.*, com.quiz.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
  body {
    font-family: 'Poppins', sans-serif;
    margin: 0;
    padding: 0;
    background: linear-gradient(135deg, #1f1c2c, #928dab); /* elegant dark gradient */
    color: #fff;
    min-height: 100vh;
    display: flex;
    flex-direction: column;
  }

  /* Navbar */
  .navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background: linear-gradient(90deg, #0f2027, #203a43, #2c5364);
    padding: 14px 40px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  }

  .brand {
    font-size: 22px;
    font-weight: 700;
    color: #f1f1f1;
    display: flex;
    align-items: center;
    gap: 10px;
    letter-spacing: 1px;
  }

  .nav-links {
    list-style: none;
    display: flex;
    gap: 30px;
    margin: 0;
    padding: 0;
  }

  .nav-links li a {
    text-decoration: none;
    color: #e0e0e0;
    font-weight: 500;
    font-size: 16px;
    transition: color 0.3s ease, transform 0.2s ease;
  }

  .nav-links li a:hover {
    color: #00c6ff;
    transform: translateY(-2px);
  }

  @media (max-width: 600px) {
    .navbar {
      flex-direction: column;
      align-items: flex-start;
    }
    .nav-links {
      flex-direction: column;
      gap: 12px;
      margin-top: 10px;
    }
  }

  h2 {
    text-align: center;
    margin-bottom: 20px;
    font-size: 30px;
    font-weight: 600;
    color: #f9f9f9;
    text-shadow: 1px 1px 3px rgba(0,0,0,0.6);
  }

  /* Centered main content */
  .main-content {
    flex: 1;
    display: flex;
    justify-content: center; /* horizontal center */
    align-items: center;     /* vertical center */
    padding: 20px;
  }

  /* Table container */
  .table-container {
    width: 85%;
    max-width: 800px;
    background: #2a2a3d;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 8px 25px rgba(0,0,0,0.6);
    padding: 15px;
    animation: fadeIn 0.8s ease;
  }

  table {
    width: 100%;
    border-collapse: collapse;
  }

  table th, table td {
    padding: 14px 18px;
    text-align: left;
  }

  table th {
    background: linear-gradient(135deg, #3a6186, #89253e);
    color: #fff;
    font-size: 15px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
  }

  table tr:nth-child(even) {
    background-color: #34344a;
  }

  table tr:nth-child(odd) {
    background-color: #2a2a3d;
  }

  table tr:hover {
    background-color: #444466;
    transition: background 0.3s ease;
  }

  td {
    font-size: 14px;
    color: #e0e0e0;
  }

  /* Action button */
  .action-btn {
    display: inline-block;
    padding: 8px 16px;
    background: linear-gradient(135deg, #ff9966, #ff5e62);
    color: #fff;
    border-radius: 6px;
    text-decoration: none;
    font-weight: 500;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
  }

  .action-btn:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
  }

  /* Footer */
  footer {
    background: #141e30;
    text-align: center;
    padding: 15px;
    font-size: 13px;
    color: #aaa;
  }

  @keyframes fadeIn {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
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

<!-- Main centered content -->
<div class="main-content">
  <div class="table-container">
    <h2>Welcome, <%= session.getAttribute("username") %></h2>
    <table>
      <tr><th>ID</th><th>Quiz Name</th><th>Action</th></tr>
      <%
          try (Connection conn = DBConnector.getConnection()) {
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
      <% } } catch(Exception e){ %>
      <tr>
          <td colspan="3" style="text-align:center; color:red;">Error: <%= e.getMessage() %></td>
      </tr>
      <% } %>
    </table>
  </div>
</div>

<footer>
  © 2025 Quiz Portal. All rights reserved.
</footer>

</body>
</html>
