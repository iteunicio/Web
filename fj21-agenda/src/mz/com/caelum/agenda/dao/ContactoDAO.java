package mz.com.caelum.agenda.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import mz.com.caelum.agenda.connection.ConnectionFactory;
import mz.com.caelum.agenda.modelo.Contacto;

public class ContactoDAO {

	private Connection connection;
	
	public ContactoDAO() throws ClassNotFoundException {
		this.connection = ConnectionFactory.getConnection();
	}
	
	public List<Contacto> getLista() {
		try {
			List<Contacto> contactos = new ArrayList<Contacto>();
			
			String sql = "SELECT * FROM contactos";
			PreparedStatement stm = this.connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Contacto contacto = new Contacto();
				contacto.setId(rs.getLong("id"));
				contacto.setNome(rs.getString("nome"));
				contacto.setEmail(rs.getString("email"));
				contacto.setEndereco(rs.getString("endereco"));
				//	Adicionando data ao contacto:
					Calendar data = Calendar.getInstance();
					data.setTime(rs.getDate("dataNascimento"));
					contacto.setDataNascimento(data);
					
				contactos.add(contacto);
			}
			rs.close();
			stm.close();
			return contactos;
		} catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
