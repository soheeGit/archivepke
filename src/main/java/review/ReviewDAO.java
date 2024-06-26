package review;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
   
	Connection conn=null;
	PreparedStatement pstmt=null;
	
	final String JDBC_DRIVER ="com.mysql.cj.jdbc.Driver";
	final String JDBC_URL="jdbc:mysql://127.0.0.1:3306/termdb";
	
	public void open() {
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "root", "63wlsthgml@");
		} catch (Exception e) {e.printStackTrace();}
	}
	
	public void close() {
		try {
			pstmt.close();
			conn.close();
		} catch(SQLException e) {e.printStackTrace();}
	}
	
	
}