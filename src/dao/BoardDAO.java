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
	
	public int write(int type, String title, String contents, String writer) {
		String date = null;
		int nextBoard; // 다음 글 번호 
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
			sql = "insert into board(notice_num, notice_type, notice_title, notice_contents, notice_writer, notice_create_date) values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nextBoard);
			pstmt.setInt(2, type);
			pstmt.setString(3, title);
			pstmt.setString(4, contents);
			pstmt.setString(5, writer);
			pstmt.setString(6, date);
			
			
			//pstmt.setString(6, fileurl);
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
	
	public ArrayList<BoardBean> getList(int pageNumber){
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
			
			sql = "select * from board where notice_num < ? order by notice_num desc limit 10";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nextBoard - (pageNumber -1) * 10);
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
				boardBean.setNoticeFileurl(rs.getString(9));
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
	
	public boolean nextPage(int pageNumber) {
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
			
			sql = "select * from board where notice_num < ? order by notice_num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nextBoard - (pageNumber -1) * 10);
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
				boardBean.setNoticeFileurl(rs.getString(9));
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
	
}
