package web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Comment;
import model.Post;
import model.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import dao.CommentManager;
import dao.PostManager;
import dao.UserManager;

@Controller
public class TheController {
	@RequestMapping("/")
	public void home(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//new posts retrieval
		int postCtr = PostManager.getPostCount();
		Post[] posts = PostManager.getPosts(1);		
		
		request.setAttribute("postCtr", postCtr);
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("WEB-INF/view/posts.jsp").forward(request,response);
	}
	
	@RequestMapping("/AboutUs")
	public void aboutUs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("WEB-INF/view/aboutUs.jsp").forward(request, response);
	}
	
	@RequestMapping("/AddComment")
	@ResponseBody
	public void addComment( @RequestParam(value="postId") int postId,
							@RequestParam(value="author") int author,
							@RequestParam(value="comment") String comment,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comment c = CommentManager.addComment(postId, author, comment);
		
		response.getWriter().print((new Gson()).toJson(c));
	}
	
	@RequestMapping("/getPosts")
	@ResponseBody
	public void getPosts(@RequestParam(value="pageNo") int pageNo, 
						HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//access DAO to get posts
		Post[] result = PostManager.getPosts(pageNo);
		
		response.getWriter().print((new Gson()).toJson(result));
	}
	
	@RequestMapping("/LoadComments")
	@ResponseBody
	public void loadComments(   @RequestParam(value="postId") int postId,
								@RequestParam(value="pageNo") int pageNo,
								@RequestParam(value="idCap") int idCap,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comment[] comments;
		if( idCap == -1) {
			comments = CommentManager.getComments(postId,pageNo);
		} else {
			comments = CommentManager.getComments(postId, pageNo, idCap);
		}
		
		response.getWriter().print((new Gson()).toJson(comments));
	}
	
	@RequestMapping("/login")
	@ResponseBody
	public void login(@RequestParam(value="username") String username,
					  @RequestParam(value="password") String password,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User result = UserManager.login(username,password);
			if( result != null ) {
				request.getSession().setAttribute("session_user", result);
				Cookie c = new Cookie("session_user","" + result.getId());
				c.setMaxAge(172800);
				response.addCookie(c);
			} else {
				request.setAttribute("error","Wrong Password");
			}
		} catch(Exception e) {
			request.setAttribute("error", e.getMessage());
		}
		home(request,response);
	}
	
	@RequestMapping("/logout")
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		Cookie[] cookies = request.getCookies();
		for( Cookie c : cookies ) {
			if(c.getName().equals("session_user") ) {
				c.setMaxAge(0);
				response.addCookie(c);
				break;
			}
		}
		home(request,response);
	}
	
	@RequestMapping(value="/NewPost",method=RequestMethod.GET)
	public void newPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if( request.getSession().getAttribute("session_user") == null ) {
			home(request,response);
		}
		request.getRequestDispatcher("WEB-INF/view/newPost.jsp").forward(request, response);
	}
	
	@RequestMapping(value="/NewPost",method=RequestMethod.POST)
	@ResponseBody
	public void newPost(@RequestParam(value="title") String title,
						@RequestParam(value="author") int author,
						@RequestParam(value="content") String content,
						HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean status = PostManager.addPost(title,author,content);
		
		request.setAttribute("status", status);
		if( !status ) {
			request.setAttribute("title",title);
			request.setAttribute("author", author);
			request.setAttribute("content", content);
			request.getRequestDispatcher("WEB-INF/view/newPost.jsp").forward(request,response);
		} else {
			home(request,response);
		}
	}
	
	@RequestMapping(value="/register")
	@ResponseBody
	public void register(@RequestParam(value="username") String username,
					  @RequestParam(value="password") String password,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User result = UserManager.addUser(username,password);
			if( result != null ) {
				request.getSession().setAttribute("session_user", result);
				Cookie c = new Cookie("session_user","" + result.getId());
				c.setMaxAge(172800);
				response.addCookie(c);
			} else {
				request.setAttribute("error","Registration Failed");
			}
		} catch(Exception e) {
			request.setAttribute("error",e.getMessage());
		}
	
		request.getRequestDispatcher("WEB-INF/view/posts.jsp").forward(request, response);
	}
	
	public void cookieCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		for(Cookie c: request.getCookies()) {
			if( c.getName().equals("session_user") ) {
				int id = Integer.parseInt(c.getValue());
				User u = UserManager.getUser(id);
			}
		}
	}
	
	@RequestMapping(value="/search",method=RequestMethod.GET)
	public void search(@RequestParam(value="query") String query,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//new posts retrieval
		int postCtr = PostManager.getPostCount(query);
		Post[] posts = PostManager.searchPost(query,1);		
		
		request.setAttribute("query", query);
		request.setAttribute("postCtr", postCtr);
		request.setAttribute("posts", posts);
		request.getRequestDispatcher("WEB-INF/view/posts.jsp").forward(request,response);
	}
	
	@RequestMapping(value="/search",method=RequestMethod.POST)
	@ResponseBody
	public void searchPosts(@RequestParam(value="query") String search,
						@RequestParam(value="pageNo") int pageNo,
						HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Post[] result = PostManager.searchPost(search,pageNo);
		response.getWriter().print((new Gson()).toJson(result));
	}
	
	@RequestMapping("/ViewPost")
	public void viewPost(@RequestParam(value="id") int id,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//TODO: load post here
		
		int commentCtr = CommentManager.commentCount(id);
		Post post = PostManager.getPost(id);
		
		//TEMPORARY
		request.setAttribute("post", post);
		request.setAttribute("commentCtr", commentCtr);
		
		request.getRequestDispatcher("WEB-INF/view/viewPost.jsp").forward(request,response);
	}
}
