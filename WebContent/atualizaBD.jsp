<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dados atualizados</title>
</head>
<body>
<%
	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String edicao = request.getParameter("edicao");
	String publicacao = request.getParameter("publicacao");
	String descricao = request.getParameter("descricao");
	
	if (isbn != null){
		Connection conn = null;
		PreparedStatement pst = null;
			
		try {
			Class.forName("org.postgresql.Driver");
			conn = DriverManager.getConnection("jdbc:postgresql://localhost:5434/bdjavajsp","postgres","postgres13");
			String sql = "update livros set titulo=?, edicao_num=?, ano_publicacao=?, descricao=? where isbn=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, titulo);
			pst.setInt(2, Integer.valueOf(edicao));
			pst.setInt(3, Integer.valueOf(publicacao));
			pst.setString(4, descricao);
			pst.setString(5, isbn);
			pst.executeUpdate();
			pst.clearParameters();
			out.println("Os dados do ISBN: "+ isbn +" foram atualizados!");
		} catch (ClassNotFoundException e){
			e.printStackTrace();
			out.println("Erro atualizando:1 "+ e.getMessage());	
		} catch (SQLException e){
			e.printStackTrace();
			out.println("Erro atualizando:2 "+ e.getMessage());
		} finally {
			if (pst != null) pst.close();
			if (conn != null) conn.close();
		}
	} else {
		out.println("ISBN não existe!");
	}
%>
</body>
</html>