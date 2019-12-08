<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.BoardDAO" %>
<jsp:useBean id="board" class="dto.BoardBean" scope="request" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		int maxSize = 5 * 1024 * 1024; // 5M 
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\MIN\\Desktop\\웹프 프로젝트\\JSPProject\\DaengDaeng\\WebContent\\resources\\upload",maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		String fileName = multi.getOriginalFileName("file");
		String fileRealName = multi.getFilesystemName("file");
		
		board.setNoticeTitle(multi.getParameter("title"));
		board.setNoticeContents(multi.getParameter("contents"));
		board.setNoticeFileName(fileName);
		board.setNoticeFileRealName(fileRealName);
		
	%>
	
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
					int result = boardDAO.write(1,board.getNoticeTitle() , board.getNoticeContents(), userID, board.getNoticeFileName(), board.getNoticeFileRealName());
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