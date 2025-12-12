<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- We import the List and Question classes to use them in our Java code --%>
<%@ page import="java.util.List, com.quiz.model.Question" %>

<%
    // Assuming you store the admin's info in the session
    // Adjust 'com.quiz.model.Admin' to your actual Admin class if different
    com.quiz.model.Admin admin = (com.quiz.model.Admin) session.getAttribute("admin");
    
    // Redirect to login if admin is not in session
    if (admin == null) {
        response.sendRedirect(request.getContextPath() + "/admin/AdminLogin.jsp");
        return; // Stop processing the page
    }
    
    // --- THIS IS THE SCRIPTLET LOGIC ---
    // 1. Get the attribute set by the servlet
    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Question List - Admin</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 0; background-color: #f4f4f4; }
        .header {
            background-color: #333;
            color: white;
            padding: 10px 20px;
            display: flex;
            align-items: center;
        }
        .header h2 { margin: 0; flex-grow: 1; }
        .menu-icon { font-size: 30px; cursor: pointer; margin-right: 20px; }
        .logout { color: white; text-decoration: none; padding: 8px 12px; background-color: #d9534f; border-radius: 4px; }
        
        .menu {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }
        .menu a {
            padding: 10px 15px;
            text-decoration: none;
            font-size: 18px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }
        .menu a:hover { color: #f1f1f1; }
        .menu .closebtn { position: absolute; top: 0; right: 25px; font-size: 36px; margin-left: 50px; }
        .menu-item { margin-bottom: 10px; }
        .sub-menu {
            display: none;
            padding-left: 20px;
            background-color: #222;
        }
        .sub-menu a { font-size: 16px; }

        .content {
            padding: 20px;
            margin-left: 20px; /* Adjust if menu is open */
            transition: margin-left 0.5s;
        }
        .welcome { font-size: 1.2em; }
        
        /* Table Styles */
        .question-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            background-color: #fff;
        }
        .question-table th, .question-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: left;
        }
        .question-table th {
            background-color: #f2f2f2;
            color: #333;
        }
        .question-table tr:nth-child(even) { background-color: #f9f9f9; }
        .question-table tr:hover { background-color: #f1f1f1; }

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
            <a href="<%=request.getContextPath()%>/admin/CreateQuiz.jsp">Create New Quiz</a>
            <a href="<%=request.getContextPath()%>/admin/QuizList.jsp">Quiz List</a>
        </div>
    </div>

    <div class="menu-item">
        <a href="javascript:void(0)" onclick="toggleSubMenu('questionSub')">Question Manager ▾</a>
        <div id="questionSub" class="sub-menu" style="display: block;"> <a href="<%=request.getContextPath()%>/admin/AddQuestion.jsp">Add New Question(s)</a>
            <a href="<%=request.getContextPath()%>/QuestionListServlet">Question List</a>
        </div>
    </div>

    <a href="<%=request.getContextPath()%>/admin/leaderboard.jsp">Leaderboard</a>
</div>

<div class="content">
    <p class="welcome">Welcome, <strong><%= admin.getUsername() %></strong></p>
    
    <h2>All Questions</h2>
    
    <table class="question-table">
        <thead>
            <tr>
                <th>Category</th>
                <th>Question Text</th>
                <th>Option A</th>
                <th>Option B</th>
                <th>Option C</th>
                <th>Option D</th>
                <th>Correct Option</th>
            </tr>
        </thead>
        <tbody>
            <%--
              Here is the replacement logic.
              We check if the list is not null and not empty, then loop through it.
            --%>
            <%
                if (questionList != null && !questionList.isEmpty()) {
                    // 2. Loop through the list
                    for (Question q : questionList) {
            %>
                        <tr>
                            <td><%= q.getCategory() %></td>
                            <td><%= q.getQuestionText() %></td>
                            <td><%= q.getOptionA() %></td>
                            <td><%= q.getOptionB() %></td>
                            <td><%= q.getOptionC() %></td>
                            <td><%= q.getOptionD() %></td>
                            <td><strong><%= q.getCorrectOption() %></strong></td>
                        </tr>
            <%
                    } // End of for loop
                } else {
                    // 4. Handle the case where the list is empty
            %>
                    <tr>
                        <td colspan="7" style="text-align: center;">No questions found.</td>
                    </tr>
            <%
                } // End of if/else block
            %>
        </tbody>
    </table>
    
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