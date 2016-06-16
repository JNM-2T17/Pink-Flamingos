package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.BCrypt;
import model.User;

public class UserManager {
	public static User addUser(String username, String password) throws Exception {
		try {
			if( getUser(username) != null ) {
				throw new Exception("Account Exists");
			}
			Connection con = DBManager.getInstance().getConnection();
			String sql = "INSERT INTO ag_user(username,password) VALUES(?,?)";
			String hash = BCrypt.hashpw(password,BCrypt.gensalt());
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,username);
			ps.setString(2, hash);
			ps.execute();
			
			return getUser(username);
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static User getUser(int id) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT id, username FROM ag_user WHERE id = ? AND status = 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			
			if( rs.next() ) {
				return new User(rs.getInt("id"),rs.getString("username"));
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		return null;
	}
	
	public static User getUser(String username) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT id, username FROM ag_user WHERE username = BINARY ? AND status = 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			
			if( rs.next() ) {
				return new User(rs.getInt("id"),rs.getString("username"));
			}
		} catch(SQLException se) {
			se.printStackTrace();
		}
		return null;
	}
	
	public static User login(String username, String password) throws Exception {		
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT id, username, password FROM ag_user WHERE status = 1 AND username = BINARY ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,username);
			ResultSet rs = ps.executeQuery();
			if( rs.next() ) {
				String storedPass = rs.getString("password");
				if(BCrypt.checkpw(password, storedPass) ) {
					return new User(rs.getInt("id"),rs.getString("username"));
				} else {
					return null;
				}
			} else {
				throw new Exception("Account Does Not Exist");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
