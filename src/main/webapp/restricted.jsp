<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!DOCTYPE html>
<html>
<head>
    <title>Restricted Page</title>
</head>
<body>
    <h2>Restricted Page</h2>
    <!-- Content accessible only to manager role -->
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>