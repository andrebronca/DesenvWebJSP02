<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usando JavaBeans para formatar datas</title>
</head>
<body>
<jsp:useBean id="dt" class="meupacote.FormatandoDatas" />
A data atual é <strong><%= dt.getData() %></strong>
<br />
Mudando a formatação da data:
<% dt.setFormat("dd/MM/yyyy"); %>
<strong><%= dt.getData() %></strong> <!-- prefiro esse formato -->
<hr />
<jsp:setProperty property="dateFormat" 
	name="dt" value="dd/MM/yy"/>
A data atual é <strong><%= dt.getData() %></strong>
<hr />
<jsp:getProperty property="data" name="dt"/>
</body>
</html>