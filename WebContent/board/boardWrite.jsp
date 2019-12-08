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
	<%
		//세션얻기
		//String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null){
			out.println("<script>");
			out.println("alert('로그인을 하세요.')");
			out.println("location.href = '/DaengDaeng/account/signin.jsp'");
			out.println("</script>");
		}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="">
					<br>
					<br>
					<div>
						<table class="table table-striped table-bordered table-hover ">
							<tbody align="center">
								<form method="post" action="writeProcess.jsp" enctype="multipart/form-data">
									<div class="card" style="padding-bottom: 50px;">
										<div class="card-body">
											<div class='form-group'>
												<label for="title" style="color: black;">제목:</label>
												<input type="text" name="title" id="title" class="form-control" style="width: 50%" placeholder="제목을 입력하세요" />
											</div>

											<div class='form-group' style="height: 200px">
												<label for="contents" style="color: black;">내용:</label>
												<textarea name="contents" id="contents" class="form-control" style="height: 150px"></textarea>
											</div>

											<div class="form-group" style="border: 1px solid gray">
												<input type="file" class="form-control-file" id="file" name="file">
											</div>
										</div>
									</div>

									<br>
									<br>

									<div class="text-center">
										<input style="font-weight: bold;" type="submit" value="작성" class="btn btn-danger">
									</div>
								</form>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>