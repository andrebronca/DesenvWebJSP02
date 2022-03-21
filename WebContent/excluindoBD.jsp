<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Exclusão de livro</title>
</head>
<body>
<%
	String isbn=request.getParameter("isbn");
	if(isbn != null){
		Connection conn = null;
		Statement st = null;
		
		try{
			Class.forName("org.postgresql.Driver");
		} catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		try {
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5434/bdjavajsp","postgres","postgres13");
			st = conn.createStatement();
			//st.execute("delete from livros where isbn='"+ isbn +"'");
			st.execute("update livros set excluido = '*' where isbn='"+ isbn +"'");
			out.println("O livro de ISBN <strong>"+ isbn +"</strong> foi excluído com sucesso!");
		} catch (Exception e){
			e.printStackTrace();
			out.println("Problema ao excluir!");
		} finally {
			if (st != null) st.close();
			if (conn != null) conn.close();
		}
	}
%>
</body>
</html>