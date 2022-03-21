<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="primeirojb" class="meupacote.PrimeiroJavaBean" />
A mensagem atual é <strong><%= primeirojb.getMensagem() %></strong>
<br />
A mensagem, depois de adicionada é:<br />
<strong>
<%
primeirojb.setMensagem("JSP é top - uso de JavaBean");
out.print(primeirojb.getMensagem());
%>
</strong>	
</body>
</html>