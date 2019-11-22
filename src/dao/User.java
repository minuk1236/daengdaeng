package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import database.DBConnection;
import dto.UserBean;

public class User {
	private static User instance;
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private User() {
		
	}
	
	// 사용자 객체 가져오기
	public static User getInstance() {
		if(instance == null) {
			instance = new User();
		}
		return instance;
	}
	
	// 회원가입
	public void signup(UserBean bean) {

		try {
			conn = DBConnection.getConnection();
			String sql = "insert into user(user_id,user_password,user_name,user_birth,user_gender,user_email,user_phonenum) values(?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPassword());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getBirth());
			pstmt.setString(5, bean.getBirth());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getPhone());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);	
		}
		
			
	}
	public boolean confirmId(String id) {
		boolean result = false;
		
		
		conn = DBConnection.getConnection();
		String sql = "select user_id from user where user_id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);	
		}
		
		return result;
		
		
	}
	
	
}
