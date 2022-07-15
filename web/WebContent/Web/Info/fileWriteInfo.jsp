<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="fileBoard.FileBoardDTO"%>
<%@page import="fileBoard.FileBoardDAO"%>
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
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("Name");
	String writer = request.getParameter("ID");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String deadline = request.getParameter("deadline");
	String company_name = request.getParameter("company_name");
	
	FileBoardDTO dto=new FileBoardDTO();
	FileBoardDAO dao = new FileBoardDAO();
	dto.setPost_num(dao.getBoardCount()+1);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	dto.setDeadline(deadline);
	dto.setCompany_name(company_name);
	
	
	dao.write(dto);
	response.sendRedirect("../fileBoard.jsp?Name="+name+"&ID="+writer);

%>
</body>
</html>