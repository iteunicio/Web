<!-- Importação da JSTL core para import -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Importação da taglib JSTL para formatação da data -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!-- Importação das tags criadas por mim (tagfiles) -->
<%@ taglib tagdir="/WEB-INF/tags" prefix="caelum" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Alterando Descrição da Tarefa</title>
	<!-- Importando CSS e JavaScript -->
	<link href="resources/css/jquery-ui.css" rel="Stylesheet" />
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
</head>
<body>
	<!-- Cabeçalho -->
	<c:import url="/WEB-INF/views/cabecalho.jsp" />
	
	<h2>Altera Tarefa: </h2><h3>${tarefa.id}</h3>
	<form action="alteraTarefa" method="post">
		<input type="hidden" name="id" value="${tarefa.id}" />
		Descrição:<br />
		<textarea name="descricao" rows="5" cols="100"><%--
			 --%>${tarefa.descricao}<%-- 
		 --%></textarea>
		 <br />
		 Finalizado?<input type="checkbox" name="finalizado" 
		 	value="true" ${tarefa.finalizado ? 'checked' : ''} />
		 <br />
		 <br />
		 <label for="dataFinalizacao" >Data Finalização:</label><br />
		 <caelum:campoData id="dataFinalizacao" />
		 <!-- 
		 <input type="text" name="dataFinalizacao" 
		 	value="<fmt:formatDate value="${tarefa.dataFinalizacao.time}"
		 	pattern="dd/MM/yyyy" />" /> -->
		 <br />
		 <br />
		 <input type="submit" value="Alterar" />
	</form>
	<br /><br />
	<br /><br />
	<br />
	
	<!-- Importação do rodapé -->
	<c:import url="/WEB-INF/views/rodape.jsp" />
</body>
</html>