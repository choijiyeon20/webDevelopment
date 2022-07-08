<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
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
	
	BoardDTO dto=new BoardDTO();
	BoardDAO dao = new BoardDAO();
	dto.setPost_num(dao.getBoardCount()+1);
	dto.setWriter(writer);
	dto.setTitle(title);
	dto.setContent(content);
	
	
	dao.write(dto);
	response.sendRedirect("../board.jsp?Name="+name+"&ID="+writer);

%>
</body>
</html>