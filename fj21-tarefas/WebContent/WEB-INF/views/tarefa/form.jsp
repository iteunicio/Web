<!-- Taglib para validação de formulário -->
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!-- Importação da taglib JSTL Core (for, if, when, import ...) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Adiciona Tarefas</title>
</head>
<body>
	<!-- Cabeçalho -->
	<c:import url="/WEB-INF/views/cabecalho.jsp" />

	<h2>Adicionar Tarefa</h2>
	
	<!-- Para mensagem de erro -->
	<form:errors path="tarefa.descricao" cssStyle="color:red" />
	<form action="adicionaTarefa" method="post">
		Descrição:<br />
		<textarea name="descricao" rows="5" cols="100">
			Informe a descrição da tarefa...
		</textarea>
		<br />
		<input type="submit" value="Adicionar" />
		<br />
		<a href="listaTarefas"><h3>Ir à lista de tarefas</h3></a>
		<br /><br />
		<br /><br />
		<br /><br />
		<br /><br />
		<br /><br />
	</form>
	
	<!-- Importação do rodapé -->
	<c:import url="/WEB-INF/views/rodape.jsp" />
</body>
</html>