package web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Post;
import model.PostManager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class TheController {
	@RequestMapping("/")
	public void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//get posts
		int postCtr = PostManager.getPostCount();
		ArrayList<Post> posts = PostManager.getPosts(1);		
		
		request.setAttribute("postCtr", postCtr);
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("WEB-INF/view/posts.jsp").forward(request,response);
	}
	
	@RequestMapping("/AboutUs")
	public void aboutUs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/aboutUs.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/NewPost",method=RequestMethod.GET)
	public void newPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/newPost.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/NewPost",method=RequestMethod.POST)
	@ResponseBody
	public void newPost(@RequestParam(value="title") String title,
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
	
	@RequestMapping("/getPosts")
	@ResponseBody
	public void getPosts(@RequestParam(value="pageNo") int pageNo, 
						HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//access DAO to get posts
		ArrayList<Post> result = PostManager.getPosts(pageNo);
		
		response.getWriter().print((new Gson()).toJson(result));
	}
	
	@RequestMapping("/ViewPost")
	public void viewPost(@RequestParam(value="id") int id,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//TODO: load post here
		
		request.getRequestDispatcher("WEB-INF/view/viewPost.jsp").forward(request,response);
	}
	
	@RequestMapping("/LoadComments")
	@ResponseBody
	public void loadComments(   @RequestParam(value="postId") int postId,
								@RequestParam(value="pageNo") int pageNo,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@RequestMapping("/AddComment")
	@ResponseBody
	public void addComment( @RequestParam(value="postId") int postId,
							@RequestParam(value="author") String author,
							@RequestParam(value="comment") String comment,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
