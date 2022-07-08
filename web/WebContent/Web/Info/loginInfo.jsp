<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String user_id = "";
	String user_pw = "";
	String user_name = "";
	
	user_id = request.getParameter("id"); //ID값 가져옴
	user_pw = request.getParameter("pw"); //PW값 가져옴
	//여기서 부터 DB 연결 코드
	Connection conn = null;
	String driverName="oracle.jdbc.driver.OracleDriver";
	Class.forName(driverName);
	String serverName = "localhost";
	String serverPort = "1521";
	String sid = "orcl";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userName = "WebD";
	String userPassword = "web";
	conn = DriverManager.getConnection(url, userName, userPassword);
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from MEMBER where id = '" + user_id + "' AND pw ='" + user_pw + "'");
	Boolean check = false;
	String id=""; 
	String pw="";
	String name="";
	while(rs.next()) // 결과값을 하나씩 가져와서 저장하기 위한 while문
	{
		id = rs.getString("id"); //DB에 있는 ID가져옴
		pw = rs.getString("pw"); //DB에 있는 pw가져옴
		name = rs.getString("name"); // 사용자 이름 가져옴

		check = true;	
	}
	if(check){ //ID,PW가 DB에 존재하는 경우 게시판으로 이동하는 코드 
			response.sendRedirect("../home.jsp?Name="+name+"&ID="+id);
	    	rs.close();
	       	conn.close();
		}   else  { //ID,PW가 일치하지 않는 경우
	     %>
	<script>
	alert("ID 또는 PW를 잘못 입력했습니다.");
	document.location.href='../login.jsp'
	</script>
	<%  }
%>
</body>
</html>