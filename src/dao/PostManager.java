package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Comment;
import model.Post;

public class PostManager {
	public static int getPostCount() {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT COUNT(id) postCount " 
						+ "FROM ag_post "
						+ "WHERE status = 1 ";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			if( rs.next() ) {
				return rs.getInt("postCount");
			}
		} catch( SQLException se ) {
			se.printStackTrace();
		}
		return 0;
	}
	
	public static boolean addPost(String title, int author, String content) {
		try {
			Connection c = DBManager.getInstance().getConnection();
			String sql = "INSERT INTO ag_post(title,author,content) VALUES (?,?,?)";
			PreparedStatement ps = c.prepareStatement(sql);
			ps.setString(1,title);
			ps.setInt(2,author);
			ps.setString(3,content.replaceAll("\n","<br/>"));
			ps.executeUpdate();
			c.close();
		} catch(SQLException se) {
			se.printStackTrace();
			return false;
		}
		return true;
	}
	
	public static Post getPost(int id)
	{
		Post post = null;
		
		try {
		
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT P.id, title, U.username AS author, content, P.dateAdded "
						+ "FROM ag_post P INNER JOIN ag_user U ON P.author = U.id "
						+ "WHERE P.id = ? AND P.status = 1 AND U.status = 1";
	
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			rs.next();
			post = new Post(id,rs.getString("title"),rs.getString("author")
							,rs.getString("content")
							,rs.getTimestamp("dateAdded"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return post;
					
	}
	
	public static Post[] searchPost(String search)
	{
		String sql = "SELECT * FROM ag_post WHERE title LIKE ? AND author LIKE ? AND status = 1";
		Connection con = DBManager.getInstance().getConnection();
		try {

			search = "%" + search + "%";
			PreparedStatement ps = con.prepareStatement(sql);
			
			ps.setString(1,search);
			ps.setString(2,search);
			ResultSet rs = ps.executeQuery();
			
			ArrayList<Post> posts = new ArrayList<Post>();
			
			while(rs.next())
			{
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
									,sb.toString().replaceAll("\n","<br/>"),rs.getTimestamp("dateAdded"));
				sql = "SELECT id, author, content, dateAdded "
						+ "FROM ag_comment "
						+ "WHERE post_id = ? "
						+ "ORDER BY dateAdded DESC "
						+ "LIMIT 1";
				ps = con.prepareStatement(sql);
				ps.setInt(1, p.getId());
				ResultSet rs2 = ps.executeQuery();
				if( rs2.next() ) {
					Comment c = new Comment(rs2.getInt("id"),rs2.getString("author")
										,rs2.getString("content"),rs2.getTimestamp("dateAdded"));
					p.setTopComment(c);
				}
				posts.add(p);
			}	
			return posts.toArray(new Post[0]);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
		
		
	}
	
	public static Post[] getPosts(int pageNo) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT P.id, title, U.username AS author, content,P.dateAdded " 
						+ "FROM ag_post P INNER JOIN ag_user U ON P.author = U.id "
						+ "WHERE P.status = 1 AND U.status = 1 "
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
									,sb.toString().replaceAll("\n","<br/>"),rs.getTimestamp("dateAdded"));
				sql = "SELECT C.id, U.username AS author, content, C.dateAdded "
						+ "FROM ag_comment C INNER JOIN ag_user U ON C.author = U.id "
						+ "WHERE post_id = ? AND C.status = 1 AND U.status = 1 "					
						+ "ORDER BY C.dateAdded DESC "
						+ "LIMIT 1";
				ps = con.prepareStatement(sql);
				ps.setInt(1, p.getId());
				ResultSet rs2 = ps.executeQuery();
				if( rs2.next() ) {
					Comment c = new Comment(rs2.getInt("id"),rs2.getString("author")
										,rs2.getString("content"),rs2.getTimestamp("dateAdded"));
					p.setTopComment(c);
				}
				posts.add(p);
			}
			
			return posts.toArray(new Post[0]);
		} catch( SQLException se ) {
			se.printStackTrace();
		}
		return null;
	}
}
