<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*, java.util.Properties"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Banco de Dados usando JDBC e JSP</title>
</head>
<body>
<table>
	<thead>
		<tr>
			<th>ISBN</th>
			<th>T&iacute;tulo</th>
			<th>Excluir</th>
			<th>Atualizar</th>
		</tr>
	</thead>
	<tbody>
	<%
		String url = "jdbc:postgresql://localhost:5434/bdjavajsp";
		Properties prop = new Properties();
		prop.setProperty("user", "postgres");
		prop.setProperty("password", "postgres13");
		
		Connection conn = null;	//conecta no banco de dados
		Statement st = null;	//executa sql no bd
		ResultSet rs = null;	//resultado de uma consulta ao bd
		
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e){
			out.println("ClassNotFoundException: ");
			out.println(e.getMessage());
		}
		
		try {
			conn = DriverManager.getConnection(url, prop);
			st = conn.createStatement();
			rs = st.executeQuery("select isbn, titulo from livros where excluido is null ");
			while(rs.next()) {
				%>
				<tr>
					<td><%= rs.getString("isbn") %></td>
					<td><%= rs.getString("titulo") %></td>
					<td><a href="excluindoBD.jsp?isbn=<%= rs.getString("isbn") %>">Excluir</a></td>
					<td><a href="atBD.jsp?isbn=<%= rs.getString("isbn") %>">Atualizar</a></td>
				</tr>
				<%
			}//while
		} catch(SQLException e) {
			e.getStackTrace();
		} finally {
			if (rs != null) rs.close();
			if (st != null) st.close();
			if (conn != null) conn.close();
		}
	%>
	</tbody>
</table>
<!-- 
create table if not exists livros (
isbn varchar(255) unique not null,
titulo varchar(255) not null,
primary key (isbn)
);

insert into livros values('978-85-7522-370-3','Java guia do programador atualizado para java 7'),
('978-85-61893-36-1','Programação de computadores em Java segunda edição'),
('978-85-430-0479-2','Java como programar decima edição');

select * from livros;
 -->
</body>
</html>