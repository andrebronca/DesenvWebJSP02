<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Capturando Excecoes em JSTL</title>
</head>
<body>
<c:catch var="e">
	<jsp:include page="index2.jsp" />
	<jsp:setProperty property="sem" name="erro" value="Invalido"/>
</c:catch>

<c:if test="${e != null}">
	A exce&ccedil;&atilde;o &eacute;: <c:out value="${e}" />
</c:if>

<c:if test="${e == null}">
	Caso n&atilde;o tenha exce&ccedil;&atilde;o.
</c:if>
</body>
</html>