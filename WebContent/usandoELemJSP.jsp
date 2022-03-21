<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabalhando com Expression Language</title>
</head>
<body>
<h2>Express&otilde;es Aritm&eacute;ticas</h2>
Um exemplo de c&aacute;lculo 1 + 5 * 10 - 3 / 2 : <strong>${1 + 5 * 10 - 3 / 2}</strong><br />
Um valor negativo (-5 -8) : <strong>${-5 -8 }</strong><br />
<!--  Uma divis&atilde;o usando 6 div 2 : <strong>${6 div 2}</strong><br /> funciona mas dá erro de token-->
O resto de uma divis&atilde;o (10 % 8) : <strong>${10 % 8 }</strong><br />
<h2>Compara&ccedil;&otilde;es</h2>
<h3>Utilizando boolean</h3>
Uma compara&ccedil;&atilde;o usando operador tern&aacute;rio "(true)?'verdadeiro' : 'falso'" : <strong>${(true) ? "verdadeiro" : "falso" }</strong><br />
<h2>Operador empty</h2>
empty "" : <strong>${empty "" }</strong><br />
empty "texto" : <strong>${empty "texto" }</strong><br />
<h2>Valor null</h2>
null == null : <strong>${null == null }</strong><br />
"null" == null : <strong>${"null" == null }</strong><br />
</body>
</html>