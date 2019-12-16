package file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class downloadProcess
 */
@WebServlet("/downloadProcess")
public class downloadProcess extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public downloadProcess() {
		super();
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fileName = request.getParameter("filename");
		System.out.println(fileName);
		
		//한글 깨질까요..
		String path = "C:\\Users\\MIN\\Desktop\\웹프 프로젝트\\JSPProject\\DaengDaeng\\WebContent\\resources\\upload\\";
		
		File file = new File(path+fileName);
		
		String mimeType = getServletContext().getMimeType(file.toString());
		if(mimeType == null) {
			response.setContentType("application/octet-stream");
		}
		
		String downloadName = null;
				
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downloadName = new String(fileName.getBytes(),"8859_1");
		}else {
			downloadName = new String(fileName.getBytes(),"8859_1");
		}
		//System.out.println(downloadName);
		
		response.setHeader("content-Disposition", "attachment;filename=\""+downloadName+ "\";");
	
		FileInputStream fileInputStream = new FileInputStream(file);
		ServletOutputStream servletOutputStream = response.getOutputStream();
		
		byte b[] = new byte[1024];
		int data = 0;
		while((data = (fileInputStream.read(b,0,b.length))) != -1) {
			servletOutputStream.write(b,0,data);
		}
		
		servletOutputStream.flush();
		servletOutputStream.close();
		fileInputStream.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
