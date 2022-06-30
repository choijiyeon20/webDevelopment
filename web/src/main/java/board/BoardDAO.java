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
				System.out.println("����Ŭ����̹� ����");
		} catch(ClassNotFoundException e){
			// TODO Auto-generated catch block
			System.out.println("����Ŭ����̹� ����");
		}
	}
	/////////////connection
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			conn=DriverManager.getConnection(url, "WebD", "web");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Ŀ�ؼǽ���");
		}
		
		return conn;
	}
	
	public void write(BoardDTO dto) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO Board(post_num, write, title, content, write_date) VALUES(?,?,?,?,sysdate)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
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
		String SQL="SELECT post_num, write, title, content, write_date FROM Board WHERE post_num=?";
		
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
	
	public List<BoardDTO> getAllPostDatas(){
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
				dto.setTitle(rs.getString("post_title"));
				dto.setContent(rs.getString("post_content"));
				dto.setWrite_date(rs.getString("write_date"));
				list.add(dto);	
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
