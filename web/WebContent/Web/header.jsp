<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<header>
			<div>
				<h1>○○회사</h1>
			</div>
			<%
				request.setCharacterEncoding("utf-8");
				String name=request.getParameter("Name");
				System.out.println(name);
			%>
			<div>
					<ul>
		    			<li><%=name %>님 환영합니다!</a></li>
		    			<li><a href="#">로그아웃</a></li>
		    		</ul>
			</div>
			<div>
				<nav>
					<ul>
		    			<li><a href="#">홈</a></li>
		    			<li><a href="#">자유 게시판</a></li>
		    			<li><a href="#">자료 취합 게시판</a></li>
	    			</ul>
    			</nav>
			</div>
		</header>
	</div>
</body>
</html>