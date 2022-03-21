<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:choose>
	<c:when test="${param.locale eq 'en_US'}">
		<fmt:setLocale value="en_US"/>
	</c:when>
	<c:otherwise>
		<fmt:setLocale value="pt_BR"/>
	</c:otherwise>
</c:choose>
<fmt:setBundle basename="meupacote.rotulos" />

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><fmt:message key="titulo" /></title>
</head>
<body>
<a href="?locale=en_US"><fmt:message key="ingles" /></a>
<a href="?locale=pt_BR"><fmt:message key="portugues" /></a>
<br />
<form action="">
	<fmt:message key="nome" />: <input type="text" name="nome" /><br />
	<fmt:message key="email" />: <input type="text" name="email" /><br />
	<input type="submit" value="<fmt:message key="enviar" />" name="btn_enviar" />
</form>
</body>
</html>