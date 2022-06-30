<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String email = request.getParameter("email");
	String com = request.getParameter("com");
	String rank = request.getParameter("rank");
	
	MemberDTO dto=new MemberDTO();
	
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setPhone1(phone1);
	dto.setPhone2(phone2);
	dto.setPhone3(phone3);
	dto.setEmail(email);
	dto.setCom(com);
	dto.setRank(rank);
	
	MemberDAO dao = new MemberDAO();
	
	dao.signuplnsert(dto);
	
	
	if(dao.loginCheckId(id)){
		out.println("<script>");
		out.println("alert('아이디가 중복됩니다. 다른 아이디를 선택해주세요')");
		response.sendRedirect("../signUp.jsp");
		out.println("</script>");

	}
	else{
		response.sendRedirect("../home.jsp?Name="+name+ "&ID=" +id);
	}
%>
</body>
</html>