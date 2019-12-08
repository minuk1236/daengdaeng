<%@page import="dto.BoardBean"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		BoardDAO boardDAO = BoardDAO.getInstance();
		int noticeID = Integer.parseInt(request.getParameter("noticeNum"));
		
		BoardBean boardBean =  boardDAO.getBoard(noticeID);
		
		String directory = boardBean.getNoticeFileurl();
		
		
	%>
</body>
</html>