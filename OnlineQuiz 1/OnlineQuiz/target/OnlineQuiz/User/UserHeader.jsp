<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="navbar">
    <div class="brand">Quiz Portal</div>
    <div class="burger" id="burger">&#9776;</div>
    <ul class="nav-links" id="nav-links">
        <li><a href="<%= request.getContextPath() %>/User/UserDashboard.jsp">Dashboard</a></li>
        <li><a href="<%= request.getContextPath() %>/User/Leaderboard.jsp">Leaderboard</a></li>
        <li><a href="<%= request.getContextPath() %>/LogoutServlet">Logout</a></li>
    </ul>
</div>

<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    background-color: #f4f4f4;
}

/* Navbar */
.navbar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    background-color: #2c3e50;
    color: white;
    padding: 0.5rem 1rem;
}

.navbar .brand {
    font-size: 1.5rem;
    font-weight: bold;
}

.nav-links {
    list-style: none;
    display: flex;
    margin: 0;
    padding: 0;
}

.nav-links li {
    margin-left: 1rem;
}

.nav-links li a {
    color: white;
    text-decoration: none;
    font-weight: bold;
}

.burger {
    display: none;
    font-size: 1.5rem;
    cursor: pointer;
}

/* Responsive */
@media (max-width: 768px) {
    .nav-links {
        display: none;
        flex-direction: column;
        background-color: #34495e;
        position: absolute;
        top: 60px;
        right: 0;
        width: 200px;
        padding: 1rem;
        border-radius: 0 0 0 8px;
    }
    .nav-links li {
        margin: 0.5rem 0;
    }
    .burger {
        display: block;
    }
    .nav-links.active {
        display: flex;
    }
}
</style>

<script>
const burger = document.getElementById("burger");
const navLinks = document.getElementById("nav-links");
burger.addEventListener("click", () => {
    navLinks.classList.toggle("active");
});
</script>
