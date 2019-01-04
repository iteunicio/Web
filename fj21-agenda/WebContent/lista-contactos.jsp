<!-- Importação da taglib JSTL Core (for, if, when...) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Importação da taglib JSTL fmt (formatDate) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Contactos</title>
</head>
<body>

	<!-- Importação do cabeçalho -->
	<c:import url="cabecalho.jsp" />

	<h1>Tabela de Contactos</h1>
	<table border="1">
	<tr>
		<th>ID</th>
		<th>Nome</th>
		<th>Email</th>
		<th>Endereço</th>
		<th>Data de Nascimento</th>
	</tr>
	<!-- Criar o DAO -->
	<jsp:useBean id="dao" class="mz.com.caelum.agenda.dao.ContactoDAO" />
	<!-- Percorrer os contactos montando as linhas da tabela -->
	<c:forEach var="contacto" items="${dao.lista}" varStatus="id">
		<tr bgcolor="#${id.count % 2 == 0 ? 'aaee88' : 'ffffff'}">
			<td>${contacto.id}</td>
			<td>${contacto.nome}</td>
			<td>
				<c:choose>
					<c:when test="${not empty contacto.email}">
						<a href="mailto:${contacto.email}">
							${contacto.email}
						</a>
					</c:when>
					<c:otherwise>
						Email não informado!
					</c:otherwise>
				</c:choose>
				<!-- 
				<c:if test="${not empty contacto.email}">
					<a href="mailto:${contacto.email}">
						${contacto.email}
					</a>
				</c:if>
				<c:if test="${empty contacto.email}">
					Email não informado!
				</c:if>
				 -->
			</td>
			<td>${contacto.endereco}</td>
			<td><fmt:formatDate value="${contacto.dataNascimento.time}" 
					pattern="dd/MM/yyy" /></td>
		</tr>
	</c:forEach>
	</table>
	
	<!-- Importação do rodapé -->
	<c:import url="rodape.jsp" />
	
</body>
</html>