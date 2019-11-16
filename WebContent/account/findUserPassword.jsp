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
	<div class="container">
		<form action="#" method="post">
			<p>아이디 <input type="text" id="id" name="id" required="required"> </p>
			<p>이름 <input type="text" id="name" name="name" required="required"> </p>
			<p>생년월일  <input type="text" id="birth" name="birth" required="required"	> </p>
			
			<input type="button" name="find" value="find">
			<input type="button" name="cancel" value="cancel">
		</form>
	</div>
	<a href="/DaengDaeng/index.jsp">돌아가기</a>
</body>
</html>