<%@page import="dao.BoardDAO"%>
<%@page import="dto.BoardBean"%>
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
			}
			
			int noticeID = 0;
			if(request.getParameter("noticeNum") != null){
				noticeID = Integer.parseInt(request.getParameter("noticeNum"));
			}
			if(noticeID == 0){
				out.println("<script>");
				out.println("alert('유효하지 않는 글입니다.')");
				out.println("location.href = '/DaengDaeng/board/notice.jsp'");
				out.println("</script>");
			}
			BoardBean boardBean = BoardDAO.getInstance().getBoard(noticeID);
			if(!userID.equals(boardBean.getNoticeWirter())){
				out.println("<script>");
				out.println("alert('권한이 없습니다.')");
				out.println("location.href = '/DaengDaeng/board/notice.jsp'");
				out.println("</script>");
			}else{
				if(request.getParameter("title") == null || request.getParameter("contents") == null
						|| request.getParameter("title").equals("") || request.getParameter("contents").equals("") ){
					out.println("<script>");
					out.println("alert('입력이 안 된 사항이 있습니다. ')");
					out.println("history.back()");
					out.println("</script>");
				}else{
					BoardDAO boardDAO = BoardDAO.getInstance();
					int result = boardDAO.update(noticeID, request.getParameter("title"), request.getParameter("contents"));
					if(result == -1){
						out.println("<script>");
						out.println("alert('글 수정에 실패했습니다. ')");
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