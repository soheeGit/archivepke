package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private ResultSet rs;

	public BbsDAO() {
		try {
			String dbURL="jdbc:mysql://127.0.0.1:3306/termdb";
			String dbID="root";
			String dbPassword="63wlsthgml@";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getDate() {  //현재의 시간을 가져옴
		String SQL="SELECT NOW()";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery(); //실행했을떄 나오는 결과
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "";//데베오류
	}
	public int getNext() { 
		String SQL="SELECT bId FROM BBS ORDER BY bId DESC"; //제일 마지막에 쓰인 글 번호
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
			return 1; //첫번쨰 게시물인 경우
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데베오류
	}
	
	public int write(Bbs b) {
		String SQL="INSERT INTO BBS VALUES(?,?,?,?,?,?)"; //제일 마지막에 쓰인 글 번호
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, b.getbId());
			pstmt.setString(2, b.getbTitle());
			pstmt.setString(3, b.getmId());
			pstmt.setTimestamp(4, new Timestamp(b.getbDate().getTime()));
			pstmt.setString(5, b.getbContent());
			pstmt.setInt(6,1);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데베오류
	}
	public ArrayList<Bbs>getList(int pageNumber){  //페이지에 게시글 10개 가능
		String SQL="SELECT * FROM BBS WHERE bId < ? AND bAvailable =1 ORDER BY bId DESC LIMIT 10"; // 10개 까지만 가져옴 
		ArrayList<Bbs>list=new ArrayList<Bbs>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setbId(rs.getInt(1));
				bbs.setbTitle(rs.getString(2));
				bbs.setmId(rs.getString(3));
				bbs.setbDate(rs.getTimestamp(4));	
				bbs.setbContent(rs.getString(5));
				bbs.setbAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 	list;
	}
	public boolean nextPage(int pageNumber) {    //페이징 구현
		String SQL="SELECT * FROM BBS WHERE bId <  ? AND bAvailable =1"; // 10개 까지만 가져옴 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,getNext()-(pageNumber-1)*10);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return 	false;
	}
	
	public Bbs getBbs(int bId) { //게시글  불러오는 코드
		String SQL="SELECT * FROM BBS WHERE bId =? "; 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1,bId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Bbs bbs=new Bbs();
				bbs.setbId(rs.getInt(1));
				bbs.setbTitle(rs.getString(2));
				bbs.setmId(rs.getString(3));
				bbs.setbDate(rs.getTimestamp(4));	
				bbs.setbContent(rs.getString(5));
				bbs.setbAvailable(rs.getInt(6));
				return bbs;
			}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return 	null;
	}
	public int update(int bId, String bTitle, String bContent) {  //게시글 수정 
		String SQL="UPDATE BBS SET bTitle=?, bContent=? WHERE bId= ?"; 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, bTitle);
			pstmt.setString(2,bContent);
			pstmt.setInt(3,bId);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데베오류
		
	}
	
	public int delete(int bId) {
	      String SQL="UPDATE BBS SET bAvailable=0 WHERE bId= ?"; 
	      try {
	         PreparedStatement pstmt=conn.prepareStatement(SQL);
	         pstmt.setInt(1,bId);
	         return pstmt.executeUpdate();
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return -1;//데베오류
	   }
	public ArrayList<Bbs> getSearch(String searchField, String searchText){//특정한 리스트를 받아서 반환
        ArrayList<Bbs> list = new ArrayList<Bbs>();
        String SQL ="select * from bbs WHERE "+searchField.trim();
        try {
              if(searchText != null && !searchText.equals("") ){ 
                  SQL +=" LIKE '%"+searchText.trim()+"%' order by bId desc limit 10";
              }
              PreparedStatement pstmt=conn.prepareStatement(SQL);
              rs=pstmt.executeQuery();//select
           while(rs.next()) {
              Bbs bbs = new Bbs();
              bbs.setbId(rs.getInt(1));
              bbs.setbTitle(rs.getString(2));
              bbs.setmId(rs.getString(3));
              bbs.setbDate(rs.getTimestamp(4));
              bbs.setbContent(rs.getString(5));
              bbs.setbAvailable(rs.getInt(6));
              list.add(bbs);//list에 해당 인스턴스를 담는다.
           }         
        } catch(Exception e) {
           e.printStackTrace();
        }
        return list;//게시글 리스트 반환
     }
}