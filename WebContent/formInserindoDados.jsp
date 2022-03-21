<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserindo dados via JDBC com JSP</title>
</head>
<body>
<form action="inserindoDados.jsp" method="post">
	<table>
		<tr>
			<td>ISBN:</td>
			<td><input type="text" name="isbn" /></td>
		</tr>
		<tr>
			<td>T&iacute;tulo:</td>
			<td><input type="text" name="titulo" /></td>
		</tr>
		<tr>
			<td>Edição:</td>
			<td><input type="text" name="edicao" /></td>
		</tr>
		<tr>
			<td>Publicação:</td>
			<td><input type="text" name="publicacao" /></td>
		</tr>
		<tr>
			<td>Descrição:</td>
			<td><textarea name="descricao" rows="5" cols="25"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" name="btn_cadastrar" value="Cadastrar" />
			</td>
		</tr>
	</table>
</form>
</body>
</html>