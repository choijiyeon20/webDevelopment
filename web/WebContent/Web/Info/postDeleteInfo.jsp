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
	String num = request.getParameter("Num");
	
	BoardDTO dto=new BoardDTO();
	BoardDAO dao = new BoardDAO();
	dao.delete(Integer.parseInt(num));

	response.sendRedirect("../board.jsp?Name="+name+"&ID="+writer);

%>
</body>
</html>