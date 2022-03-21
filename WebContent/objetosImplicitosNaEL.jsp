<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com objetos implícitos no EL</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>Objeto</td>
			<td>C&oacute;digo usado</td>
			<td>Sa&iacute;da</td>
		</tr>
		<tr>
			<td>PageContext</td>
			<td>${'${'}pageContext.request.requestURI}</td>
			<td>${pageContext.request.requestURI }</td>
		</tr>
		<tr>
			<td>param</td>
			<td>${'${'}param['varios']}</td>
			<td>${param['varios']}</td>
		</tr>
		<tr>
			<td>paramValues</td>
			<td>${'${'}paramValues.varios[1]}</td>
			<td>${paramValues.varios[1]}</td>
		</tr>
	</table>
</body>
</html>