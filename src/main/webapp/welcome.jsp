<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Objects" %>

<%
    HttpSession sessions = request.getSession();
    Object authenticated = sessions.getAttribute("authenticated");
    
    System.out.println("Authenticated: " + authenticated);
    
    if (authenticated == null || !(Boolean)authenticated) {
        response.sendRedirect("error.jsp");
    }
%>


<%-- Check the selected language from the request parameter --%>
<% String language = request.getParameter("lang");
   if (language == null) {
       // Default language is English
       language = "en";
   } else if (!language.equals("en") && !language.equals("zh")) {
       // Invalid language parameter, fallback to English
       language = "en";
   }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
</head>
<body>
    <h2><%= (language.equals("zh")) ? "欢迎" : "Welcome" %>, ${user.name}</h2>
    <p><%= (language.equals("zh")) ? "用户名" : "Username" %>: ${user.username}</p>
    <p><%= (language.equals("zh")) ? "角色" : "Role" %>: ${user.role}</p>
    
    <!-- The link will be hidden by default and shown based on the user's role -->
    <a id="restrictedLink" href="restricted.jsp" style="display: none;"><%= (language.equals("zh")) ? "受限页面" : "Restricted Page" %></a>
    
    <form action="LogoutServlet" method="post">
        <button type="submit"><%= (language.equals("zh")) ? "登出" : "Logout" %></button>
    </form>

    <!-- Language selection links -->
    <a href="?lang=en">English</a> | <a href="?lang=zh">中文</a>
    
    <script>
        window.onload = function() {
            var userRole = "${user.role}";
            var restrictedLink = document.getElementById("restrictedLink");

            // Check if the user's role is 'manager' to show the link
            if (userRole === "Manager") {
                restrictedLink.style.display = "inline"; // Show the link
            } else {
                restrictedLink.style.display = "none"; // Hide the link
            }
        };
    </script>
</body>
</html>