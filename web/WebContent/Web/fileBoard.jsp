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
<title>자료 취합 게시판</title>
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
	<h2 class="subtitle" style="padding-top:50px !important; ">자료 취합 게시판</h2>
				<%
					FileBoardDAO dao = new FileBoardDAO();
					List<FileBoardDTO> result = dao.getAllBoardDatas();
					//System.out.println(result.size());
				%>
				<table style="text-align: center; border: 1px solid #dddddd ; width: 100%; height: 600px;">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>날짜</th>
						<th>작성자</th>
						<th>내용</th>
					</tr>
				</thead>
					<tbody>
						<%for(int i=0; i< result.size(); i++){%>
							 <tr>
							 <td><%=result.get(i).getPost_num() %></a></td>
							 <td><a href="post.jsp?Name=<%=name%>&ID=<%=id%>&Num=<%=result.get(i).getPost_num() %>"><%=result.get(i).getTitle() %></a></td>
						     <td><%=result.get(i).getWrite_date() %></td>
						     <td><%=result.get(i).getWriter() %></td>
						     <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;max-width:280px; padding:20px;"><%=result.get(i).getContent() %></td>
						     </tr>
						<%	 
						} 
						%>
					</tbody>
				</table>
				<hr>
				<input type="button" onClick="location.href='filePostWrite.jsp?Name=<%=name%>&ID=<%=id%>'" value="글쓰기">
	</section>
	<%@include file ="footer.jsp" %>
</body>
</html>