package mz.com.caelum.tarefas.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import mz.com.caelum.tarefas.modelo.Tarefa;

public class TarefaDAO {
	
	private Connection connection;
	
	public TarefaDAO() throws ClassNotFoundException {
		this.connection = ConnectionFactory.getConnection();
	}
	public TarefaDAO(Connection connection) {
		this.connection = connection;
	}

	public void adiciona(Tarefa tarefa) {
		String sql = "INSERT INTO tarefas (descricao) VALUES(?)";
		
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, tarefa.getDescricao());
			
			stm.execute();
			stm.close();
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public List<Tarefa> getLista() {
		try {
			List<Tarefa> tarefas = new ArrayList<Tarefa>();
			
			String sql = "SELECT * FROM tarefas";
			PreparedStatement stm = this.connection.prepareStatement(sql);
			ResultSet rs = stm.executeQuery();
			
			while(rs.next()) {
				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setDescricao(rs.getString("descricao"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));
				//	Adicionando data ao contacto:
					Calendar data = Calendar.getInstance();
					if(rs.getDate("dataFinalizado") == null) {
						tarefa.setDataFinalizacao(null);
					}else {
						data.setTime(rs.getDate("dataFinalizado"));
						tarefa.setDataFinalizacao(data);
					}
				
				tarefas.add(tarefa);
			}
			rs.close();
			stm.close();
			return tarefas;
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public void altera(Tarefa tarefa) {
		String sql = "UPDATE tarefas set descricao = ?, " +
					 "finalizado = ?, dataFinalizado = ? WHERE id = ?";
		
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setString(1, tarefa.getDescricao());
			stm.setBoolean(2, tarefa.isFinalizado());
			stm.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
			stm.setLong(4, tarefa.getId());
			stm.execute();
			stm.close();
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	public void remove(Tarefa tarefa) {
		String sql = "DELETE FROM tarefas WHERE id = ?";
		
		try {
			PreparedStatement stm = connection.prepareStatement(sql);
			stm.setLong(1, tarefa.getId());
			stm.execute();
			stm.close();
		}catch(SQLException e) {
			throw new RuntimeException(e);
		}
	}
	
}
