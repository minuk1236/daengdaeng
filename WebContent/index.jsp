<%@page import="java.net.URLEncoder"%>
<%@page import="dto.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
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
						<img src="/DaengDaeng/resources/images/dog1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-interval="1000">
						<img src="/DaengDaeng/resources/images/dog2.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item" data-interval="1000">
						<img src="/DaengDaeng/resources/images/dog3.jpg" class="d-block w-100" alt="...">
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
			<%
							BoardDAO boardDAO = BoardDAO.getInstance();
							ArrayList<BoardBean> list = boardDAO.getList(4, 1);
							
							for(int i = 0 ; i< list.size(); i++){
								if(i == 4) break;
								String src = "/DaengDaeng/resources/upload/" + list.get(i).getNoticeFileRealName();
						%>
						<div class="card">
							<img src="<%=src %>" class="card-img-top img_size" alt="...">
		                    <div class="card-body">
			                    <h5 class="card-title"><a href="/DaengDaeng/board/daengDetail.jsp?noticeNum=<%=URLEncoder.encode(String.valueOf(list.get(i).getNoticeNum()),"utf-8")  %>" style="color: #000000; text_decoration: none;"><%=list.get(i).getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></h5>
			                    <p class="card-text"><%=list.get(i).getNoticeWirter() %></p>
			                    <p class="card-text"><small class="text-muted"><%=list.get(i).getNoticeCreateDate() %></small></p>
		                	</div>
		                </div>
		                
                	<%
							}
                	%>
		</div>
	</div>

	<br><br><br>
</div>
	<%@include file="footer.jsp"%>
</body>
</html>