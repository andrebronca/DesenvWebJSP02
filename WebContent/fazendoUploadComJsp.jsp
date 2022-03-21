<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Fazendo Upload de arquivos</title>
</head>
<body>
<jsp:useBean id="upl" class="meupacote.UploadBean" scope="page" />
<jsp:setProperty property="diretorio" name="upl" value="arquivos"/>
<jsp:setProperty property="size" value="1" name="upl"/>
<jsp:setProperty property="extensoesPermitidas" name="upl" value="jpg,gif,pdf,doc,odt,xls"/>
<%
	if(upl.doFilePost(request, application)){
		out.println(upl.getFilename());
	} else {
		if(upl.getErro() != null){
			out.println(upl.getErro());
		}
	}
%>
<form method="post" action="fazendoUploadComJsp.jsp" enctype="multipart/form-data">
	Arquivo: <input type="file" name="file" /><br />
	<input type="submit" name="btn_enviar" value="Enviar" />
</form>
</body>
</html>