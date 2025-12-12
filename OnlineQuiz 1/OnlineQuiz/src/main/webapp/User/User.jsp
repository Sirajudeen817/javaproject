<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Portal</title>
<style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #0f2027;
        background-image: radial-gradient(circle at 20% 20%, #2c5364, transparent 40%),
                          radial-gradient(circle at 80% 30%, #203a43, transparent 40%),
                          radial-gradient(circle at 50% 80%, #0f2027, transparent 40%);
        background-size: cover;
        overflow: hidden;
    }

    .square { position: absolute; width: 40px; height: 40px; background: rgba(255,255,255,0.1); animation: float 10s infinite; }
    .square:nth-child(1) { top: 10%; left: 20%; animation-delay: 0s; }
    .square:nth-child(2) { top: 40%; left: 70%; animation-delay: 2s; }
    .square:nth-child(3) { top: 80%; left: 30%; animation-delay: 4s; }
    .square:nth-child(4) { top: 60%; left: 10%; animation-delay: 6s; }
    .square:nth-child(5) { top: 20%; left: 80%; animation-delay: 8s; }

    @keyframes float { 0% { transform: translateY(0) rotate(0deg); } 50% { transform: translateY(-50px) rotate(180deg); } 100% { transform: translateY(0) rotate(360deg); } }

    .container {
        width: 450px;
        max-width: 90vw;
        padding: 2rem;
        border-radius: 12px;
        background: rgba(255, 255, 255, 0.1);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
        text-align: center;
        color: #fff;
        z-index: 1;
    }

    h2 { margin-bottom: 1rem; font-size: 28px; font-weight: 600; letter-spacing: 1px; }

    /* Consistent responsive image */
    .portal-img {
        display: block;
        width: 140px;        /* fixed logical size */
        height: 140px;       /* match width for a perfect circle */
        max-width: 40%;      /* limit size relative to container on small screens */
        margin: 0 auto 1.2rem;
        border-radius: 50%;
        object-fit: cover;   /* ensure the image fills the circle without distortion */
        box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    }

    form label { display: block; text-align: left; margin: 0.5rem 0 0.2rem; font-weight: 500; }
    form input[type=text], form input[type=password] {
        width: 100%; padding: 0.7rem; margin-bottom: 1rem; border: none; border-radius: 8px; font-size: 1rem;
    }

    .action-buttons { display: flex; flex-direction: column; gap: 1rem; margin-top: 1rem; }
    .action-btn {
        background: linear-gradient(135deg, #ff6a00, #ee0979);
        color: white; border: none; padding: 1rem; border-radius: 8px; cursor: pointer;
        font-size: 1.1rem; font-weight: 600; transition: transform 0.2s ease, background 0.3s ease;
    }
    .action-btn:hover { transform: translateY(-3px); background: linear-gradient(135deg, #ee0979, #ff6a00); }

    .message { margin-top: 1rem; font-weight: 500; color: #ffd700; }

    /* Optional: tweak image size for very small screens */
    @media (max-width: 400px) {
        .portal-img { width: 110px; height: 110px; }
    }
</style>
</head>
<body>

<div class="square"></div>
<div class="square"></div>
<div class="square"></div>
<div class="square"></div>
<div class="square"></div>

<div class="container">
    <h2>User Portal</h2>
    <img src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="User Icon" class="portal-img">

    <form action="/OnlineQuiz/user" method="post">
        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <div class="action-buttons">
            <button type="submit" name="action" value="Register" class="action-btn">🔑 Register</button>
            <button type="submit" name="action" value="Login" class="action-btn">🚀 Login</button>
        </div>
    </form>

    <% 
    String message = request.getParameter("msg");
    if(message != null) {
    %>
        <div class="message"><%= message %></div>
    <% } %>
</div>

</body>
</html>
