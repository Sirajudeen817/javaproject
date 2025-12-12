<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Online Quiz Portal</title>
<style>
  body {
    margin: 0;
    font-family: "Poppins", Arial, sans-serif;
    background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #fff;
  }

  .container {
    text-align: center;
    background: rgba(255, 255, 255, 0.1);
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 8px 20px rgba(0,0,0,0.3);
    backdrop-filter: blur(8px);
  }

  h1 {
    font-size: 32px;
    margin-bottom: 40px;
    color: #f1f1f1;
    letter-spacing: 1px;
  }

  .card-container {
    display: flex;
    justify-content: center;
    gap: 50px;
    margin-bottom: 30px;
  }

  .card {
    background: #fff;
    padding: 30px 25px;
    width: 200px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.2);
    text-align: center;
    cursor: pointer;
    transition: all 0.3s ease;
  }

  .card:hover {
    transform: scale(1.05);
    box-shadow: 0 6px 16px rgba(0,0,0,0.3);
  }

  .card h2 {
    font-size: 20px;
    margin-bottom: 20px;
    color: #2c3e50;
  }

  .card button {
    background: linear-gradient(135deg, #3498db, #2ecc71);
    color: #fff;
    border: none;
    padding: 10px 16px;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
    transition: background 0.3s ease;
  }

  .card button:hover {
    background: linear-gradient(135deg, #2ecc71, #3498db);
  }

  .footer {
    font-size: 13px;
    color: #ddd;
    margin-top: 20px;
  }
</style>
</head>
<body>

<div class="container">
  <h1>🚀 Welcome to Online Quiz Portal</h1>

  <div class="card-container">
    <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/admin/AdminLogin.jsp'">
      <h2>Admin</h2>
      <button>Go to Admin</button>
    </div>

    <div class="card" onclick="window.location.href='<%=request.getContextPath()%>/User/User.jsp'">
      <h2>User</h2>
      <button>Go to User</button>
    </div>
  </div>

  <div class="footer">© 2025 Online Quiz Portal</div>
</div>

</body>
</html>
