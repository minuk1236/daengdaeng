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
	<form name="loginForm" action="#" method="post">
		<p>아이디 : <input type="text" id="id" name="id" required="required" autofocus="autofocus">
				  <input type="button" id="doubleCheck" name="doubleCheck" value="중복확인"></p>
		
		<p>비밀번호 : <input type="password" id="password1" name="password1" required="required"></p>
		<p>비밀번호 확인 : <input type="password" id="password2" name="password2" required="required"></p>
		<p>이름 : <input type="text" id="name" name="name" required="required"> </p>
		<p>생년월일 : <input type="text" id="birth" name="birth" required="required"></p>
		<p>성별 : <input type="radio" name="sex" value="male"> 남성
				<input type="radio" name="sex" value="female"> 여성 </p>
		<p>이메일 : <input type="email" id="email" name="email" required="required"></p>
		<p>연락처 : <input type="text" id="phoneNum" name="phoneNum" maxlength="13" required="required"></p>
		
		<input type="button" value="가입하기">
		<input type="reset" value="취소">
	</form>
	<a href="/DaengDaeng/index.jsp">돌아가기</a>
</body>
</html>