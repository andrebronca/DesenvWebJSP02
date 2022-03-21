<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	info="Estudo de JSP - André R.B." 
	import="java.util.*"
	import="java.text.SimpleDateFormat" 
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usando a diretiva page</title>
</head>
<body>
	Esse é um exemplo da utilização da diretiva
	<strong>page</strong>
	<br />
	<%
	Date hoje = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	%>
	A data de hoje é: <strong><%= sdf.format(hoje) %></strong>
</body>
</html>