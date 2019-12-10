package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import database.DBConnection;
import dto.BoardBean;

public class BoardDAO {
	private static BoardDAO instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	// 사용자 객체 가져오기
	public static BoardDAO getInstance() {
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	
	public int write(int type, String title, String contents, String writer, String fileName, String fileRealName) {
		String date = null;
		int nextBoard; // 다음 글 번호 
		String fileurl = "C:\\Users\\MIN\\Desktop\\웹프 프로젝트\\JSPProject\\DaengDaeng\\WebContent\\resources\\upload\\" + fileRealName;
		try {
			conn = DBConnection.getConnection();
			String sql = "select notice_num from board order by notice_num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nextBoard = rs.getInt(1) + 1;
			}else {
				nextBoard = 1; // 첫번째 게시글 인 경우
			}
			
			sql = "SELECT CURDATE()";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				date = rs.getString(1);
			}
		    // insert into board(notice_type, notice_title, notice_contents, notice_writer, notice_create_date, notice_fileurl)
			if(fileName != null && fileRealName != null) {
				sql = "insert into board(notice_num, notice_type, notice_title, notice_contents, notice_writer, notice_create_date, notice_filename, notice_filerealname, notice_fileurl) values(?,?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, nextBoard);
				pstmt.setInt(2, type);
				pstmt.setString(3, title);
				pstmt.setString(4, contents);
				pstmt.setString(5, writer);
				pstmt.setString(6, date);
				pstmt.setString(7, fileName);
				pstmt.setString(8, fileRealName);
				pstmt.setString(9, fileurl);
				pstmt.executeUpdate();
			}else {
				sql = "insert into board(notice_num, notice_type, notice_title, notice_contents, notice_writer, notice_create_date) values(?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, nextBoard);
				pstmt.setInt(2, type);
				pstmt.setString(3, title);
				pstmt.setString(4, contents);
				pstmt.setString(5, writer);
				pstmt.setString(6, date);
				
				pstmt.executeUpdate();
			}
			
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
			
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<BoardBean> getList(int type, int pageNumber){
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		int nextBoard; // 다음 글 번호 
		try {
			conn = DBConnection.getConnection();
			// 내림차순 하여 제일 위에있는 글 번호를 가져오기 
			String sql = "select notice_num from board order by notice_num desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				nextBoard = rs.getInt(1) + 1;
			}else {
				nextBoard = 1; // 첫번째 게시글 인 경우
			}
			
			sql = "select * from board where notice_num < ? and notice_type = ? order by notice_num desc limit 10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nextBoard - (pageNumber-1) * 10);
			pstmt.setInt(2, type);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNoticeNum(rs.getInt(1));
				boardBean.setNoticeType(rs.getInt(2));
				boardBean.setNoticeTitle(rs.getString(3));
				boardBean.setNoticeContents(rs.getString(4));
				boardBean.setNoticeWirter(rs.getString(5));
				boardBean.setNoticeCreateDate(rs.getString(6));
				boardBean.setNoticeModifyDate(rs.getString(7));
				boardBean.setNoticeViewsnum(rs.getInt(8));
				boardBean.setNoticeFileName(rs.getString(9));
				boardBean.setNoticeFileRealName(rs.getString(10));
				boardBean.setNoticeFileurl(rs.getString(11));
				list.add(boardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
		}
		return list;
	}
	
	// 검색부분
	public ArrayList<BoardBean> getSearchList(int type, String searchType, String search, int pageNumber){
		ArrayList<BoardBean> list = null;
		String sql = null;
		
		try {
			conn = DBConnection.getConnection();
			
			if(searchType.equals("title")) {
				sql = "select * from board where notice_type = ? and notice_title LIKE ? order by notice_num desc limit " + (pageNumber-1) * 9 + ", " + (pageNumber-1) * 9 + 10;
			}else if(searchType.equals("contents")) {
				sql = "select * from board where notice_type = ? and notice_contents LIKE ? order by notice_num desc limit " + (pageNumber-1) * 9 + ", " + (pageNumber-1) * 9 + 10;
			}else if(searchType.equals("writer")) {
				sql = "select * from board where notice_type = ? and notice_writer LIKE ? order by notice_num desc limit " + (pageNumber-1) * 9 + ", " + (pageNumber-1) * 9 + 10;
			}
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, type);
			pstmt.setString(2,"%" + search + "%");
			rs = pstmt.executeQuery();
			list = new ArrayList<BoardBean>();
			while(rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNoticeNum(rs.getInt(1));
				boardBean.setNoticeType(rs.getInt(2));
				boardBean.setNoticeTitle(rs.getString(3));
				boardBean.setNoticeContents(rs.getString(4));
				boardBean.setNoticeWirter(rs.getString(5));
				boardBean.setNoticeCreateDate(rs.getString(6));
				boardBean.setNoticeModifyDate(rs.getString(7));
				boardBean.setNoticeViewsnum(rs.getInt(8));
				boardBean.setNoticeFileName(rs.getString(9));
				boardBean.setNoticeFileRealName(rs.getString(10));
				boardBean.setNoticeFileurl(rs.getString(11));
				list.add(boardBean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
		}
		
		return list;
		
	}
	
	public boolean nextPage(int type,int pageNumber) {
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from board where notice_num > ? and notice_type = ?";
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setInt(1, pageNumber * 10);
			pstmt.setInt(2, type);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
		}
		return false;
	}
	public int targetPage(int type, int pageNumber) {
		try {
			conn = DBConnection.getConnection();
			String sql = "select count(notice_num) from board where notice_num > ? and notice_type = ?";
			pstmt = conn.prepareStatement(sql);
	
			pstmt.setInt(1, (pageNumber-1) * 10);
			pstmt.setInt(2, type);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)/10; 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
		}
		return 0;
	}
	
