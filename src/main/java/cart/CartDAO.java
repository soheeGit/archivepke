package cart;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bbs.Bbs;
import member.Member;
import product.Product;

public class CartDAO {
   
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
   
   public int insert(Cart c) {
      open();
      String sql = "INSERT INTO cart(cId, mId, cDate, pName) values(?,?,?,?)";
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, c.getcId());
         pstmt.setString(2, c.getmId());
         pstmt.setTimestamp(3, new Timestamp(c.getcDate().getTime()));
         pstmt.setString(4, c.getpName());
         
         return pstmt.executeUpdate();
      } catch(Exception e) {e.printStackTrace();}
      return -1; // 데이터 베이스 오류
   }
   public int insertNotcId(Cart c) {
	      open();
	      String sql = "INSERT INTO cart(mId, cDate, pName) values(?,?,?)";
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, c.getmId());
	         pstmt.setTimestamp(2, new Timestamp(c.getcDate().getTime()));
	         pstmt.setString(3, c.getpName());
	         
	         return pstmt.executeUpdate();
	      } catch(Exception e) {e.printStackTrace();}
	      return -1; // 데이터 베이스 오류
	   }
   
   public List<Cart> getAll(String mId){
      open();
      List<Cart> carts = new ArrayList<>();
      
      try {
         pstmt = conn.prepareStatement("select * from cart where mId = ?");
         pstmt.setString(1, mId);
         ResultSet rs = pstmt.executeQuery();
         while(rs.next()) {
            Cart c = new Cart();
            c.setcId(rs.getInt(1));
            c.setmId(rs.getString(2));
            c.setcDate(rs.getTimestamp(3));
            c.setpName(rs.getString(4));
            
            carts.add(c);
         }
      } catch(Exception e) {e.printStackTrace();}
      finally {close();}
      return carts;
   }
   public Cart selectBymId(String mId){
      open();
         Cart cart = null;
         ResultSet rs = null;
         try {
           pstmt=conn.prepareStatement("select * from cart where mId = ?");
           pstmt.setString(1, mId);
            rs = pstmt.executeQuery();
            if (rs.next()){
               cart = new Cart(); 
               cart.setcId(rs.getInt(1));
               cart.setmId(rs.getString(2));
               cart.setcDate(rs.getTimestamp(3));
               cart.setpName(rs.getString(4));
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {close();}
         return cart;
      }
}