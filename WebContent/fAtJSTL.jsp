<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<sql:setDataSource var="ds" dataSource="jdbc/bdjavajsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formul&aacute;rio de Atualiza&ccedil;&atilde;o</title>
</head>
<body>
<sql:query var="livros" dataSource="${ds}">
	select isbn, titulo, edicao_num, ano_publicacao, trim(descricao) as descricao from livros where isbn=?
	<sql:param value="${param.isbn}" />
</sql:query>
<c:set var="row" value="${livros.rows[0]}" />

<form action="atualizaJSTL.jsp" method="post">
	<table>
		<tr>
			<td>ISBN:</td>
			<td>
				<input type="text" name="isbn" value="<c:out value="${row.isbn}" />" readonly="readonly" />
			</td>
		</tr>
		<tr>
			<td>T&iacute;tulo:</td>
			<td>
				<input type="text" name="titulo" value="<c:out value="${row.titulo}" />" />
			</td>
		</tr>
		<tr>
			<td>Edi&ccedil;&atilde;o:</td>
			<td>
				<input type="text" name="edicao" value="<c:out value="${row.edicao_num}" />" />
			</td>
		</tr>
		<tr>
			<td>Publica&ccedil;&atilde;o:</td>
			<td>
				<input type="text" name="publicacao" value="<c:out value="${row.ano_publicacao}" />" />
			</td>
		</tr>
		<tr>
			<td>Descri&ccedil;&atilde;o:</td>
			<td>
				<textarea rows="5" cols="25" name="descricao" id="txtarea"><c:out value="${fn:trim(row.descricao)}" /></textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="btn_atualizar" value="Atualizar" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>