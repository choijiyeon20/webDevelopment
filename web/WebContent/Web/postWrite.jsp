<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글쓰기</title>
</head>
<body>
<div>
	<form action="../jsp/postWrite.jsp">
    	<p>
        	<strong>제목 : </strong>
            <input type="text" name="title" id="title" placeholder="제목을 입력해주세요" style="width: 90%;">
        </p>
        <p>
            <strong>내용 : </strong>
            <textarea id="txtContent" name="content" id="content" rows="10" cols="100" style="width: 100%; height: 600px;"></textarea>
        </p>

        <hr>
        <input type="button" value="목록으로 돌아가기">
        <input type="submit" value="글쓰기">
    </form>
</div>
</body>
</html>