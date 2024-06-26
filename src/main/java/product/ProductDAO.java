package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDAO {
   
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
	
	public void insert(Product p) {
		open();
		String sql = "INSERT INTO product(pId, pName, price, pDate, pImage, pImage1, pImage2, pImage3, pImage4, pImage5, pCategory, pCount, pImage6, pImage7, pContent)"
				+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, p.getpId());
			pstmt.setString(2, p.getpName());
			pstmt.setInt(3, p.getPrice());
			pstmt.setTimestamp(4, new Timestamp(p.getpDate().getTime()));
			pstmt.setString(5, p.getpImage());
			pstmt.setString(6, p.getpImage1());
			pstmt.setString(7, p.getpImage2());
			pstmt.setString(8, p.getpImage3());
			pstmt.setString(9, p.getpImage4());
			pstmt.setString(10, p.getpImage5());
			pstmt.setInt(11, p.getpCategory());
			pstmt.setInt(12, p.getpCount());
			pstmt.setString(13, p.getpImage6());
			pstmt.setString(14, p.getpImage7());
			pstmt.setString(15, p.getpContent());
			
			pstmt.executeUpdate();
		} catch(Exception e) {e.printStackTrace();}
		finally {close();}
	}
	
	public List<Product> getAll(){
		open();
		List<Product> products = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from product");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				Product p = new Product();
				p.setpId(rs.getInt("pId"));
				p.setpName(rs.getString("pName"));
				p.setPrice(rs.getInt("price"));
				p.setpDate(rs.getTimestamp("pDate"));
				p.setpImage(rs.getString("pImage"));
				p.setpImage1(rs.getString("pImage1"));
				p.setpImage2(rs.getString("pImage2"));
				p.setpImage3(rs.getString("pImage3"));
				p.setpImage4(rs.getString("pImage4"));
				p.setpImage5(rs.getString("pImage5"));
				p.setpCategory(rs.getInt("pCategory"));
				p.setpCount(rs.getInt("pCount"));
				p.setpImage6(rs.getString("pImage6"));
				p.setpImage7(rs.getString("pImage7"));
				p.setpContent(rs.getString("pContent"));
				
				products.add(p);
			}
		} catch(Exception e) {e.printStackTrace();}
		finally {close();}
		return products;
	}
	
	public Product selectById(int pId){
		open();
         Product product = null;
         ResultSet rs = null;
         try {
        	pstmt=conn.prepareStatement("select * from product where pId = ?");
        	pstmt.setInt(1, pId);
            rs = pstmt.executeQuery();
            if (rs.next()){
               product = new Product(); 
               product.setpId(rs.getInt(1));
               product.setpName(rs.getString(2));
               product.setPrice(rs.getInt(3));
               product.setpDate(rs.getTimestamp(4));
               product.setpImage(rs.getString("pImage"));
               product.setpImage1(rs.getString("pImage1"));
               product.setpImage2(rs.getString("pImage2"));
               product.setpImage3(rs.getString("pImage3"));
               product.setpImage4(rs.getString("pImage4"));
               product.setpImage5(rs.getString("pImage5"));
               product.setpCategory(rs.getInt(11));
               product.setpCount(rs.getInt(12));
               product.setpImage6(rs.getString("pImage6"));
               product.setpImage7(rs.getString("pImage7"));
               product.setpContent(rs.getString(15));
            }
         } catch (SQLException e){
            e.printStackTrace();
         } finally {close();}
         return product;
      }
}