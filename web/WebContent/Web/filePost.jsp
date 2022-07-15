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
				<hr>
				<br>
				<form action="./Info/fileListInfo.jsp">
					<table style="text-align: center; border: 1px solid #dddddd; width:100%;" >
						<tr>	
							<input type="hidden" id="ID" name="ID" value="<%=id%>">
    						<input type="hidden" id="Name" name="Name" value="<%=name %>">
    						<input type="hidden" id="Num" name="Num" value="<%=num %>">
							<td><input type="text" style="height:50px; width:700px;" class="form-control" placeholder="파일 설명을 남겨주세요." name="context">
								<input type="file" name="file">
							</td>
							<td><br><br><input type="submit"  value="파일 올리기"></td>
						</tr>
					</table>
				</form>
				<hr>
				<table style="text-align: center; border: 1px solid #dddddd; width:100%;">
					<tbody>
						<tr>
							<td>자료 취합 목록</td>
						</tr>
					<tr>
						<%
							FileListDAO cdao = new FileListDAO();
							List<FileListDTO> result = cdao.fileSet(Integer.parseInt(num));
							for(int i=0; i<result.size(); i++){
						%>
						<div class="container">
							<div class="row">
								<table  style="text-align: center; border: 1px solid #dddddd">
									<tbody>
										<tr>
											<tr>
												<td><%=result.get(i).getSubmit_id()%></td>
												<td rowspan="2" style="padding:30px;"><%=result.get(i).getFile_name() %></td>
											</tr>
											<tr>
												<td style="width: 10%;"><%=result.get(i).getSub_date() %></td>
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