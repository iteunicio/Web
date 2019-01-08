package mz.com.caelum.tarefas.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	/*
	 * Vamos criar o metodo getConnection, que retorna uma nova conexao
	 */
	public static Connection getConnection() throws ClassNotFoundException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection("jdbc:mysql://localhost/fj21",
					"root","root");
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
