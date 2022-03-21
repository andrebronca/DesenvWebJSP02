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
	String usuario = request.getParameter("usuario");	//objeto implícito request
	String senha = request.getParameter("senha");
	
	if(usuario.equals("admin") && senha.equals("admin")){
		response.sendRedirect("usuario_val.html");
		//out.println("Usuário válido, seja bem vindo!");
	} else {
		response.sendRedirect("usuario_inv.html");	//objeto implícito response
		//out.println("Usuário inválido!"); //objet implícito out para escrever na tela
	}
	
%>
</body>
</html>