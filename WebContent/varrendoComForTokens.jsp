<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>A action forTokens</title>
</head>
<body>
<form method="post" action="${pageContext.request.requestURI }" >
	<table>
		<tr>
			<th>Digite a sequencia de dados:</th>
		</tr>
		<tr>
			<td>
				<input type="text" width="20" maxwidth="20" name="palavras" size="50" values="${param.palavras}" />
			</td>
		</tr>
		<tr>
			<td><input type="submit" name="btn_enviar" value="Enviar" /></td>
		</tr>
	</table>
</form>
<c:if test="${pageContext.request.method == 'POST' }">
	<table border="1">
		<c:set var="i" value="1" />
		<c:forTokens items="${param.palavras}" var="palavra" delims=" -;,">
			<tr>
				<td><strong>Palavra <c:out value="${i}" /> </strong></td>
				<c:set var="i" value="${i+1}" />
				<td><c:out value="${palavra}" /></td>
			</tr>
		</c:forTokens>
	</table>
</c:if>
</body>
</html>