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
</head>
<body style="background-color: #FEEEE9">

	<%@include file="../header.jsp"%>
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<br> <br>
			<form>
				<div class="card" style="background-color: rgba(255, 238, 212, 0.445);">
					<div class="card-header" style="background-color: rgb(253, 77, 77);">
						<div class="row">
							<div class="col-sm-2" style="border-right: solid .5px white; text-align: center; color: white;">
								<h3 style="color: white;">Title</h3>
							</div>
							<div class="col-sm-9" style="color: white;">
								<h3 style="color: white;">제목이 표시되는 부분</h3>
							</div>
							<div>
								<a style="position: absolute; float: left; color: white; text-shadow: 1px 1px 1px gray; font-size: 13px; vertical-align: middle;">조회수</a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card-body" style="background-color: white; padding-bottom: 50px;">
					<h5 class="card-title" style="height: 400px;">
						<div class="row">
							<div class="col-sm-2" style="border-right: solid .5px; text-align: center; line-height: 400px;">Contents</div>
							<div class="col-sm-8">여기에 게시글 디테일 내용표시</div>
						</div>
					</h5>
					<hr style="border: solid .5px black;">
					<a style="float: right;" href="#" class="btn btn-danger"><strong>수정</strong></a>
					<a style="float: right;" href="">&nbsp;&nbsp;&nbsp;</a> 
					<a style="float: right;" href="#" class="btn btn-danger"><strong>삭제</strong></a>
					<h5 style="float: left; padding: 0 5px 0 0;">date</h5>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>