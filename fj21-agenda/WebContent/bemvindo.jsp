<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bem Vindo!</title>
</head>
<body>
	<%-- Coment�rio em JSP aqui: Nossa primeira p�gina JSP --%>
	
	<% String msg = "Bem vindo ao sistema de agenda do FJ-21!"; %>
	<h1><% out.println(msg); %></h1>
		<%-- out.println � um a forma de imprimir... --%>
	<br />
	<% String dsv = "Desenvolvido por Eunicio de Alberito."; %>
	<%= dsv %>
		<%-- <%= variv�vel %> � outra forma de imprimir. --%>
	<br />
	<% System.out.println("Tudo foi executado!"); %>
		<%-- Esta impress�o aparece na consola! --%>
</body>
</html>