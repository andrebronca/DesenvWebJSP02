<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource var="ds" dataSource="jdbc/bdjavajsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Excluindo com JSTL</title>
</head>
<body>
<sql:transaction dataSource="${ds}" isolation="read_committed">
	<sql:update var="rs">
		update livros set excluido = '*' where isbn=?
		<sql:param value="${param.isbn}" />
	</sql:update>
</sql:transaction>

<c:if test="${rs > 0}">
	<h3>O ISBN ${param.isbn} foi exclu&iacute;do com sucesso!</h3>
	<a href="usandoSQLComJSTL.jsp">Voltar a p&aacute;gina principal</a>
</c:if>
</body>
</html>