package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
	
	public static ArrayList<Post> getPosts(int pageNo) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT id, title, author, content " 
						+ "FROM ag_post "
						+ "WHERE status = 1 "
						+ "ORDER BY dateAdded DESC "
						+ "LIMIT ?,5";
			int postNo = (pageNo - 1) * 5;
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,postNo);
			ResultSet rs = ps.executeQuery();
			ArrayList<Post> posts = new ArrayList<Post>();
			
			while( rs.next() ) {
				String content = rs.getString("content");
				
				//truncate content
				String[] array = content.split(" ");
				
				int numChar = 0;
				int i=0;
				StringBuilder sb = new StringBuilder();
				
				if(array.length != 0)
				while(numChar + array[i].length() <= 150)
				{
					sb.append(array[i] + " ");
					numChar = numChar + array[i].length() + 1;
					i++;
					
					if(i == array.length)
						break;
				}
				
				int remainingChar = 150-numChar;
				
				if(i < array.length)
				if(remainingChar >= array[i].length()/2)
				{
					sb.append(array[i]);
				}

				Post p = new Post(rs.getInt("id"),rs.getString("title"),rs.getString("author")
									,sb.toString());
				posts.add(p);
			}
			
			return posts;
		} catch( SQLException se ) {
			se.printStackTrace();
		}
		return null;
	}
}
