<%@page import="dao.User"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="dto.UserBean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 부분</title>

</head>
<body>
	<%
		// 한글 인코딩
		request.setCharacterEncoding("utf-8");
	%>	
	
	
	<jsp:useBean id="userBean" class="dto.UserBean" scope="request"/>
	<jsp:setProperty property="*" name="userBean"/>
		
	<%
		User user = User.getInstance();
		user.signup(userBean);
		
		response.sendRedirect("/DaengDaeng/index.jsp");
	%>
</body>
</html>