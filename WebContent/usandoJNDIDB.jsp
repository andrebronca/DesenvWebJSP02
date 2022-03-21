<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.sql.*, javax.sql.*, javax.naming.InitialContext"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Usando Pool de conex&otilde;es</title>
</head>
<body>
<table>
	<tr>
		<th>ISBN</th><th>T&iacute;tulo</th>
	</tr>
<%
Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	try {
		InitialContext ictx = new InitialContext();
		//if (ictx == null){
		//throw new Exception("jndi Inicial context is null!");
		//}

		DataSource ds = (DataSource) ictx.lookup("java:comp/env/jdbc/bdjavajsp"); //1

		if (ds == null) {
	throw new Exception("jndi ds is null");
		}

		conn = ds.getConnection();
		st = conn.createStatement();
		rs = st.executeQuery("select isbn, titulo from livros"); //traz até os que foram 'excluidos'
		int i = 1;
		while (rs.next()) {
%>
	<tr>
		<td><%= i++ %>&nbsp;<%=rs.getString("isbn")%></td>
		<td><%= rs.getString("titulo") %></td>
	</tr>
<%
		}
	} catch (Exception e){
		e.printStackTrace();
		out.println("Exception jndi: "+ e.getMessage());
	} finally {
		if (rs != null) rs.close();
		if (st != null) st.close();
		if (conn != null) conn.close();
	}
%>
</table>
</body>
</html>