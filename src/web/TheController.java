package web;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PostManager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dao.DBManager;

@Controller
public class TheController {
	@RequestMapping("/")
	public void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/index.jsp").forward(request, response);
	}
	
	@RequestMapping("/NewPost")
	public void newPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/newPost.jsp").forward(request, response);
	}
	
	@RequestMapping("/AddPost")
	@ResponseBody
	public void addPost(@RequestParam(value="title") String title,
						@RequestParam(value="author") String author,
						@RequestParam(value="content") String content,
						HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean status = PostManager.addPost(title,author,content);
		
		request.setAttribute("status", status);
		if( !status ) {
			request.setAttribute("title",title);
			request.setAttribute("author", author);
			request.setAttribute("content", content);
		}
		request.getRequestDispatcher("WEB-INF/view/newPost.jsp").forward(request,response);
	}
}
