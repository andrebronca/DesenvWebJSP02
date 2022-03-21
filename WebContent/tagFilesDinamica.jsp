<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Custom Tags</title>
</head>
<body>
	<form>
		<t:tagdinamica nome="estados" 
			opcoes="SP,RJ,MG,PR,RS" 
			delimitadores=","
			tamanho="3"
			multiplo="true"
			/>
	</form>
</body>
</html>