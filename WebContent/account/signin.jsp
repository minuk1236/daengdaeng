<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이 사이트 입니다.</title>
<link href="/DaengDaeng/resources/css/style.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
	
<script type="text/javascript" src="/DaengDaeng/resources/js/signinValidation.js"></script>	
	
</head>
<body style="background-color: #FEEEE9">

	<%@include file="../header.jsp"%>
	
	<br>
	<div class="container" >
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4" style="border: 2px solid grey; border-radius: 2rem;">
			<br>
			<form action="signinProcess.jsp" method="post" name="signin">
				<div class="form-group">
					<label for="id">아이디</label> 
					<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-group">
					<label for="password">비밀번호</label> 
					<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요.">
				</div>
				<button type="button" class="btn btn-danger btn-rounded waves-effect btn-lg btn-block" onclick="check()">로그인</button>
			</form>
			
			<hr style="border: solid 2px gray;">
			
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<a href="/DaengDaeng/account/findUserId.jsp" class="badge badge-light" style="border: 1px solid palevioletred;">아이디찾기</a> 
				<a href="/DaengDaeng/account/findUserPassword.jsp" class="badge badge-light" style="border: 1px solid palevioletred;">비밀번호찾기</a>
				<a href="/DaengDaeng/account/signup.jsp" class="badge badge-light" style="border: 1px solid palevioletred;">회원가입</a>
			</div>
			<br>
		</div>
		<div class="col-md-4"></div>
	</div>
	</div>
<%@include file="../footer.jsp"%>
</body>
</html>