package util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBUtil {
	private static ResourceBundle resource = null;
	private static DataSource source = null;
	
	static{		 
		try {
			Context initContext = new InitialContext();		
			Context envContext = (Context)initContext.lookup("java:/comp/env");
			source = (DataSource)envContext.lookup("jdbc/mariadb");
			resource = ResourceBundle.getBundle("conf/sql");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static ResourceBundle getResourceBundle(){
		return resource;
	}
	
	public static Connection getConnection() throws SQLException{
		return source.getConnection();
	}
		
	public static void close(Connection conn,Statement stmt){
		try{
			if(stmt != null){
				stmt.close();
				stmt = null;
			}
			if(conn != null){
				conn.close();
				conn = null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
	public static void close(Connection conn, Statement stmt, ResultSet rset){
		try{
			if(rset != null){
				rset.close();	
				rset = null;
			}
			if(stmt != null){
				stmt.close();	
				stmt = null;
			}
			if(conn != null){
				conn.close();		
				conn = null;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}