package board;

import java.sql.*;
import java.util.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public BoardDAO() {
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
			conn=DriverManager.getConnection(url, "WebD", "web");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	
	public void write(BoardDTO dto) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO Board(post_num, writer, title, content, write_date) VALUES(?,?,?,?,sysdate)";
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getPost_num());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO getPost(String code) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="SELECT post_num, writer, title, content, write_date FROM Board WHERE post_num=?";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				BoardDTO post=new BoardDTO();
				post.setPost_num(rs.getInt(1));
				post.setWriter(rs.getString(2));
				post.setTitle(rs.getString(3));
				post.setContent(rs.getString(4));
				post.setWrite_date(rs.getString(5));				
				return post;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<BoardDTO> getAllBoardDatas(){
		List<BoardDTO> list = new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql = "select * from Board order by post_num asc";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
				dto.setPost_num(rs.getInt("post_num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrite_date(rs.getString("write_date"));
				list.add(dto);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public int getBoardCount() {
		int count=0;
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="select count(*) from board";
		try {
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}	
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	
	public void update(String code, String title, String content) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="UPDATE board SET title = ?, content = ? WHERE post_num = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, code);
			rs=pstmt.executeQuery();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(int code) { // bbsAvailable = 0 하면 삭제처리됨
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
        String SQL = "delete from board WHERE post_num = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL); // conn객체를 이용 SQL문장을 실행준비로 만듬
            pstmt.setInt(1,  code);
            pstmt.executeUpdate(); // 성공적으로 수행시 0이상의 값을 반환
        } catch(Exception e) {
            e.printStackTrace();
        }
    }   
}
