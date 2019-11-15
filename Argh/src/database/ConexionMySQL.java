package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionMySQL {
	private Connection C = null;
	private String jdbc= "jdbc:mysql://localhost:3306/tparg";
	private String user= "root";
	private String pass= "tekentak18";
	private String driver= "com.mysql.jdbc.Driver";
	
	public ConexionMySQL() {
		try {
			if (C == null){
				Class.forName(driver);
				C = DriverManager.getConnection(jdbc,user,pass);
				System.out.println("Conexión establecida a la Base de Datos");	
			}				
		}catch (SQLException | ClassNotFoundException e){
			System.out.println("Error al conectar a la Base de Datos ");
			e.printStackTrace();
		}
	}
	
	public Connection getConnection() {
		return C;
	}
}
