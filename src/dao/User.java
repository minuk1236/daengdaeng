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
			pstmt.setString(5, bean.getGender());
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
	
	 public boolean login(String id, String password) {

	      boolean result = false;
	      conn = DBConnection.getConnection();
	      String sql = "select user_password from user where user_id=?";
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, id);
	         
	         rs = pstmt.executeQuery();
	         if(rs.next()) {
	            if(rs.getString("user_password").equals(password)) {
	               result = true;
	            }
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         DBConnection.close(pstmt);
	         DBConnection.close(conn);   
	         DBConnection.close(rs);
	      }
	      
	      return result;


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
			DBConnection.close(rs);
		}
		
		return result;
		
	}
	public String searchId(String name, String birth, String phone) {
		String result = null;
		
		conn = DBConnection.getConnection();
		String sql = "select user_id from user where user_name=? and user_birth=? and user_phonenum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, birth);
			pstmt.setString(3, phone);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("user_id");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);	
			DBConnection.close(rs);
		}
		
		return result;
		
	}
	public String searchPW(String id, String name, String birth) {
		String result = null;
		
		conn = DBConnection.getConnection();
		String sql = "select user_password from user where user_id=? and user_name=? and user_birth=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, birth);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString("user_password");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnection.close(pstmt);
			DBConnection.close(conn);	
			DBConnection.close(rs);
		}
		
		return result;
	}
	
}
