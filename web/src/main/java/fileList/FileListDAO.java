package fileList;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import fileList.FileListDTO;

public class FileListDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:XE";
	
	public FileListDAO() {
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
		
		try {
			conn=DriverManager.getConnection(url, "WebD", "web");
		}catch(SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("커넥션실패");
		}
		
		return conn;
	}
	
	public void write(FileListDTO dto) {
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		
		String sql="INSERT INTO filelist(file_num, post_num, file_name, path, file_size, sub_date, submit_id) VALUES(?,?,?,?,?,sysdate,?)";
		try {
			
			// 1) 쿼리문장분석 2) 컴파일 3) 실행
			// vs Statement
			// 캐시 여부 => PreparedStatement 1)~3) 최초한번 실행 하고 캐시에 저장
			// Statement 매번 1)~3) 실행
			
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getFile_num());
			pstmt.setInt(2, dto.getPost_num());
			pstmt.setString(3, dto.getFile_name());
			pstmt.setString(4, dto.getPath());
			pstmt.setInt(5, dto.getFile_size());
			pstmt.setString(6, dto.getSubmit_id());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private List<FileListDTO> makeFileList(ResultSet rs) throws SQLException{
		List<FileListDTO> fileList = new ArrayList<>();
		while(rs.next()) {
			int file_num = rs.getInt("file_num");
			int post_num = rs.getInt("post_num");
			String file_name = rs.getString("file_name");
			String path = rs.getString("path");
			int file_size = rs.getInt("file_size");
			String sub_date = rs.getString("sub_date");
			String submit_id = rs.getString("submit_id");
			
			
			FileListDTO file = new FileListDTO(file_num, post_num, file_name, path, file_size, sub_date, submit_id);
			fileList.add(file);
		}//while----
		return fileList;
	}
	public List<FileListDTO> fileSet(int num)
	throws SQLException{
		try {		
			conn=null;
			pstmt = null;
			conn = getConnection();
			String sql="select * from filelist where post_num like ?";
			//System.out.println(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			return makeFileList(rs);
			
			
		}finally {
			conn.close();
		}
	}
	public int getFileListCount() {
		int count=0;
		conn=null;
		pstmt = null;
		
		conn=getConnection();
		String SQL="select count(*) from filelist";
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
