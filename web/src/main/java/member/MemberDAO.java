package member;

import java.sql.*;
import java.util.*;

public class MemberDAO {

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public MemberDAO() {
		try {
				Class.forName(driver);
				System.out.println("오라클드라이버 성공");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("오라클드라이버 실패");
		}
	}
	/////////////connection
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn=DriverManager.getConnection(url, "TEST_USER", "12345");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	
	public void signuplnsert(MemberDTO dto) {
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		
		String sql = "insert INTO MEMBER(id, pw, name, phone_num, email, rank) values(?, ?, ?, ?, ?, ?)";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, (dto.getPhone1() +"-"+ dto.getPhone2() +"-"+ dto.getPhone3()));
			pstmt.setString(5, (dto.getEmail() +"@"+ dto.getCom()));
			pstmt.setString(6, dto.getRank());
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	public boolean loginCheckId(String id) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		String sql = "select id from MEMBER where id=?";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				pstmt.close();
				conn.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
	
}
