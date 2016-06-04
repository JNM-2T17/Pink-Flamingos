package model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Comment {
	private int id;
	private String author;
	private String content;
	private String date;
	
	public Comment() {
		super();
	}
	
	public Comment(int id, String author, String content, Timestamp date) {
		super();
		this.id = id;
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
	
	public String getDate() {
		return date;
	}
	
	public void setDate(String date) {
		this.date = date;
	}
}
