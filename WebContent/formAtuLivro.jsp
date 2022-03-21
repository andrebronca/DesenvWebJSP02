<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com MVC</title>
</head>
<body>
	<jsp:useBean id="livro" scope="session" class="meupacote.Livros" />
	<form action="LivrariaServlet?cmd=atualizar" method="post">
		<table>
			<tr>
				<td>ISBN:</td>
				<td><input type="text" name="isbn" value="${livro.isbn}" readonly="readonly" /></td>
			</tr>
			<tr>
				<td>T&iacute;tulo:</td>
				<td><input type="text" name="titulo" value="${livro.titulo}" /></td>
			</tr>
			<tr>
				<td>Edi&ccedil;&atilde;o:</td>
				<td><input type="text" name="edicao" value="${livro.edicao}" /></td>
			</tr>
			<tr>
				<td>Publica&ccedil;&atilde;o:</td>
				<td><input type="text" name="publicacao" value="${livro.publicacao}" /></td>
			</tr>
			<tr>
				<td>Descri&ccedil;&atilde;o:</td>
				<td>
					<textarea rows="5" cols="25">${livro.descricao}</textarea>
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