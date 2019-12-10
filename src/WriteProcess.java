

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.BoardDAO;
import dto.BoardBean;


@WebServlet("/WriteProcess")
public class WriteProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		int maxSize = 5 * 1024 * 1024; // 5M 
		MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\MIN\\Desktop\\웹프 프로젝트\\JSPProject\\DaengDaeng\\WebContent\\resources\\upload",maxSize,"utf-8",new DefaultFileRenamePolicy());
		
		String fileName = multi.getOriginalFileName("file");
		String fileRealName = multi.getFilesystemName("file");
		int type = Integer.parseInt(multi.getParameter("type"));
		
		
		BoardBean board = new BoardBean();
		board.setNoticeTitle(multi.getParameter("title"));
		board.setNoticeContents(multi.getParameter("contents"));
		board.setNoticeFileName(fileName);
		board.setNoticeFileRealName(fileRealName);
		
		
		String userID = null;
		if(request.getSession().getAttribute("userID") != null){
			userID = (String) request.getSession().getAttribute("userID");
		}
		
		PrintWriter out = response.getWriter();
		
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
				int result = boardDAO.write(type,board.getNoticeTitle() , board.getNoticeContents(), userID, board.getNoticeFileName(), board.getNoticeFileRealName());
				if(result == -1){
					out.println("<script>");
					out.println("alert('글쓰기에 실패했습니다. ')");
					out.println("history.back()");
					out.println("</script>");
				}else{
					out.println("<script>");
					String str = null;
					switch(type) {
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
					out.println("location.href = '/DaengDaeng/board/" + str + "'");
					out.println("</script>");
				}
			}
		}
	}

}
