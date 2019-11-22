<%@page import="dao.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복 확인 체크</title>
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
</head>

<body>
	<%
		String id = request.getParameter("id");
		User user = User.getInstance();
		boolean result = user.confirmId(id);

		if (result) {
	%>

	<center>
		<br> <br>
		<h5 style="font-size: 15px" >이미 사용중인 ID 입니다.</h5>
	</center>
	<%
		} else {
	%>
	<center>
		<br> <br>
		<h5 style="font-size: 15px">
			입력하신
			<%=id%>는 사용하실 수 있는 ID입니다.
		</h5>
	</center>
	<%
		}
	%>
	<div class="container">
		<button type="button" id="close" class="btn btn-outline-secondary btn-block" onclick="window.close()">닫기</button>
	</div>
	
</body>
</html>