<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	isErrorPage="true"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Erro na execução da sua página JSP</title>
</head>
<body>
<h1>Erro na execução da sua página JSP</h1>
Um erro ocorreu no seu sistema.<br />
Verifique a seguir a possibilidade de executar novamente a página corrigindo suas falhas:<br />
<strong><%= exception.toString() %></strong>
<!-- Uma error page tem que ter no mínimo 489 bytes para ser exibida em tela aqui no IE do eclipse -->
</body>
</html>