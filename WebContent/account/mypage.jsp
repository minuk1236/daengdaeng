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
		<p>프로필 사진  <!-- 사진 들어가는 공간 --> 
		<input type="button" name="change" value="변경">
		<input type="button" name="delete" value="삭제"> </p>
		
		<p>이름 : 댕댕이 </p>
		
		<form action="#" method="post">
			<p> 비밀번호 <input type="password" id="password1" name="password1"> </p>
			<p> 비밀번호 확인 <input type="password" id="password2" name="password2"> 
				<input type="button" name="change" value="변경하기">
			</p>
		</form>
		
		<div class="container">
			<hr>
			<h4> 내가 작성한 글 들어가는 공간</h4>
			<hr>
		</div>
		
	</div>
	<a href="/DaengDaeng/index.jsp">돌아가기</a>
</body>
</html>