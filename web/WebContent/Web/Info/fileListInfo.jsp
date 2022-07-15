<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="fileBoard.FileBoardDTO"%>
<%@page import="fileBoard.FileBoardDAO"%>
<%@page import="fileList.FileListDTO"%>
<%@page import="fileList.FileListDAO"%>
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
	
	
	FileListDTO dto=new FileListDTO();
	FileListDAO dao=new FileListDAO();
	
	dto.setFile_num(dao.getFileListCount()+1);
	dto.setPost_num(Integer.parseInt(num));
	dto.setFile_name("");
	
	dao.write(dto);
	response.sendRedirect("../board.jsp?Name="+name+"&ID="+id);

%>
</body>
</html>