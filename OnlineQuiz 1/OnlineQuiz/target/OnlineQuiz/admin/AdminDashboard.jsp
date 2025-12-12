<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.quiz.model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: "Segoe UI", sans-serif;
            background-color: #f9f9f9;
        }

        .header {
            background-color: #004aad;
            color: white;
            padding: 15px 20px;
            display: flex;
            align-items: center;
        }

        .menu-icon {
            font-size: 26px;
            cursor: pointer;
            margin-right: 15px;
        }

        .menu {
            height: calc(100vh - 55px);
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #333;
            overflow-x: hidden;
            transition: 0.3s;
            padding-top: 60px;
        }

        .menu a {
            padding: 10px 25px;
            text-decoration: none;
            font-size: 18px;
            color: white;
            display: block;
            transition: 0.2s;
        }

        .menu a:hover {
            background-color: #575757;
        }

        .content {
		    height: 60px; 
		    display: flex;
		    justify-content: center; 
		    align-items: center;     
		    text-align: center;
		}

        .menu .closebtn {
            position: absolute;
            top: 10px;
            right: 25px;
            font-size: 30px;
            color: white;
        }

        .welcome {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .logout {
            position: absolute;
            right: 20px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .logout:hover {
            text-decoration: underline;
        }
        .sub-menu {
    display: none; /* hidden by default */padding-left: 20px;
    background-color: #444;
}
.sub-menu a {
    font-size: 16px;
    color: #ddd;
}
.sub-menu a:hover {
    background-color: #575757;
}
    </style>
</head>
<body>

<div class="header">
    <span class="menu-icon" onclick="openMenu()">☰</span>
    <h2>Admin Dashboard</h2>
    <a class="logout" href="<%=request.getContextPath()%>/LogoutServlet">Logout</a>
</div>

<div id="sideMenu" class="menu">
    <a href="javascript:void(0)" class="closebtn" onclick="closeMenu()">&times;</a>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('quizSub')">Quiz Manager ▾</a>
        <div id="quizSub" class="sub-menu">
        	<a href="<%=request.getContextPath()%>/admin/quizList.jsp">Quiz List</a>">
			<a href="<%=request.getContextPath()%>/admin/createQuiz.jsp">Create Quiz</a>
        </div>
    </div>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">Question Manager ▾</a>
        <div id="questionSub" class="sub-menu">
            <a href="AddQuestion.jsp">Add New Question(s)</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
        </div>
    </div>

    <a href="leaderboard.jsp">Leaderboard</a></div>

<div class="content">
    <p class="welcome">Welcome, <strong><%= admin.getUsername() %></strong> </p>
</div>

<script>
function toggleSubMenu(id) {
    var subMenu = document.getElementById(id);
    if (subMenu.style.display === "block") {
        subMenu.style.display = "none";
    } else {
        subMenu.style.display = "block";
    }
}
    function openMenu() {
        document.getElementById("sideMenu").style.width = "250px";
    }

    function closeMenu() {
        document.getElementById("sideMenu").style.width = "0";
    }
</script>

</body>
</html>