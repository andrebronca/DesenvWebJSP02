package meupacote.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import meupacote.dao.LivrariaDAOException;

public class ConnectionLivrariaFactory {
	private static final String CFNAME = "org.postgresql.Driver";
	private static final String URL = "jdbc:postgresql://";
	private static final String IP = "localhost";
	private static final String PORTA = ":5434";
	private static final String BD = "/bdjavajsp";
	private static final String USER = "postgres";
	private static final String SENHA = "postgres13";

	public static Connection getConnection() throws LivrariaDAOException{
		try {
			Class.forName(CFNAME);
			return DriverManager.getConnection(URL + IP + PORTA + BD, USER, SENHA);
		} catch (Exception e) {
			throw new LivrariaDAOException(e.getMessage());
		}
	}
	
	public static void closeConnection(Connection conn, Statement stmt, ResultSet rs) throws LivrariaDAOException {
		close(conn, stmt, rs);
	}
	
	public static void closeConnection(Connection conn, Statement stmt) throws LivrariaDAOException {
		close(conn, stmt, null);
	}
	
	public static void closeConnection(Connection conn) throws LivrariaDAOException {
		close(conn, null, null);
	}
	
	private static void close(Connection conn, Statement stmt, ResultSet rs) throws LivrariaDAOException {
		try {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=  null) conn.close();
		} catch (Exception e) {
			throw new LivrariaDAOException(e.getMessage());
		}
	}
	
}
