<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logar no Sistema</title>
</head>
<body>
<form action="logar" method="post"> <!-- action aponta para uma anotation em um servlet Logar.java -->
	Usuário: <input type="text" name="usuario" /><br />
	Senha: <input type="password" name="senha" /><br />
	<input type="submit" name="btn_logar" value="Logar" />
</form>
<%
	String msg = (String) request.getAttribute("msg");
	if (msg != null){
		out.println(msg);	//exibe a msg caso exista
	}
%>
</body>
</html>