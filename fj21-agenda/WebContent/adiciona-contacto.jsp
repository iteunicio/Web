<!-- Importacão da taglib JSTL Core -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Importação das tags criadas por mim (tagfiles) -->
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Adiciona Contactos</title>
	<!-- Importando CSS e JavaScript -->
	<link href="css/jquery-ui.css" rel="Stylesheet" />
	<script src="js/jquery.js"></script>
	<script src="js/jquery-ui.js"></script>
	
</head>
<body>
	<!-- Cabeçalho -->
	<c:import url="cabecalho.jsp" />
	
	<h1>Adiciona Contactos</h1>
	<hr />
	<form action="adicionaContacto">
		<label for="idd">ID:</label>
		<input type="text" name="idd" id="idd" /><br />
		<label for="nome">Nome:</label>
		<input type="text" name="nome" id="nome" /><br />
		<label for="email">Email:</label>
		<input type="text" name="email" id="email" /><br />
		<label for="endereco">Endereço:</label>
		<input type="text" name="endereco" id="endereco" /><br />
		<label for="dataNascimento">Data de Nascimento:</label>
		<caelum:campoData id="dataNascimento" /><br />
		<br />
		<input type="submit" value="Gravar" />
	</form>
	
	<!-- Rodapé -->
	<c:import url="rodape.jsp" />
</body>
</html>