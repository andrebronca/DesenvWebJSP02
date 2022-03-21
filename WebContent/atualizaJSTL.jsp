<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<sql:setDataSource var="ds" dataSource="jdbc/bdjavajsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dados atualizados</title>
</head>
<body>
<fmt:parseNumber var="ed" type="NUMBER" value="${param.edicao}" />
<fmt:parseNumber var="ano" type="NUMBER" value="${param.publicacao}" />

<sql:update var="rs" dataSource="${ds}">
	update livros set titulo=?, edicao_num=?, ano_publicacao=?, descricao=? where isbn=?
	<sql:param value="${param.titulo}" />
	<sql:param value="${ed}" />
	<sql:param value="${ano}" />
	<sql:param value="${param.descricao}" />
	<sql:param value="${param.isbn}" />
</sql:update>

<c:if test="${rs > 0}">
	<h3>Os dados foram atualizados com sucesso!</h3>
	<a href="usandoSQLComJSTL.jsp">Voltar a p&aacute;gina principal</a>
</c:if>
</body>
</html>