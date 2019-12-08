<%@page import="dao.User"%>
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
	    String id = request.getParameter("id");
	    String pw = request.getParameter("password");
	    
	    User user = User.getInstance();
	    boolean result = user.login(id, pw);
		
	    if(result){
	    	session.setAttribute("userID",id);
	        out.println("<script>");
	        out.println("location.href = '/DaengDaeng/index.jsp'");
	        out.println("</script>");
	    }else{
	    	out.println("<script>");
	    	out.println("alert('입력하신 정보가 존재하지 않습니다.')");
	    	out.println("history.back()");
	    	out.println("</script>");
	      }
	%>
</body>
</html>