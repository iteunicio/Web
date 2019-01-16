<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login</title>
</head>
<body>
	<h2>Página de Login de Tarefas</h2>
	<hr />
	<form action="efectuaLogin" method="post">
	<h3>
		<label for="login"> Login:
			<input type="text" name="login" id="login" />
		</label><br />
		<label for="senha"> Senha:
			<input type="password" name="senha" id="senha" />
		</label><br />
		<input type="submit" value="Entrar" />
	</h3>
	</form>
</body>
</html>