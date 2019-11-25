<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	<div class="container">
	<div id="wrap">
		<div class="row">
			<div class="col-md-12">
				<table class="table">
					<thead style="background-color: #E84164;">
						<tr>
							<th scope="col">번호</th>
							<th scope="col" >제목</th>
							<th scope="col">작성자</th>
							<th scope="col">작성일</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody style="background-color: white;">
						<tr>
							<th scope="row">3</th>
							<td>제목 3</td>
							<td>작성자 3</td>
							<td>2019-11-23</td>
							<td>99</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>제목 2</td>
							<td>작성자 2</td>
							<td>2019-11-10</td>
							<td>15</td>
						</tr>
						<tr>
							<th scope="row">1</th>
							<td>제목 1</td>
							<td>작성자 1</td>
							<td>2019-11-02</td>
							<td>53</td>
						</tr>
					</tbody>
				</table>
				<form action="">
					<div class="row">
						<div class="col-md-5"></div>
						<div class="col-md-2">
							<select class="custom-select">
							  <option value="title" selected>제목</option>
							  <option value="titlecontents">제목+내용</option>
							  <option value="writer">작성자</option>
							</select>
						</div>
						<div class="col-md-2">
							<!-- 검색부분은 submit 버튼이랑 input 칸 하나둬서 검색하게 할겡 -->
							<input type="text" class="form-control" id="exampleInputEmail1" placeholder="검색">
						</div>
						<div class="col-md-1">
							<button type="submit" class="btn btn-danger">검색</button>
						</div>
						<div class="col-md-2">
							<a href=""><button type="button" class="btn btn-danger">글쓰기</button></a>
						</div>
					</div>
				</form>


				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center font_color">
						<li class="page-item disabled">
						<a class="page-link font_color" href="#" tabindex="-1" aria-disabled="true">Previous</a></li>
						<li class="page-item"><a class="page-link font_color" href="#">1</a></li>
						<li class="page-item"><a class="page-link font_color" href="#">2</a></li>
						<li class="page-item"><a class="page-link font_color" href="#">3</a></li>
						<li class="page-item"><a class="page-link font_color" href="#">Next</a></li>
					</ul>
				</nav>
			</div>
		</div>
		</div>
		<%@include file="../footer.jsp"%>
</body>
</html>