<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recebendo caracteres especiais</title>
</head>
<body>
<%
	String dados = request.getParameter("dados");
%>
<h2>Você enviou os seguintes dados:</h2>
<strong><%= dados %></strong> (UTF-8)
<br /><br />
A query string passada foi:<br />
<strong><%= request.getQueryString() %></strong> (ISO-8859-1)
</body>
</html>