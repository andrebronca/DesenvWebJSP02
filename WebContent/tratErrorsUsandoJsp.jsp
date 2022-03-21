<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	errorPage="error_page.jsp"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tratando Erros com JSP</title>
</head>
<body>
<%
	String val1 = request.getParameter("val1");
	String val2 = request.getParameter("val2");
	int valor1 = Integer.getInteger(val1);
	int valor2 = Integer.getInteger(val2);
%>
</body>
</html>