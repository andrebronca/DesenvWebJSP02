<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com EL</title>
</head>
<body>
<h3>${header['user-agent'] }</h3>
<strong>${param['nome']}</strong>
<form action="usandoELparaRecVal.jsp" method="post">
	Nome: <input type="text" name="nome" /><br />
	<input type="submit" name="btn_enviar" value="Enviar" />
</form>
<hr />
${requestScope }
</body>
</html>