<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Recebendo dados via Post em JSP</title>
</head>
<body>
<%
	String usuario = request.getParameter("usuario");	//objeto impl�cito request
	String senha = request.getParameter("senha");
	
	if(usuario.equals("admin") && senha.equals("admin")){
		response.sendRedirect("usuario_val.html");
		//out.println("Usu�rio v�lido, seja bem vindo!");
	} else {
		response.sendRedirect("usuario_inv.html");	//objeto impl�cito response
		//out.println("Usu�rio inv�lido!"); //objet impl�cito out para escrever na tela
	}
	
%>
</body>
</html>