	public BoardBean getBoard(int noticeID) {
		try {
			conn = DBConnection.getConnection();
					
			String sql = "select * from board where notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, noticeID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				BoardBean boardBean = new BoardBean();
				boardBean.setNoticeNum(rs.getInt(1));
				boardBean.setNoticeType(rs.getInt(2));
				boardBean.setNoticeTitle(rs.getString(3));
				boardBean.setNoticeContents(rs.getString(4));
				boardBean.setNoticeWirter(rs.getString(5));
				boardBean.setNoticeCreateDate(rs.getString(6));
				boardBean.setNoticeModifyDate(rs.getString(7));
				boardBean.setNoticeViewsnum(rs.getInt(8));
				boardBean.setNoticeFileName(rs.getString(9));
				boardBean.setNoticeFileRealName(rs.getString(10));
				boardBean.setNoticeFileurl(rs.getString(11));
				return boardBean;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
		}
		return null;//없는 경우
	}
	
	public int update(int noticeID, String title, String contents) {
		String modifyDate = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "SELECT CURDATE()";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				modifyDate = rs.getString(1);
			}
		    // insert into board(notice_type, notice_title, notice_contents, notice_writer, notice_create_date, notice_fileurl)
			sql = "update board set notice_title = ?, notice_contents = ?, notice_modify_date = ? where notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setString(3, modifyDate);
			pstmt.setInt(4, noticeID);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
			
		}
		return -1; //데이터베이스 오류
	}
	
	public int delete(int noticeID) {
		try {
			conn = DBConnection.getConnection();
			String sql = "delete from board where notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeID);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
			
		}
		return -1; //데이터베이스 오류
	}
	
	public int hit(int noticeID) {
		try {
			conn = DBConnection.getConnection();
			String sql = "update board set notice_viewsnum = notice_viewsnum + 1 where notice_num = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, noticeID);
			pstmt.executeUpdate();
			return 1;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(rs);
			DBConnection.close(conn);
			
		}
		return -1; //데이터베이스 오류
	}

}
