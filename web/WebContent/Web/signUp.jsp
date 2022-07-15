<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="company.CompanyDAO"%>
<%@ page import="company.CompanyDTO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<%
		CompanyDAO dao = new CompanyDAO();
		
		List<CompanyDTO> result = dao.getAllBoardDatas();
	%>
	<form action="./Info/signUpInfo.jsp" method="post" enctype="multipart/form-data">
		아이디:<input type="text" name="id"><br/>
		비밀번호:<input type="password" name="pw"><br/>
		이름:<input type="text" name="name"><br/>
		전화번호:
		<select name="phone1">
			<option>010</option>
			<option>02</option>
			<option>031</option>
			<option>051</option>
		</select>
		- <input type="text" name="phone2" size="5">
		- <input type="text" name="phone3" size="5">
		
		<br/>
		이메일:<input type="text" name="email" >
		@
		<select name="com">
			<option>naver.com</option>
			<option>gmail.com</option>
			<option>daum.com</option>
			<option>kakao.com</option>
		</select>
		<br/>
		회사 : <select name="rank" id="rank" >
			<%for(int i=0; i< result.size(); i++){%>
				<option value=<%=result.get(i).getCompany_name()%>><%=result.get(i).getCompany_name()%></option>
			<%	 
			} 
			%>
			</select>
		<input type="button" onClick="location.href='login.jsp'" value="취소">
		<input type="submit" value="회원가입">
		
		
	</form>
</body>
</html>