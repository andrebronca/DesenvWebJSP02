<%@page import="java.util.TimeZone"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formatações de data, hora, número e moeda</title>
</head>
<body>
<h2>Padr&atilde;o atual</h2>
<jsp:useBean id="dt" class="java.util.Date" />
Data padr&atilde;o: <fmt:formatDate value="${dt}"/><br />
Somente a data no formato dd/MM/yyyy: <fmt:formatDate value="${dt}" type="DATE" pattern="dd/MM/yyyy"/>
<br />
A hora: <fmt:formatDate value="${dt}" type="TIME" dateStyle="default"/>
<h2>Los Angeles Time Zone</h2>
<fmt:timeZone value="America/Los_Angeles">
Default format: <fmt:formatDate value="${dt}"/><br />
Data no formato MM-dd-yyyy: <fmt:formatDate value="${dt}" type="DATE" pattern="MM-dd-yyyy"/>
<br />
Hora estilo SHORT: <fmt:formatDate value="${dt}" type="TIME" timeStyle="SHORT"/>
<br />
</fmt:timeZone>
<hr />
<h2>Formata&ccedil;&atilde;o de Moeda</h2>
<c:set var="salario" value="5000" />
<fmt:setLocale value="en_US"/>
<fmt:formatNumber type="CURRENCY" value="${salario}" />
<br />
<fmt:setLocale value="pt_BR"/>
<fmt:formatNumber type="CURRENCY" value="${salario}" />
<br />
<hr />
<h2>Formata&ccedil;&atilde;o de n&uacute;meros</h2>
<c:set var="numero" value="1000.2" />
<fmt:formatNumber type="NUMBER" groupingUsed="true" minFractionDigits="2" 
	value="${numero}" />
<hr />
<h2>Formata&ccedil;&atilde;o de Porcentagem</h2>
<c:set var="porcentagem" value="0.05" />
<fmt:formatNumber type="PERCENT" value="${porcentagem}" />
<hr />
<table border="1">
	<c:forEach var="tz" items="<%=java.util.TimeZone.getAvailableIDs() %>">
		<tr>
			<td width="51%">
				<c:out value="${tz}" />
			</td>
			<td width="49%">
				<fmt:timeZone value="${tz}">
					<fmt:formatDate value="${dt}" timeZone="{zn}" type="both"/>
				</fmt:timeZone>
			</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>