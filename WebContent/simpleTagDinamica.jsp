<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="tagSimpleDinamica" prefix="s" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SimpleTag Dinamica</title>
</head>
<body>
<s:nome nome="${param.nome}"/>
<form action="" method="post">
	Nome: <input type="text" name="nome" />
	<input type="submit" value="enviar" name="btn_enviar" />
</form>
</body>
</html>