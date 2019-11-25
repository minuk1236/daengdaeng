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
	
		String name = request.getParameter("name");
		String birth = request.getParameter("birth");
		String phone = request.getParameter("phone");
		
		User user = User.getInstance();
		String result = user.searchId(name, birth, phone);
		
		if(result != null){ %>
		<script type="text/javascript">
			alert("찾으시는 아이디는 <%=result%> 입니다.");
			location.href = "/DaengDaeng/account/signin.jsp";
		</script>

	<%			
		}else{ %>
		<script type="text/javascript">
			alert("찾으시는 아이디가 존재하지 않습니다.");
			location.href = "/DaengDaeng/account/findUserId.jsp";
		</script>
	<%		
		}
		
	%>
		<%-- <p> 이름 : <%=name %>
		<p> 생년월일 : <%=birth %>
		<p> 연락처 : <%=phone %>
		<p> 아이디 : <%=result %> --%>
</body>
</html>