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
	
<script type="text/javascript" src="/DaengDaeng/resources/js/signupValidation.js"></script>

</head>
<body style="background-color: #FEEEE9">

	<%@include file="../header.jsp"%>
	<div class="container" >
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="border: 2px solid grey; border-radius: 2rem;">
			<br>
			<form action="signupProcess.jsp" method="post" name="signform">
				<div class="form-group row">
					<label for="id" class="col-sm-2 col-form-label">아이디</label>
					<div class="col-sm-8">
						<input type="text" class="form-control" id="id" name="id" placeholder="아이디를 입력해주세요.">
					</div>
					<div class="col-sm-2">
						<!-- 이 중복확인 버튼 db로 넘겨서검사해야 할거같아서 submit으로 해야하는데 밑에 회원가입이랑 submit이 겹처서 아마 안될거야 자바스크립트로 검사할수밖에 없을거같아서 일단a태그로 처리해놨어 -->
						<button type="button" class="btn btn-secondary" id="idCheck" onclick="checkId()">중복확인</button>
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호를 입력해주세요. (대 소문자 숫자 포함 6~12자리)">
					</div>
				</div>
				<div class="form-group row">
					<label for="passwordCheck" class="col-sm-2 col-form-label" style="font-size: 15px">비밀번호 확인</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="다시 비밀번호를 입력해주세요.">
					</div>
				</div>
				<div class="form-group row">
					<label for="name" class="col-sm-2 col-form-label">이름</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="name" name="name" placeholder="이름을 입력해주세요.">
					</div>
				</div>
				<div class="form-group row">
					<label for="birth" class="col-sm-2 col-form-label">생년월일</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 8자리를 입력해주세요 ex) 19960329">
					</div>
				</div>

				<fieldset class="form-group">
					<div class="row">
						<legend class="col-form-label col-sm-2 pt-0">성별</legend>
						<div class="col-sm-10">
							<div class="form-check form-check-inline">
								<label class="form-check-label" for="mail">남성 </label>
								<input class="form-check-input" type="radio" name="gender" id="mail" value="mail">
							</div>
							<div class="form-check form-check-inline">
								<label class="form-check-label" for="femail">여성 </label>
								<input class="form-check-input" type="radio" name="gender" id="femail" value="femail">
							</div>
						</div>
					</div>
				</fieldset>
				
				<div class="form-group row">
					<label for="email" class="col-sm-2 col-form-label">이메일</label>
					<div class="col-sm-10">
						<input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력해주세요.">
					</div>
				</div>
				<div class="form-group row">
					<label for="phone" class="col-sm-2 col-form-label">연락처</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="phone" name="phone" placeholder="연락처를 입력해주세요. (-를 제외)">
					</div>
				</div>

				<div class="row">
					<div class="col-sm-6">
						<button type="button" class="btn btn-danger btn-rounded waves-effect btn-lg btn-block" onclick="checkSignup()">가입하기</button>
					</div>
					<div class="col-sm-0"></div>
					<div class="col-sm-6">
						<button type="reset" class="btn btn-secondary btn-rounded waves-effect btn-lg btn-block">취소</button>
					</div>
				</div>

			</form>
			<hr style="border: solid 2px gray;">
			<br>

		</div>
		<div class="col-md-2"></div>
	</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>