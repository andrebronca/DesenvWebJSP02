<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Enviando caracteres especiais usando JSP</title>
</head>
<body>
	<%
	String queryString = URLEncoder.encode("Cidadão&João", "UTF-8");
	%>
	<a href="recCaractEspeciais.jsp?dados=<%=queryString%>">Envia dados Especiais</a>
</body>
</html>