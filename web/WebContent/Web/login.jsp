<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 화면</title>
</head>
<body>
	<h1>○○회사 웹사이트</h1>
	<form action="./Info/loginInfo.jsp">
		<div class="form-group">
				<label class="sr-only">User Name</label>
				<input name="id" class="form-control" placeholder="ID" required autofocus>
			</div>
			<div class="form-group">
				<label class="sr-only">Password</label>
				<input type="password" name="password" class="form-control" placeholder="Password" required>
			</div>
			<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
			<button class="btn btn-lg btn-secondary btn-block" type="button" onclick="location.href='signUp.jsp'">회원가입</button>
	</form>
</body>
</html>