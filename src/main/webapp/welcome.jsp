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
    <title>Welcome</title>
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
</head>
<body>
    <h2>Welcome, ${user.name}</h2>
    <p>Username: ${user.username}</p>
    <p>Role: ${user.role}</p>
    
	<!-- The link will be hidden by default and shown based on the user's role -->
    <a id="restrictedLink" href="restricted.jsp" style="display: none;">Restricted Page</a>
    
    
    <form action="LogoutServlet" method="post">
        <button type="submit">Logout</button>
    </form>
</body>
</html>