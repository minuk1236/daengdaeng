

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardBean;

/**
 * Servlet implementation class DeleteProcess
 */
@WebServlet("/DeleteProcess")
public class DeleteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		//세션얻기
		String userID = null;
		if (request.getSession().getAttribute("userID") != null) {
			userID = (String) request.getSession().getAttribute("userID");
		}
		if (userID == null) {
			out.println("<script>");
			out.println("alert('로그인을 하세요.')");
			out.println("location.href = '/DaengDaeng/account/signin.jsp'");
			out.println("</script>");
		}

		int noticeID = 0;
		if (request.getParameter("noticeNum") != null) {
			noticeID = Integer.parseInt(request.getParameter("noticeNum"));
		}
		if (noticeID == 0) {
			out.println("<script>");
			out.println("alert('유효하지 않는 글입니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		BoardBean boardBean = BoardDAO.getInstance().getBoard(noticeID);
		String str = null;
		switch(boardBean.getNoticeType()) {
		case 1:
			str = "notice.jsp";
			break;
		case 2:
			str = "community.jsp";
			break;
		case 3:
			str = "adoptandmissing.jsp";
			break;
		case 4:
			str = "daengdaenggallery.jsp";
			break;
		case 5:
			str = "shareandsale.jsp";
			break;
		}
		if (!userID.equals(boardBean.getNoticeWirter())) {
			out.println("<script>");
			out.println("alert('권한이 없습니다.')");
			out.println("location.href = '/DaengDaeng/board/"+str+"'");
			out.println("</script>");
		} else {
			BoardDAO boardDAO = BoardDAO.getInstance();

			int result = boardDAO.delete(noticeID);
			if (result == -1) {
				out.println("<script>");
				out.println("alert('글 삭제에 실패했습니다. ')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				out.println("<script>");
				out.println("location.href = '/DaengDaeng/board/"+str+"'");
				out.println("</script>");
			}
		}
	}

}
