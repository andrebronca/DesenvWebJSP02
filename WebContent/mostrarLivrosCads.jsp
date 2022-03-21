<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*, meupacote.Livros"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalho com DAO e Model 2 (MVC)</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>ISBN - Atualizar</th>
			<th>T&iacute;tulo</th>
			<th>Publicado em</th>
			<th>Excluir Livro</th>
		</tr>
		<%
			List<Livros> livrosList = (List<Livros>) request.getAttribute("livrosList");
			Iterator iterator = livrosList.iterator();
			for(int i = 0; i < livrosList.size(); i++){
				if (iterator.hasNext()){
					Livros l = (Livros) iterator.next();
		%>
		<tr>
			<td>
				<a href="LivrariaServlet?cmd=atu&isbn=<%= l.getIsbn() %>"><%= l.getIsbn() %></a>
			</td>
			<td><%= l.getTitulo() %></td>
			<td><%= l.getPublicacao() %></td>
			<td><a href="LivrariaServlet?cmd=exc&isbn=<%= l.getIsbn() %>">Excluir</a></td>
		</tr>
		<%
				} //end if
			} //enf for
		%>
	</table>
	<br />
	<a href="formInserindoDados.html">Adicionar um novo livro</a>
	<br />
	<a href="index3.jsp">P&aacute;gina Principal</a>
</body>
</html>