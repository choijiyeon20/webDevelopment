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
<title>자료 통합 게시글쓰기</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("Name");
		String id=request.getParameter("ID");
		
		CompanyDAO dao = new CompanyDAO();
		
		List<CompanyDTO> result = dao.getAllBoardDatas();
	%>
	<jsp:include page="./header.jsp">  
	<jsp:param name="Name" value="<%=name %>"/>  
	<jsp:param name="ID" value="<%=id%>"/>  
	</jsp:include>
	<section>
	<h2 class="subtitle" style="padding-top:50px !important; ">자료 통합 게시글 쓰기</h2>
<div>
	<form action="./Info/fileWriteInfo.jsp">
    	<input type="hidden" id="ID" name="ID" value="<%=id%>">
    	<input type="hidden" id="Name" name="Name" value="<%=name %>">
    	<p>
        	<strong>제목(통합 파일 주제) : </strong>
            <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" style="width: 80%;">
        </p>
        <p>
            <strong>내용</strong>
            <textarea id="txtContent" name="content" id="content" rows="10" cols="100" style="width: 100%; height: 300px;"></textarea>
        </p>
		<p>
			<strong>파일 취합대상</strong>
			회사 : <select id="company_name" name="company_name" >
			<%for(int i=0; i< result.size(); i++){%>
				<option value=<%=result.get(i).getCompany_name()%>><%=result.get(i).getCompany_name()%></option>
			<%	 
			} 
			%>
			</select>
			
			<strong>제출기한</strong>
			<input type="date" name="deadline">
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