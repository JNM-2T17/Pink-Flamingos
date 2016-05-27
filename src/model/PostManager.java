package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.DBManager;

public class PostManager {
	public static boolean addPost(String title, String author, String content) {
		try {
			Connection c = DBManager.getInstance().getConnection();
			String sql = "INSERT INTO ag_post(title,author,content) VALUES (?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,title);
			ps.setString(2,author);
			ps.setString(3,content);
			ps.executeUpdate();
			c.close();
		} catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
		return true;
	}
}
