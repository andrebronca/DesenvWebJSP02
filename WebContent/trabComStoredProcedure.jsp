<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Storage Procedure</title>
</head>
<body>
<form action="trabComStoredProcedure.jsp">
ISBN: <input type="text" name="isbn" />
<input type="submit" name="btn_pesquisar" value="Pesquisar" />
</form>
<%
	String isbn = request.getParameter("isbn");
	Connection conn = null;
	ResultSet rs = null;
	CallableStatement cs = null;
	
	if (isbn != null){
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e){
			out.println("ClassNotFoundException: ");
			out.println(e.getMessage());
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5434/bdjavajsp","postgres","postgres13");
			cs = conn.prepareCall("select * from sp_getlivro(?)");
			cs.setString(1, isbn);
			rs = cs.executeQuery();
			if (rs.next()){
				%>
				<table>
					<tr><th>ISBN</th><th>T&iacute;tulo</th></tr>
				<% 
				do {
				%>
					<tr>
						<td><%= rs.getString(1) %></td>
						<td><%= rs.getString(2) %></td>
					</tr>
				<% 
				} while (rs.next());
				%>
				</table>
				<%
				
			} else {
				out.print("Livro n&atilde;o encontrado!");
			}
		} catch (Exception e){
			e.printStackTrace();
		} finally {
			if (conn != null) conn.close();
			if (rs != null) rs.close();
			if (cs != null) cs.close();
		}
	}
%>
<!-- criada a seguinte procedure para testar nesse jsp
create or replace function sp_getlivro(p_isbn LIVROS.ISBN%TYPE)
RETURNS SETOF LIVROS
AS $$
BEGIN
  RETURN QUERY SELECT * FROM LIVROS WHERE ISBN = P_ISBN;
END;
$$ LANGUAGE plpgsql;
 -->
</body>
</html>