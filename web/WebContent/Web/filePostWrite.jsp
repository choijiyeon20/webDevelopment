<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>자료 통합 게시글쓰기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("Name");
		String id=request.getParameter("ID");
	%>
	<jsp:include page="./header.jsp">  
	<jsp:param name="Name" value="<%=name %>"/>  
	<jsp:param name="ID" value="<%=id%>"/>  
	</jsp:include>
	<section>
	<h2 class="subtitle" style="padding-top:50px !important; ">자료 통합 게시글 쓰기</h2>
<div>
	<form action="./Info/writeInfo.jsp">
    	<input type="hidden" id="ID" name="ID" value="<%=id%>">
    	<input type="hidden" id="Name" name="Name" value="<%=name %>">
    	<p>
        	<strong>제목 : </strong>
            <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" style="width: 90%;">
        </p>
        <p>
            <strong>내용</strong>
            <textarea id="txtContent" name="content" id="content" rows="10" cols="100" style="width: 100%; height: 300px;"></textarea>
        </p>
		<p>
			<strong>파일</strong>
			<input type="file" name="file">
		</p>
        <hr>
        <input type="button"  onClick="location.href='fileBoard.jsp?Name=<%=name%>&ID=<%=id%>'" value="목록으로 돌아가기">
        <input type="submit" value="글쓰기">
    </form>
</div>
</section>
	<%@include file ="footer.jsp" %>
</body>
</html>