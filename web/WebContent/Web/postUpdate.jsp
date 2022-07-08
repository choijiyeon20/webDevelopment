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
<title>게시글수정</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("Name");
		String id=request.getParameter("ID");
		String num=request.getParameter("Num");
		
		BoardDTO dto = new BoardDAO().getPost(num);
		
	%>
	<jsp:include page="./header.jsp">  
	<jsp:param name="Name" value="<%=name %>"/>  
	<jsp:param name="ID" value="<%=id%>"/>  
	</jsp:include>
	<section>
	<h2 class="subtitle" style="padding-top:50px !important; ">게시글 수정하기</h2>
<div>
	<form action="./Info/postUpdateInfo.jsp">
    	<input type="hidden" id="ID" name="ID" value="<%=id%>">
    	<input type="hidden" id="Name" name="Name" value="<%=name %>">
    	<input type="hidden" id="Num" name="Num" value="<%=dto.getPost_num() %>">
    	<p>
        	<strong>제목 : </strong>
            <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" style="width: 90%;" value="<%=dto.getTitle()%>">
        </p>
        <p>
            <strong>내용</strong>
            <textarea id="txtContent" name="content" id="content" rows="10" cols="100" style="width: 100%; height: 300px; value="<%=dto.getContent() %>"></textarea>
        </p>

        <hr>
        <input type="button"  onClick="location.href='board.jsp?Name=<%=name%>&ID=<%=id%>'" value="목록으로 돌아가기">
        <input type="submit" value="수정하기">
    </form>
</div>
</section>
	<%@include file ="footer.jsp" %>
</body>
</html>