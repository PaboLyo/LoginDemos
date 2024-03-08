<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
    <title><%= (language.equals("zh")) ? "登录" : "Login" %></title>
    <!-- Include any CSS files here -->
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <h2><%= (language.equals("zh")) ? "登录" : "Login" %></h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username"><%= (language.equals("zh")) ? "用户名" : "Username" %> :</label>
                <input type="text" id="username" name="username" required>
            </div>
            <div class="form-group">
                <label for="password"><%= (language.equals("zh")) ? "密码" : "Password" %> :</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit"><%= (language.equals("zh")) ? "登录" : "Login" %></button>
            </div>
        </form>
        <%-- Display error message if login fails --%>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>
    </div>

    <!-- Language selection links -->
    <a href="?lang=en">English</a> | <a href="?lang=zh">中文</a>
</body>
</html>