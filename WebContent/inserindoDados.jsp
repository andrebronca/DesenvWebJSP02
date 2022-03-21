<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*"
    pageEncoding="ISO-8859-1"%>
<%
	String isbn = request.getParameter("isbn");
	String titulo = request.getParameter("titulo");
	String edicao = request.getParameter("edicao");
	String publicacao = request.getParameter("publicacao");
	String descricao = request.getParameter("descricao");
	
	Connection conn = null;
	PreparedStatement pst = null;
	
	try {
		Class.forName("org.postgresql.Driver");
		conn = DriverManager.getConnection("jdbc:postgresql://localhost:5434/bdjavajsp","postgres","postgres13");
		
		String sql = "insert into livros(isbn,titulo,edicao_num,ano_publicacao,descricao) values (?, ?, ?, ?, ?)";
		pst = conn.prepareStatement(sql);
		pst.setString(1, isbn);
		pst.setString(2, titulo);
		pst.setInt(3, Integer.valueOf(edicao));
		pst.setString(4, publicacao);
		pst.setString(5, descricao);
		pst.executeUpdate();
		pst.clearParameters();
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		if (pst != null) pst.close();
		if (conn != null) conn.close();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dados recebidos</title>
</head>
<body>
O ISBN <strong><%= isbn %></strong> foi inserido com sucesso!
</body>
</html>