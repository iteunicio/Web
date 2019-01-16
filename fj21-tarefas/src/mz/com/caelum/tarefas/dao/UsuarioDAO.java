package mz.com.caelum.tarefas.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import mz.com.caelum.tarefas.modelo.Usuario;

public class UsuarioDAO {
	private Connection connection;
	
	public UsuarioDAO() throws ClassNotFoundException {
		this.connection = ConnectionFactory.getConnection();
	}
	
	public UsuarioDAO(Connection connection) {
		this.connection = connection;
	}
	
	public boolean existeUsuario(Usuario usuario) {
		try {
			PreparedStatement ps = null;
            ResultSet rs = null;
            String sql = "SELECT * FROM usuarios WHERE login  = ?"
                    + " AND senha = ?" ;
            ps = connection.prepareStatement(sql);
            ps.setString(1, usuario.getLogin());
            ps.setString(2, usuario.getSenha());
            rs = ps.executeQuery();
            while(rs.next()){
                String login = rs.getString("login");
                String senha = rs.getString("senha");
                if(usuario.getLogin().equalsIgnoreCase(login) && 
                		usuario.getSenha().equalsIgnoreCase(senha)){
                    return true;
                }
            }
		} catch(SQLException ex) {
			Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE,
                    null, ex);
		}
		return false;
	}
}