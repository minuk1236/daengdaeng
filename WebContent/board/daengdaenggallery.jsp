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
		<div class="col-md-12"> 
			<div class="card-deck">
				<div class="card">
					<img src="/DaengDaeng/resources/images/dog1.jpg" class="card-img-top img_size" alt="...">
                    <div class="card-body">
	                    <h5 class="card-title">댕댕스1번</h5>
	                    <p class="card-text">멍멍멍멍</p>
	                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                	</div>
                </div>
                <div class="card">
                	<img src="/DaengDaeng/resources/images/dog2.jpg" class="card-img-top img_size" alt="..."> 
                		<div class="card-body">
                        	<h5 class="card-title">댕댕스2번</h5>
                        	<p class="card-text">멍멍멍멍</p>
                        	<p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                </div>
                <div class="card"> 
                	<img src="/DaengDaeng/resources/images/dog3.jpg" class="card-img-top img_size" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">댕댕스3번</h5>
	                    <p class="card-text">멍멍멍멍</p>
	                    <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                <div class="card">
                	<img src="/DaengDaeng/resources/images/dog3.jpg" class="card-img-top img_size" alt="...">
                    <div class="card-body">
                    	<h5 class="card-title">댕댕스3번</h5>
                        <p class="card-text">멍멍멍멍</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                    </div>
                </div>
                </div>
                <br><br>
                <div class="card-deck">
                    <div class="card">
                        <img src="/DaengDaeng/resources/images/dog1.jpg" class="card-img-top img_size" alt="...">
                        <div class="card-body">
                        <h5 class="card-title">댕댕스1번</h5>
                        <p class="card-text">멍멍멍멍</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="/DaengDaeng/resources/images/dog2.jpg" class="card-img-top img_size" alt="...">
                        <div class="card-body">
                        <h5 class="card-title">댕댕스2번</h5>
                        <p class="card-text">멍멍멍멍</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="/DaengDaeng/resources/images/dog3.jpg" class="card-img-top img_size" alt="...">
                        <div class="card-body">
                        <h5 class="card-title">댕댕스3번</h5>
                        <p class="card-text">멍멍멍멍</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                    <div class="card">
                        <img src="/DaengDaeng/resources/images/dog3.jpg" class="card-img-top img_size" alt="...">
                        <div class="card-body">
                        <h5 class="card-title">댕댕스3번</h5>
                        <p class="card-text">멍멍멍멍</p>
                        <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                        </div>
                    </div>
                </div>
                
                <br><br>
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