<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Desenvolvendo com JSTL e EL</title>
</head>
<body>
<c:set var="email" value="bronca.andre@gmail.com" />
Seu e-mail &eacute;: <strong><c:out value="${email}" /></strong>
<hr /><!-- era pra ser outro arquivo, mas resolvi deixar junto -->
<c:if test="${param.nome != null}">
	<c:set var="nome" value="${param.nome}" />
	Seu nome &eacute;: <c:out value="${nome}" /><br />
</c:if>

<c:remove var="nome"/>

<c:choose>
	<c:when test="${nome != null}">
		A vari&aacute;vel ${'${'}nome} cont&eacute;m o valor ${nome}<br />
	</c:when>
	<c:otherwise>
		A vari&aacute;vel ${'${'}nome} foi removida.
	</c:otherwise>
</c:choose>
<form action="${pageContext.request.requestURI}" method="post">
	Nome: <input type="text" name="nome" /><br />
	<input type="submit" name="btn_enviar" value="enviar" />
</form>
<hr />
<c:set var="str" value="A,B,C,D,E" />
<strong>A vari&aacute;vel ${'${'}str} : </strong><br />
<c:out value="${str}" /><br />
<strong>Usando forEach em uma cole&ccedil;&atilde;o:</strong><br />
<c:forEach var="letras" items="${str}">
	<c:out value="${letras}" /><br />
</c:forEach><br />
<strong>Usando forEach de 1 at&eacute; 10:</strong><br />
<c:forEach var="i" begin="1" end="10">
	<c:out value="${i}" /><br />
</c:forEach><br />
<strong>Usando forEach para n&uacute;meros pares de 2 at&eacute; 10:</strong><br />
<c:forEach var="i" begin="2" end="10" step="2">
	<c:out value="${i}" /><br />
</c:forEach>
</body>
</html>