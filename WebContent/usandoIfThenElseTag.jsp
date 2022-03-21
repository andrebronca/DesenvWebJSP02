<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="tagsCondicionais" prefix="tc" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Tag Libs</title>
</head>
<body>
<tc:if>
	<tc:condicao>false</tc:condicao>
	<tc:then>O resultado &eacute; verdadeiro</tc:then>
	<tc:else>O resultado &eacute; falso</tc:else>
</tc:if>
</body>
</html>