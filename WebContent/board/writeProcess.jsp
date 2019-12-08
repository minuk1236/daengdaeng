<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	
<jsp:useBean id="board" class="dto.BoardBean" scope="request" />
	<jsp:setProperty name="board" property="noticeTitle" param="title"/>
	<jsp:setProperty name="board" property="noticeContents" param="contents" />
	<%
			//세션얻기
			String userID = null;
			if(session.getAttribute("userID") != null){
				userID = (String) session.getAttribute("userID");
			}
			if(userID == null){
				out.println("<script>");
				out.println("alert('로그인을 하세요.')");
				out.println("location.href = '/DaengDaeng/account/signin.jsp'");
				out.println("</script>");
			}else{
				if(board.getNoticeTitle() == null || board.getNoticeContents() == null){
					out.println("<script>");
					out.println("alert('입력이 안 된 사항이 있습니다. ')");
					out.println("history.back()");
					out.println("</script>");
				}else{
					BoardDAO boardDAO = BoardDAO.getInstance();
					int result = boardDAO.write(1,board.getNoticeTitle() , board.getNoticeContents(), userID);
					if(result == -1){
						out.println("<script>");
						out.println("alert('글쓰기에 실패했습니다. ')");
						out.println("history.back()");
						out.println("</script>");
					}else{
						out.println("<script>");
						out.println("location.href = '/DaengDaeng/board/notice.jsp'");
						out.println("</script>");
					}
				}
			}
	%>
</body>
</html>