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
<link rel="stylesheet" href="style.css">
<title>자료 취합 게시글</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("Name");
		String id=request.getParameter("ID");
		String num=request.getParameter("Num");
		//System.out.println(num);
	%>
	<jsp:include page="./header.jsp">  
	<jsp:param name="Name" value="<%=name %>"/>  
	<jsp:param name="ID" value="<%=id%>"/>  
	</jsp:include>
	<section>
	<h2 class="subtitle" style="padding-top:50px !important; ">자료 취합 게시글</h2>
<%
					
					FileBoardDTO dto = new FileBoardDAO().getPost(num);
					
					//System.out.println(result.size());
				%>
				<br>
				<table style="text-align: center; border: 1px solid #dddddd ; width: 100%; height: 500px;">
				
						 <tr>
						 	<td style="width: 10%;  height: 10%;">제목</td>
						 	<td><%=dto.getTitle() %></td>
						 </tr>
					     <br>
					     <tr>
					     	<td style="width: 10%;  height: 10%;">날짜</td>
					     	<td><%=dto.getWrite_date() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td style="width: 10%;  height: 10%;">작성자</td>
					     	<td><%=dto.getWriter() %></td>
					     </tr>
					     <br>
					     <tr>
					     	<td>내용</td>
					     	<td><%=dto.getContent() %></td>
					     </tr>		
					     <tr>
					     	<td style="width: 10%;  height: 10%;">파일 취합대상</td>
					     	<td><%=dto.getCompany_name() %></td>
					     </tr>		
						<tr>
					     	<td style="width: 10%;  height: 10%;">제출기한</td>
					     	<td><%=dto.getDeadline() %></td>
					     </tr>    
				</table>
				<br>
				<hr>
				<div style="text-align:right;">
					<input type="button"  onClick="location.href='fileBoard.jsp?Name=<%=name%>&ID=<%=id%>'" value="목록으로 돌아가기">
					<input type="button" onClick="location.href='filePostWrite.jsp?Name=<%=name%>&ID=<%=id%>'" value="글쓰기">
				</div>
	</section>
	<%@include file ="footer.jsp" %>				
</body>
</html>