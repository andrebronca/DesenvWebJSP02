<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usando Expression Language com JavaBeans</title>
</head>
<body>
<jsp:useBean id="spjb" class="meupacote.UmSimplesJavaBean" scope="request">
	<jsp:setProperty name="spjb" property="*" />
</jsp:useBean>
Seu nome &eacute;: <strong>${spjb.nome }</strong><br /> <!-- prefiro essa, mais limpa -->
Seu e-mail &eacute;: <strong>${spjb["email"] }</strong> <!-- outra forma de obter o valor -->

<form action="${pageContext.request.requestURI}" method="post">
	Nome: <input type="text" name="nome" /><br />
	E-mail: <input type="text" name="email" /><br />
	<input type="submit" name="btn_enviar" value="Enviar" />
</form>
</body>
</html>