<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO" %>
<%@ page import="dto.BoardBean" %>
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
	
	<%@include file="../header.jsp"%>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		//세션얻기
		//String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		
		/* int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		} */
		
		String searchType = "title"; //기본값
		String search = "";
		int pageNumber = 1;
		
		if(request.getParameter("searchType") != null) {
			searchType = request.getParameter("searchType");
		}
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		if(request.getParameter("pageNumber") != null) {
			try {
				pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
			}catch (Exception e) {
				e.printStackTrace();
				System.out.println("검색 페이지 번호 오류");
			}
		}
		
	%>
	
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
						<%
							BoardDAO boardDAO = BoardDAO.getInstance();
							ArrayList<BoardBean> list = null;
							if(search.equals("")){
								list = boardDAO.getList(1,pageNumber);
							}else{
								list = boardDAO.getSearchList(1,searchType, search, pageNumber);
							}
							for(BoardBean board : list){
						%>
						<tr>
							<th scope="row"><%=board.getNoticeNum() %></th>
							<td><a href="noticeDetail.jsp?noticeNum=<%=URLEncoder.encode(String.valueOf(board.getNoticeNum()),"utf-8")  %>" style="color: #000000; text_decoration: none;"><%=board.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
							<td><%=board.getNoticeWirter() %></td>
							<td><%=board.getNoticeCreateDate() %></td>
							<td><%=board.getNoticeViewsnum() %></td>
						</tr>
						
						<%		
							}
						%>
					</tbody>
				</table>

				
				<form method="get" action="/DaengDaeng/board/notice.jsp">
					<div class="row">
						<div class="col-md-5"></div>
						<div class="col-md-2">
							<select name="searchType" class="custom-select">
							  <option value="title" selected>제목</option>
							  <option value="contents">내용</option>
							  <option value="writer">작성자</option>
							</select>
						</div>
						<div class="col-md-2">
							<!-- 검색부분은 submit 버튼이랑 input 칸 하나둬서 검색하게 할겡 -->
							<input type="text" class="form-control" id="search" name="search" placeholder="검색">
						</div>
						<div class="col-md-1">
							<button type="submit" class="btn btn-danger">검색</button>
						</div>
						<div class="col-md-2">
							<a href="/DaengDaeng/board/noticeWrite.jsp"><button type="button" class="btn btn-danger">글쓰기</button></a>
						</div>
					</div>
				</form>


				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center font_color">
						<%
							int startPage = (pageNumber % 10);
							if(pageNumber % 10 == 0) startPage -= 10;
							int targetPage = boardDAO.targetPage(1,pageNumber);
							
							if(startPage != 1){ 
						%>
							<li class="page-item "><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=startPage -1 %>" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%
							}else{
						%>
							<li class="page-item disabled"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=startPage -1 %>" tabindex="-1" aria-disabled="true">&lt;</a></li>
						<%
							}
							for(int i= 1 ; i<pageNumber; i++){
						%>
							<li class="page-item"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=i %>"><%=i %></a></li>
						<%
							}
						%>
							<li class="page-item active"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=pageNumber %>"><%=pageNumber %></a></li>
							
						<%
							for(int i=pageNumber+1; i<= targetPage+pageNumber; i++){
								if(i < startPage + 10){
						%>
							<li class="page-item"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=i %>"><%=i %></a></li>
						<%
								}
							}
							if(targetPage + pageNumber > startPage + 9){
						%>
							<li class="page-item"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=startPage + 9 %>">&gt;</a></li>
						<%
							}else{	
						%>
							<li class="page-item disabled"><a class="page-link font_color" href="/DaengDaeng/board/notice.jsp?pageNumber=<%=startPage +9 %>" >&gt;</a></li>
						<%
							}
						%>

						
					</ul>
				</nav>
			</div>
		</div>
		</div>
		<%@include file="../footer.jsp"%>
</body>
</html>