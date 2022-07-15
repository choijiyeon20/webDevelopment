package fileBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.BoardDTO;

public class FileBoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public FileBoardDAO() {
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
	
	public void write(FileBoardDTO dto) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO fileBoard(post_num, writer, title, content, write_date, deadline, company_name) VALUES(?,?,?,?,sysdate,?,?)";
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
			pstmt.setString(5, dto.getDeadline());
			pstmt.setString(6, dto.getCompany_name());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public FileBoardDTO getPost(String code) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="SELECT post_num, writer, title, content, write_date, deadline, company_name FROM fileBoard WHERE post_num=?";
		
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,code);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				FileBoardDTO post=new FileBoardDTO();
				post.setPost_num(rs.getInt(1));
				post.setWriter(rs.getString(2));
				post.setTitle(rs.getString(3));
				post.setContent(rs.getString(4));
				post.setWrite_date(rs.getString(5));
				post.setDeadline(rs.getString(6));
				post.setCompany_name(rs.getString(7));
				return post;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<FileBoardDTO> getAllBoardDatas(){
		List<FileBoardDTO> list = new ArrayList<>();
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql = "select * from fileBoard order by post_num asc";
		
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				FileBoardDTO dto = new FileBoardDTO();
				
				dto.setPost_num(rs.getInt("post_num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setWrite_date(rs.getString("write_date"));
				dto.setDeadline(rs.getString("deadline"));
				dto.setCompany_name(rs.getString("company_name"));
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
		String SQL="select count(*) from fileboard";
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
}
