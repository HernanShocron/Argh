package database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import entities.Evento;

public class EventoData {
	
	
	public Evento getOne(String id, String fecha) throws SQLException{		
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("getOne de id y fecha");
		Evento event = new Evento();
		String query = "SELECT * FROM evento WHERE idEvento = ? and fecha = ?";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, fecha);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		event.setId(rs.getInt("idEvento"));
		event.setFecha(rs.getDate("fecha"));
		event.setDesc(rs.getString("descripcion"));
		rs.close();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
		return event;	
	}
	
	public Evento getOne(String id) throws SQLException{
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("getOne de id");
		Evento event = new Evento();
		String query = "SELECT * FROM evento WHERE idEvento = ?";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		rs.next();
		event.setId(rs.getInt("idEvento"));
		event.setFecha(rs.getDate("fecha"));
		event.setDesc(rs.getString("descripcion"));
		rs.close();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
		return event;	
	}
	
	public ArrayList<Evento> getAll() throws SQLException{
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("getAll");
		ArrayList<Evento> eventlist = new ArrayList<Evento>();
		String query = "SELECT * FROM evento";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			Evento event = new Evento();
			event.setId(rs.getInt("idEvento"));
			event.setFecha(rs.getDate("fecha"));
			event.setDesc(rs.getString("descripcion"));
			eventlist.add(event);
		}
		rs.close();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
		return eventlist;
	}
	
	public void insertOne(String fecha, String desc) throws SQLException{
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("InserOne");
		String query = "INSERT INTO evento (fecha, descripcion) VALUES (?,?)";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, fecha);
		pstmt.setString(2, desc);
		pstmt.executeUpdate();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
	}
	
	public void deleteOne(String id) throws SQLException{
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("deleteOne");
		String query = "DELETE FROM evento WHERE idEvento=?";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.executeUpdate();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
	}
	
	public void updateOne(String id, String fecha, String desc) throws SQLException{
		ConexionMySQL c = new ConexionMySQL();
		System.out.println("updateOne");
		String query = "UPDATE evento SET fecha=?, descripcion=? WHERE idEvento=?";
		PreparedStatement pstmt = c.getConnection().prepareStatement(query);
		pstmt.setString(1, fecha);
		pstmt.setString(2, desc);
		pstmt.setString(3, id);
		pstmt.executeUpdate();
		pstmt.close();
		c.getConnection().close();
		System.out.println("Conexion finalziada");
	} 

}

	