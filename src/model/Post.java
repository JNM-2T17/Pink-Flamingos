package model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Post {
	private int id;
	private String title;
	private String author;
	private String content;
	private Comment topComment;
	private String date;
	
	
	public Post() {
		super();
	}

	public Post(int id, String title, String author, String content,Timestamp date) {
		super();
		this.id = id;
		this.title = title;
		this.author = author;
		this.content = content;
		Date d = null;
		if( date != null ) {
			d = new Date(date.getTime());
		}
		DateFormat df = new SimpleDateFormat("hh:mm aa, MMMM dd, yyyy");
		this.date = df.format(d);
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Comment getTopComment() {
		return topComment;
	}

	public void setTopComment(Comment topComment) {
		this.topComment = topComment;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
}
