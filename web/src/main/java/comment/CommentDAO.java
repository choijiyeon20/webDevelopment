package comment;

import java.sql.*;
import java.util.*;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public CommentDAO() {
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
		
		try {
			conn=DriverManager.getConnection(url, "WebD", "web");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Ŀ�ؼǽ���");
		}
		
		return conn;
	}
	
	public void write(CommentDTO dto) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO post_comment(comment_num, post_num, comment_writer, comment_write_date, comment_content) VALUES(?,?,?,sysdate,?)";
		try {
			
			// 1) ��������м� 2) ������ 3) ����
			// vs Statement
			// ĳ�� ���� => PreparedStatement 1)~3) �����ѹ� ���� �ϰ� ĳ�ÿ� ����
			// Statement �Ź� 1)~3) ����
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getComment_num());
			pstmt.setInt(2, dto.getPost_num());
			pstmt.setString(3, dto.getComment_writer());
			pstmt.setString(4, dto.getComment_content());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<CommentDTO> makeCommentList(ResultSet rs) throws SQLException{
		List<CommentDTO> commentList = new ArrayList<>();
		while(rs.next()) {
			int comnum = rs.getInt("comment_num");
			int postnum = rs.getInt("post_num");
			String id = rs.getString("comment_writer");
			String date = rs.getString("comment_write_date");
			String content = rs.getString("comment_content");
			
			CommentDTO comment = new CommentDTO(comnum, postnum, id, date, content);
			commentList.add(comment);
		}//while----
		return commentList;
	}
	public List<CommentDTO> commentSet(int num)
	throws SQLException{
		try {		
			conn=null;
			pstmt = null;
			conn = getConnection();
			String sql="select * from post_comment where post_num like ?";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			return makeCommentList(rs);
			
			
		}finally {
			conn.close();
		}
	}
	public int getCommentCount() {
		int count=0;
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="select count(*) from post_comment";
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
