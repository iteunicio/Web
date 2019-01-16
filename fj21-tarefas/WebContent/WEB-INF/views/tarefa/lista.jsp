<!-- Importação da JSTL core para forEach, import, if -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Imprtação da JSTL fmt para data -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Lista de Tarefas</title>
	<!-- Importando jQuery -->
	<script src="resources/js/jquery.js"></script>
	<script src="resources/js/jquery-ui.js"></script>
</head>
<body>
	<!-- Código JavaScript -->
	<script type="text/javascript">
		function finalizaAgora(id) {
			$.post("finalizaTarefa", {'id' : id}, function() {
				//	Seleccionando o elemento HTML através do ID 
				//	e alterando o HTML dele.
				$("#tarefa_"+id).html("Finalizado");
			});
		}
	</script>

	<!-- Cabeçalho -->
	<c:import url="/WEB-INF/views/cabecalho.jsp" />
	
	<h1>Lista de Tarefas</h1>
	<h3><a href="novaTarefa">Adicionar nova Tarefa</a></h3>
	<br />
	<table border="1">
	<tr>
		<th>Ordem</th>
		<th>Descrição</th>
		<th>Estado</th>
		<th>Data de Finalização</th>
		<th>Alteração</th>
		<th>Remoção</th>
	</tr>
	<!-- Percorrer a lista montando as linhas da tabela -->
	<c:forEach var="tarefa" items="${tarefas}" varStatus="id">
		<tr bgcolor="#${id.count % 2 == 0 ? 'cccccc' : 'ffffff'}">
			<td>${tarefa.id}</td>
			<td>${tarefa.descricao}</td>
			<td id="tarefa_${tarefa.id}">
				<c:if test="${tarefa.finalizado eq true}">
					Finalizada
				</c:if>
				<c:if test="${tarefa.finalizado eq false}">
					<a href="#" onclick="finalizaAgora(${tarefa.id})">
						Finalizar agora!
					</a>
				</c:if>
			</td>
			<td><!-- Formatação de data -->
				<c:if test="${not empty tarefa.dataFinalizacao}">
					<fmt:formatDate 
					value="${tarefa.dataFinalizacao.time}"
					pattern="dd/MM/yyyy" />
				</c:if><!-- time p/ que passe de Calendar p/ Date -->
				<c:if test="${empty tarefa.dataFinalizacao}">
					<font  color="red">Ainda por definir</font>
				</c:if>
			</td>
			<td><a href="mostraTarefa?id=${tarefa.id}">Alterar</a></td>
			<td><a href="removeTarefa?id=${tarefa.id}">Remover</a></td>
		</tr>
	</c:forEach>
	</table>
	
	<!-- Importação do rodapé -->
	<c:import url="/WEB-INF/views/rodape.jsp" />
</body>
</html>