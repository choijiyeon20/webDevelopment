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
<title>게시글</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("Name");
		String id=request.getParameter("ID");
		String num=request.getParameter("Num");
		System.out.println(num);
	%>
	<jsp:include page="./header.jsp">  
	<jsp:param name="Name" value="<%=name %>"/>  
	<jsp:param name="ID" value="<%=id%>"/>  
	</jsp:include>
	<section>
	<h2 class="subtitle" style="padding-top:50px !important; ">게시글</h2>
<%
					
					BoardDTO dto = new BoardDAO().getPost(num);
					
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
				</table>
				<br>
				<hr>
				<div style="text-align:right;">
				<%
					if(id.equals(dto.getWriter())){
						%>
							<input type="button"  onClick="location.href='postUpdate.jsp?Name=<%=name%>&ID=<%=id%>&Num=<%=dto.getPost_num()%>'" value="수정하기">
							<input type="button" onClick="location.href='./Info/postDeleteInfo.jsp?Name=<%=name%>&ID=<%=id%>&Num=<%=dto.getPost_num()%>'" value="삭제하기">
						<%
					}
				%>
					<input type="button"  onClick="location.href='board.jsp?Name=<%=name%>&ID=<%=id%>'" value="목록으로 돌아가기">
					<input type="button" onClick="location.href='postWrite.jsp?Name=<%=name%>&ID=<%=id%>'" value="글쓰기">
				</div>
				<hr>
				<br>
				<form action="./Info/commentInfo.jsp">
					<table style="text-align: center; border: 1px solid #dddddd; width:100%;" >
						<tr>	
							<input type="hidden" id="ID" name="ID" value="<%=id%>">
    						<input type="hidden" id="Name" name="Name" value="<%=name %>">
    						<input type="hidden" id="Num" name="Num" value="<%=num %>">
							<td><input type="text" style="height:50px; width:700px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name="context"></td>
							<td><br><br><input type="submit"  value="댓글 작성"></td>
						</tr>
					</table>
				</form>
				<hr>
				<table style="text-align: center; border: 1px solid #dddddd; width:100%;">
					<tbody>
						<tr>
							<td>댓글</td>
						</tr>
					<tr>
						<%
							CommentDAO cdao = new CommentDAO();
							List<CommentDTO> result = cdao.commentSet(Integer.parseInt(num));
							for(int i=0; i<result.size(); i++){
						%>
						<div class="container">
							<div class="row">
								<table  style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>
											<tr>
												<td><%=result.get(i).getComment_writer()%></td>
												<td rowspan="2" style="padding:30px;"><%=result.get(i).getComment_content() %></td>
											</tr>
											<tr>
												<td style="width: 10%;"><%=result.get(i).getComment_write_date() %></td>
											</tr>
										</tr>
									</tbody>
								</table>			
							</div>
						</div>
						<%
							}
						%>
				</tr>
				</table>
				
	</section>
	<%@include file ="footer.jsp" %>				
</body>
</html>