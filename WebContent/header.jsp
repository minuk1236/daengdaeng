<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이 Header</title>
<link href="/DaengDaeng/resources/css/style.css" rel="stylesheet" type="text/css">
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
</head>
<body style="background-color: #FEEEE9">
	<%
		//세션 가져오기
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<img id="icon2" src="/DaengDaeng/resources/images/daengdaeng.png" style="margin-right: 350px;"> 
					<h1 style="text-align: center; margin-top: 30px; font-size: 60px;"><a href="/DaengDaeng/index.jsp" style="color: #212529">댕댕이</a></h1>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
					<%
						if(userID == null){
					%>
						<a href="/DaengDaeng/account/signin.jsp"><button type="button" class="btn btn-outline-danger" style="height: 40px; margin-top: 30px;">로그인</button></a>
						<a href="/DaengDaeng/account/signup.jsp"><button type="button" class="btn btn-outline-danger" style="height: 40px; margin-top: 30px; margin-left: 20px;">회원가입</button></a>
					<%	
						}else{
					%>
						<a href="/DaengDaeng/account/mypage.jsp"><button type="button" class="btn btn-outline-danger" style="height: 40px; margin-top: 30px;">마이페이지</button></a>
						<a href="/DaengDaeng/account/signout.jsp"><button type="button" class="btn btn-outline-danger" style="height: 40px; margin-top: 30px; margin-left: 20px;">로그아웃</button></a>
					<%
						}
					%>
					
				</div>
				<hr>
				<nav class="nav d-flex justify-content-between">
					<a class="p-2 text-muted" href="/DaengDaeng/board/notice.jsp"><h1>공지사항</h1></a>
					<a class="p-2 text-muted" href="/DaengDaeng/board/community.jsp"><h1>커뮤니티</h1></a>
					<a class="p-2 text-muted" href="/DaengDaeng/board/daengdaenggallery.jsp"><h1>댕댕이 갤러리</h1></a>
					<a class="p-2 text-muted" href="/DaengDaeng/board/adoptandmissing.jsp"><h1>분양 및 실종</h1></a>
					<a class="p-2 text-muted" href="/DaengDaeng/board/shareandsale.jsp"><h1>나눔 및 판매</h1></a>
				</nav>
				<hr>
			</div>
		</div>
	</div>
	<div class="row"></div>
	<div class="row"></div>
</body>
</html>