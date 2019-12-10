package tld;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import dao.BoardDAO;
import dto.BoardBean;

public class BoardTagHandler extends SimpleTagSupport {
	private Integer type;
	private Integer pagenumber;
	private String searchtype;
	private String search;
	
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public Integer getPagenumber() {
		return pagenumber;
	}
	public void setPagenumber(Integer pagenumber) {
		this.pagenumber = pagenumber;
	}
	public String getSearchtype() {
		return searchtype;
	}
	public void setSearchtype(String searchtype) {
		this.searchtype = searchtype;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	@Override
	public void doTag() throws JspException, IOException {
		JspContext context = getJspContext();
		JspWriter out = context.getOut();
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		ArrayList<BoardBean> list = null;
		
		if(search == null){
			list = boardDAO.getList(type,pagenumber);
		}else{
			list = boardDAO.getSearchList(type,searchtype, search, pagenumber);
		}
		String url = null;
		switch(type) {
		case 1:
			url = "noticeDetail.jsp";
			break;
		case 2:
			url = "communityDetail.jsp";
			break;
		case 3:
			url = "adoptandmissingDetail.jsp";
			break;
		case 4:
			url = "daengDetail.jsp";
			break;
		case 5:
			url = "shareandsaleDetail.jsp";
			break;
		}
		for(BoardBean board : list){
			out.println("<tr>");
			out.println("<th scope='row'>"+ board.getNoticeNum() + "</th>");
			out.println("<td><a href=" + url + "?noticeNum="+URLEncoder.encode(String.valueOf(board.getNoticeNum()),"utf-8") + " style='color: #000000; text_decoration: none;'>" + board.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") + "</a></td>");
			out.println("<td>" + board.getNoticeWirter() + "</td>");
			out.println("<td>" + board.getNoticeCreateDate() + "</td>");
			out.println("<td>" + board.getNoticeViewsnum() + "</td>");
			out.println("</tr>");
		}
	}
}