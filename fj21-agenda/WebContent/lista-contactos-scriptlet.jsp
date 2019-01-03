<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="java.util.*,mz.com.caelum.agenda.dao.*,
	mz.com.caelum.agenda.modelo.*" %>
<%@page import="java.text.DateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Contactos</title>
</head>
<body>
	<h1>Tabela de Contactos</h1>
	<table border="1">
		<%
			ContactoDAO dao = new ContactoDAO();
			List<Contacto> contactos = dao.getLista();
			DateFormat f = DateFormat.getDateInstance(DateFormat.MEDIUM);
			for(Contacto contacto : contactos){
			%>
				<tr>
					<td><%= contacto.getId() %></td>
					<td><%= contacto.getNome() %></td>
					<td><%= contacto.getEmail() %></td>
					<td><%= contacto.getEndereco() %></td>
					<td><%= f.format(contacto.getDataNascimento().getTime()) %></td>
				</tr>
			<%
			}
			%>
	</table>
</body>
</html>