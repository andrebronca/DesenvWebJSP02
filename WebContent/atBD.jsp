<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*, java.text.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Atualizando dados via JDBC com JSP</title>
</head>
<body>
<%
	String isbn = request.getParameter("isbn").trim();
	if (isbn != null){
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		//SimpleDateFormat sdf = null;
		
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
			out.println("class.forName: "+ e.getMessage());
		}
			
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5434/bdjavajsp","postgres","postgres13");
			pst = conn.prepareStatement("select * from livros where isbn=? and excluido is null");
			pst.setString(1, isbn);
			rs = pst.executeQuery();
			pst.clearParameters();
			//sdf = new SimpleDateFormat("yyyy");
			if (rs.next()){
%>
<form action="atualizaBD.jsp" method="post">
<table>
	<tr>
		<td>ISBN:</td>
		<td><input type="text" name="isbn" value="<%= rs.getString("isbn") %>" readonly="readonly" /></td>
	</tr>
	<tr>
		<td>T&iacute;tulo:</td>
		<td><input type="text" name="titulo" value="<%= rs.getString("titulo") %>" size="80" /></td>
	</tr>
	<tr>
		<td>Edi&ccedil;&atilde;o:</td>
		<td><input type="text" name="edicao" value="<%= rs.getString("edicao_num") %>" /></td>
	</tr>
	<tr>
		<td>Publica&ccedil;&atilde;o:</td>
		<td><input type="text" name="publicacao" value="<%= rs.getString("ano_publicacao") %>" /></td>
	</tr>
	<tr>
		<td>Descri&ccedil;&atilde;o</td>
		<td><textarea rows="5" cols="40" name="descricao"><%= rs.getString("descricao") %></textarea></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" name="btn_atualizar" value="Atualizar" />
		</td>
	</tr>
</table>
</form>				
<%
			} else {
				out.println("Livro n&atilde;o encontrado!"); //não faz sentido isso, pq já vem de uma lista exibida, mas ok
				//só faria sentido se for um campo de busca onde o usuário não viu o livro na lista e está pesquisando
			}
		} catch (Exception e){
			e.printStackTrace();
			out.println("Exception: "+ e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pst != null) pst.close();
			if (conn != null) conn.close();
		}
	}
%>
</body>
</html>