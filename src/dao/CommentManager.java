package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Comment;

public class CommentManager {
	public static Comment addComment(int postId, int author, String comment) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "INSERT INTO ag_comment(post_id,author,content) VALUES (?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, postId);
			ps.setInt(2,author);
			comment = comment.replaceAll("\n","<br/>");
			ps.setString(3, comment);
			ps.executeUpdate();
			sql = "SELECT C.id,U.username AS author,content,C.dateAdded "
					+ "FROM ag_comment C INNER JOIN ag_user U ON C.author = U.id "
					+ "WHERE author = ? AND content = ? AND post_id = ? AND C.status = 1 AND U.status = 1 "
					+ "ORDER BY C.dateAdded DESC "
					+ "LIMIT 1";
			ps = con.prepareStatement(sql);
			ps.setInt(1, author);
			ps.setString(2, comment);
			ps.setInt(3, postId);
			ResultSet rs = ps.executeQuery();
			if( rs.next() ) {
				Comment c = new Comment(rs.getInt("id"),rs.getString("author")
										,rs.getString("content"),rs.getTimestamp("dateAdded"));
				return c;
			} else {
				return null;
			}
		} catch( SQLException se) {
			se.printStackTrace();
			return null;
		}
	}
	
	public static int commentCount(int postId) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT COUNT(id) commentCtr "
					+ "FROM ag_comment "
					+ "WHERE post_id = ? AND status = 1";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,postId);
			ResultSet rs = ps.executeQuery();
			if( rs.next() ) {
				return rs.getInt("commentCtr");
			} else {
				return 0;
			}
		} catch( SQLException se) {
			se.printStackTrace();
			return 0;
		}
	}
	
	public static Comment[] getComments(int postId, int pageNo) {
		return getComments(postId, pageNo, Integer.MAX_VALUE);
	}
	
	public static Comment[] getComments(int postId, int pageNo, int idCap ) {
		try {
			Connection con = DBManager.getInstance().getConnection();
			String sql = "SELECT C.id, U.username AS author, content, C.dateAdded "
					+ "FROM ag_comment C INNER JOIN ag_user U ON C.author = U.id "
					+ "WHERE post_id = ? AND C.id <= ? AND C.status = 1 AND U.status = 1 "
					+ "ORDER BY C.dateAdded DESC "
					+ "LIMIT ?,5";
			int startIndex = (pageNo - 1) * 5;
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1,postId);
			ps.setInt(2, idCap);
			ps.setInt(3,startIndex);
			ResultSet rs = ps.executeQuery();
			ArrayList<Comment> comments = new ArrayList<Comment>();
			while( rs.next() ) {
				comments.add(new Comment(rs.getInt("id"),rs.getString("author")
										,rs.getString("content"),rs.getTimestamp("dateAdded")));
			} 
			return comments.toArray(new Comment[0]);
		} catch( SQLException se) {
			se.printStackTrace();
			return null;
		}
	}
}
