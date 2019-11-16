<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이 사이트 입니다.</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<h3>로그인 화면</h3>
	
	<form action="#" method="post">
		<p>아이디 : <input type="text" id="id" name="id" required="required"> </p>
		<p>비밀번호 : <input type="password" id="password" name="password" required="required"> </p>
		<input type="button" name="signin" value="로그인">
	</form>
	<hr>
	<a href="./findUserId.jsp">아이디 찾기</a> 
	<a href="./findUserPassword.jsp">비밀번호 찾기</a>
	<a href="./signup.jsp">회원가입</a>
	<hr><br>
	<a href="/DaengDaeng/index.jsp">돌아가기</a>
</body>
</html>