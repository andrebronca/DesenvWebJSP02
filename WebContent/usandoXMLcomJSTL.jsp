<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/xml" prefix="x" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manipulando o XML atrav&eacute;s de JSTL</title>
</head>
<body>
<c:import url="livros.xml" var="url" />
<x:parse xml="${url}" var="doc" scope="application" />

	<table border="1">
		<tr>
			<th>ISBN</th><th>T&iacute;tulo</th><th>Publica&ccedil;&atilde;o</th>
		</tr>
		<x:forEach select="$doc/livros/livro" var="1">
			 <x:choose>
			  <x:when select="$1/titulo='Dominando Ajax'">
			  	<c:set var="cor" value="#b0e0e6" />
			  </x:when>
			  <x:when select="$1/titulo='Dominando Eclipse'">
			  	<c:set var="cor" value="#ffe4b5" />
			  </x:when>
			  <x:otherwise>
			  	<c:set var="cor" value="#e6e6fa" />
			  </x:otherwise>
			 </x:choose>
			<tr bgcolor="${cor}">
				<td><x:out select="$1/isbn" /></td>
				<td><x:out select="$1/titulo" /></td>
				<td><x:out select="$1/publicacao" /></td>
			</tr>
		</x:forEach>
	</table>
<!--  
#ffd700
#f8f8ff
#ffe4c4
#eee8aa
#fff0f5
-->
</body>
</html>