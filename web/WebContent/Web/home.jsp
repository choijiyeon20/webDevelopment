<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<title>메인 홈</title>
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
	<h2 class="subtitle" style="padding-top:50px !important; ">메인홈</h2>
	<h4>메인화면 입니다.</h4>
	</section>
	<%@include file ="footer.jsp" %>
	
</body>
</html>