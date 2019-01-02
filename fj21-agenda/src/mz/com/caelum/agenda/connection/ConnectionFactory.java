package mz.com.caelum.agenda.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

	/*
	 * O método getConnection retrorna uma nova conexão
	 */
	public static Connection getConnection() {
		try {
			return DriverManager.getConnection("jdbc:mysql://localhost/fj21",
					"root", "root");
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
