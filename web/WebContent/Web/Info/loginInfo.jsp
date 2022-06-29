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
	String userName = "TEST_USER";
	String userPassword = "12345";
	conn = DriverManager.getConnection(url, userName, userPassword);
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery("select * from MEMBER where id = '" + user_id + "' AND pwd ='" + user_pw + "'");
	Boolean check = false;
	while(rs.next()) // 결과값을 하나씩 가져와서 저장하기 위한 while문
	{
		String id = rs.getString("ID"); //DB에 있는 ID가져옴
	    String name = rs.getString("NAME"); // 사용제 레벨 가져옴(필수 아님)
	    ///session.setAttribute("user_id", id); //DB값을 세션에 넣음
		///session.setAttribute("user_name", name); // 세션에 레벨값 넣음
		check = true;	
	}
	if(check){ //ID,PW가 DB에 존재하는 경우 게시판으로 이동하는 코드 
	%> 
	 		<script>
	  		document.location.href='../home.jsp'
	 		</script> <%
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