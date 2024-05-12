<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title><%= ResourceBundle.getBundle("code").getString("principal") %></title>
    <link rel="stylesheet" type="text/css" href="/resources/css/estilo.css">
    <link rel="icon" href="/icon.ico" type="image/x-icon">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/navbar.jsp"%>

	    <%-- Recupera o nome da URL --%>
    <% String nombre = request.getParameter("nombre"); %>
    
    <h1><%= ResourceBundle.getBundle("code").getString("principal.hola") %> <%= nombre %>!</h1>
  
    <script>

    </script>
    
    <%@ include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>
