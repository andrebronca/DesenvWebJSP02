<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usando Standard Actions para redirecionar</title>
</head>
<body>
<jsp:forward page="redirecionado.jsp">
	<jsp:param value="Esse texto veio da p&aacute;gina que redirecionava" name="txt"/>
</jsp:forward>
</body>
</html>