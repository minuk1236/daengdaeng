<%@page import="java.net.URLEncoder"%>
<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardBean"%>
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
		
		int noticeID = 0;
		if(request.getParameter("noticeNum") != null){
			noticeID = Integer.parseInt(request.getParameter("noticeNum"));
		}
		if(noticeID == 0){
			out.println("<script>");
			out.println("alert('유효하지 않는 글입니다.')");
			out.println("location.href = '/DaengDaeng/board/shareandsale.jsp'");
			out.println("</script>");
		}
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardBean boardBean = boardDAO.getBoard(noticeID);
		boardDAO.hit(noticeID);
		
	%>
	
<div class="container" >
	<div class="row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10">
			<br> <br>
			<form id="form" name="form" method="get" action="/DaengDaeng/downloadProcess">
				<div class="card" style="background-color: rgba(255, 238, 212, 0.445);">
					<div class="card-header" style="background-color: rgb(253, 77, 77);">
						<div class="row">
							<div class="col-sm-2" style="border-right: solid .5px white; text-align: center; color: white;">
								<h3 style="color: white;">제목</h3>
							</div>
							<div class="col-sm-9" style="color: white;">
								<h3 id="title" name="title" style="color: white;"><%=boardBean.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></h3>
							</div>
							<div>
								<a style="position: absolute; float: left; color: white; text-shadow: 1px 1px 1px gray; font-size: 13px; vertical-align: middle;">조회수 : <%=boardBean.getNoticeViewsnum() %></a>
							</div>
						</div>
					</div>
				</div>
				
				<div class="card-body" style="background-color: white; padding-bottom: 80px;">
					<h5 class="card-title" style="height: 400px;">
						<div class="row">
							<div class="col-sm-2" style="border-right: solid .5px; text-align: center; line-height: 400px;">내용</div>
							<div class="col-sm-8"><%=boardBean.getNoticeContents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
						</div>
					</h5>
					<hr style="border: solid .5px black;">
					
					<a style="float: right;" href="/DaengDaeng/board/shareandsale.jsp" class="btn btn-danger"><strong>목록</strong></a>
					<a style="float: right;" href="">&nbsp;&nbsp;&nbsp;</a> 
					<%
						if(userID != null && userID.equals(boardBean.getNoticeWirter())){
					%>
					<a style="float: right;" href="/DaengDaeng/DeleteProcess?noticeNum=<%=noticeID %>" class="btn btn-danger" onclick="return confirm('정말로 삭제하시겠습니까?')"><strong>삭제</strong></a>
					<a style="float: right;" href="">&nbsp;&nbsp;&nbsp;</a> 
					<a style="float: right;" href="/DaengDaeng/board/shareandsaleUpdate.jsp?noticeNum=<%=noticeID %>" class="btn btn-danger"><strong>수정</strong></a>
					<%
						}
					%>
					
					<h5 style="float: left; padding: 0 5px 0 0;">등록일 : <%=boardBean.getNoticeCreateDate() %><br><br>
					<%
						if(boardBean.getNoticeFileName() != null){
					%>
					첨부 파일 :
					  <input type="submit" id="filename" name="filename" value=<%=boardBean.getNoticeFileName() %> readonly style="border:none;border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;"> </h5>
					<%
						}
					%>
					 
					
					
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>