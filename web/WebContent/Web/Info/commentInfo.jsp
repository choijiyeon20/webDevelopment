<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="comment.CommentDTO"%>
<%@page import="comment.CommentDAO"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>Insert title here</title>
</head>
<body>
<%	
	request.setCharacterEncoding("utf-8");
	String num = request.getParameter("Num");
	String id = request.getParameter("ID");
	String name = request.getParameter("Name");
	String content = request.getParameter("context");
	
	
	CommentDTO dto=new CommentDTO();
	CommentDAO dao=new CommentDAO();
	
	dto.setComment_num(dao.getCommentCount()+1);
	dto.setPost_num(Integer.parseInt(num));
	dto.setComment_writer(id);
	dto.setComment_content(content);
	
	dao.write(dto);
	response.sendRedirect("../board.jsp?Name="+name+"&ID="+id);

%>
</body>
</html>