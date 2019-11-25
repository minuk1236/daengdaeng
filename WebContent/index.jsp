<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댕댕이 사이트 입니다.</title>
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

	<%@include file="header.jsp"%>
<div class="container" >
	<div class="row">
		<div class="col-md-12">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active" data-interval="1000">
						<img src="/DaengDaeng/resources/images/1.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-interval="1000">
						<img src="/DaengDaeng/resources/images/2.png" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-interval="1000">
						<img src="/DaengDaeng/resources/images/3.png" class="d-block w-100" alt="...">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev"> 
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>

	<br><br>

	<div class="row">
		<div class="card-deck">
			<div class="card">
				<img src="/DaengDaeng/resources/images/ad1.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">댕댕스1번</h5>
					<p class="card-text">멍멍멍멍</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img src="/DaengDaeng/resources/images/ad2.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">댕댕스2번</h5>
					<p class="card-text">멍멍멍멍</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
			<div class="card">
				<img src="/DaengDaeng/resources/images/ad3.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">댕댕스3번</h5>
					<p class="card-text">멍멍멍멍</p>
					<p class="card-text">
						<small class="text-muted">Last updated 3 mins ago</small>
					</p>
				</div>
			</div>
		</div>
	</div>

	<br><br><br>
</div>
	<%@include file="footer.jsp"%>
</body>
</html>