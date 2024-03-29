<%@page import="dao.User"%>
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
		User user = User.getInstance(); // 객체 가져와서
		user.signup(userBean); // 회원가입 메소드 불러오기 

		session.setAttribute("userID", userBean.getId());
		response.sendRedirect("/DaengDaeng/index.jsp");
	%>
</body>
</html>