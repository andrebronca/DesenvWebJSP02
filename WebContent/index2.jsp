<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trabalhando com JavaServer Pages</title>
</head>
<body>
<jsp:include page="topo.jsp">
	<jsp:param value="Conteúdo inserido no topo" name="texto"/>
</jsp:include>
<%
	String s = "<h2>Esse é um código JSP embebido no HTML</h2>";
	out.write(s);
%>
</body>
</html>
