<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Selecione os programas que você usa</title>
</head>
<body>
<%
	String[] programas = request.getParameterValues("programas");
	if(programas != null){
		out.println("<h2>Você selecionou os seguintes programas</h2>");
		for(String p : programas){
			out.println("<strong>"+ p +"</strong><br />");
		}
	} else {
		out.println("<strong>Nenhum valor selecionado</strong>");
	}
	
	String[] listaProgramas = {"Eclipse","NetBeans","VisualStudio.Net","LibreOffice.org","Dreamweaver"};
%>
<h2>Selecione um ou mais programas usando o Ctrl</h2>
<form action="envDivOpc.jsp" method="post">
	<select name="programas" size="4" multiple="multiple">
		<%
			for(String lp : listaProgramas){
				out.println("<option value=\""+ lp +"\">"+ lp +"</option>");
			}
		%>
		<!-- 
		<option value="Eclipse">Eclipse</option>
		<option value="NetBeans"></option>
		<option value="VisualStudio.Net"></option>
		<option value="LibreOffice.org"></option>
		<option value="Dreamweaver">Dreamweaver</option> -->
	</select>
	<input type="submit" name="btn_enviar" value="Enviar" />
</form>
</body>
</html>