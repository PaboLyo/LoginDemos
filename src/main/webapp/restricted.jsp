<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.Objects" %>

<%-- Checks if the user is authenticated --%>
<%
    HttpSession sessions = request.getSession();
    Object authenticated = sessions.getAttribute("authenticated");
    
    System.out.println("Authenticated: " + authenticated);
    
    if (authenticated == null || !(Boolean)authenticated) {
        response.sendRedirect("error.jsp");
    }
%>

<%-- Select the language from the request parameter --%>
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
    <meta charset="UTF-8">
    <title><%= (language.equals("zh")) ? "受限页面" : "Restricted Page" %></title>
</head>
<body>
    <h2><%= (language.equals("zh")) ? "受限页面" : "Restricted Page" %></h2>
    <!-- Content accessible only to manager role -->
    <form action="LogoutServlet" method="post">
        <button type="submit"><%= (language.equals("zh")) ? "登出" : "Logout" %></button>
    </form>

    <!-- Language selection links -->
    <a href="?lang=en">English</a> | <a href="?lang=zh">中文</a>
</body>
</html>