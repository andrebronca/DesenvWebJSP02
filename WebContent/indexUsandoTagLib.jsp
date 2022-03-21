<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="taglibInput" prefix="t" %>
<%@ taglib uri="loopTag" prefix="l" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Taglibs</title>
</head>
<body>
<form action="indexUsandoTagLib.jsp" method="post">
	<table>
		<tr>
			<td>Nome:</td>
			<td><t:inputTag name="nome" type="text" size="25"/></td>
		</tr>
		<tr>
			<td>e-mail:</td>
			<td><t:inputTag name="email" type="text" size="25"/></td>
		</tr>
		<tr>
			<td>sexo:</td>
			<td>
				<t:inputTag name="sexo" type="radio" value="m"/>Masculino
				<t:inputTag name="sexo" type="radio" value="f"/>Feminino
			</td>
		</tr>
		<tr>
			<td>Tipo de m&uacute;sicas:</td>
			<td>
				<t:inputTag name="pop" type="checkbox" value="pop"/>Popv
				<t:inputTag name="rock" type="checkbox" value="rock"/>Rock
				<t:inputTag name="dance" type="checkbox" value="dance"/>Dance
			</td>
		</tr>
		<tr>
			<td>Usu&aacute;rio:</td>
			<td><t:inputTag name="usuario" type="text" size="25" /></td>
		</tr>
		<tr>
			<td>Senha:</td>
			<td><t:inputTag name="senha" type="password" size="25" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<t:inputTag name="btn_enviar" type="submit" value="Enviar" />
				<t:inputTag name="btn_limpar" type="reset" value="Limpar"/>
			</td>
		</tr>
	</table>
</form>
<hr />
<h3>Usando tag loop</h3>
<l:loop contar="3">
<h3>3 vezes</h3>
</l:loop>
</body>
</html>