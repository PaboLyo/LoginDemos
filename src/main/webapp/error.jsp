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
    <title><%= (language.equals("zh")) ? "错误" : "Error" %></title>
</head>
<body>
    <h2><%= (language.equals("zh")) ? "错误" : "Error" %></h2>
    <p><%= (language.equals("zh")) ? "抱歉，您无权访问此页面或发生错误。" : "Sorry, you don't have permission to access this page or an error occurred." %></p>
    <p><%= (language.equals("zh")) ? "请使用适当的凭据进行" : "Please " %> <a href="login.jsp"><%= (language.equals("zh")) ? "登录" : "login" %></a> <%= (language.equals("zh")) ? "或联系管理员寻求帮助。" : "with appropriate credentials or contact the administrator for assistance." %></p>

    <!-- Language selection links -->
    <a href="?lang=en">English</a> | <a href="?lang=zh">中文</a>
</body>
</html>