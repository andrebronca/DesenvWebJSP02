<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usuário autenticado</title>
</head>
<body>
Seja bem vindo <%= session.getAttribute("USER") %>
</body>
</html>