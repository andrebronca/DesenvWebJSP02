<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interagindo com o Usuário</title>
</head>
<body>
<jsp:useBean id="objI" class="meupacote.InteragindoBean"/>
<jsp:setProperty property="*" name="objI"/>
Seu nome é: <strong><jsp:getProperty property="nome" name="objI"/></strong>
<form action="interagindo.jsp" method="post">
	Nome: <input type="text" size="20" name="nome" /><br />
	<input type="submit" name="btn_enviar" value="Enviar" />
</form>
<hr />
<%
	String var_nome = request.getParameter("nome");
%>
Nome: <strong><%= var_nome %></strong>
</body>
</html>