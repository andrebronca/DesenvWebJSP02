<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource dataSource="jdbc/bdjavajsp" var="bdj" /><!-- jndi -->
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usando instru&ccedil;&otilde;es SQL com JSTL</title>
</head>
<body>
<sql:query var="livros" dataSource="${bdj}">
select * from livros where excluido is null
</sql:query>

<table border="1">
	<tr>
		<th>ISBN</th>
		<th>T&iacute;tulo</th>
		<th>Atualizar</th>
		<th>Excluir</th>
	</tr>
	<c:forEach var="row" items="${livros.rows}">
		<tr>
			<td><c:out value="${row.isbn}" /></td>
			<td><c:out value="${row.titulo}" /></td>
			<td>
				<a href="fAtJSTL.jsp?isbn=<c:out value="${row.isbn}" />">Atualizar</a>
			</td>
			<td>
				<a href="excluirJSTL.jsp?isbn=<c:out value="${row.isbn}" />">Excluir</a>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>