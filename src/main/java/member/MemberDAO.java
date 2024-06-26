package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public MemberDAO() {
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

    public int login(String mId,String mPassword) {
        String SQL="SELECT mPassword FROM member WHERE mId=?";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1, mId);
            rs= pstmt.executeQuery();
            if(rs.next()) {
                if(rs.getString(1).equals(mPassword)) 
                    return 1;// 로그인 성공
                else
                    return 0; // 아이디 없음
            }
            return -1;// 아이디 없음
        }catch(Exception e) {
            e.printStackTrace();
        }
        return -2; //데베 오류
    }
    public int join(Member member) {
        String SQL = "INSERT INTO member(mId, mName, mEmail, mPassword) VALUES (?,?,?,?)";
        try {
            pstmt=conn.prepareCall(SQL);
            pstmt.setString(1, member.getmId());
            pstmt.setString(2, member.getmName());
            pstmt.setString(3, member.getmEmail());
            pstmt.setString(4, member.getmPassword());
            return pstmt.executeUpdate( );
        } catch(Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터 베이스 오류
    }


}