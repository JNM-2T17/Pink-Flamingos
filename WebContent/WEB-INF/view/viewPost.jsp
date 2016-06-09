<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
	<div id="mainContent">
		<div id="content-full">
			<div class="post">
				<h3>${post.title }</h3>
				<div class="post-info">
					${post.author }<br/>
					${post.date }<br />
				</div>

				<p>${post.content }</p>
			</div>
			<input id="postId" type="hidden" value="${post.id }"/>
			<input id="commentCtr" type="hidden" value="${commentCtr }"/>

			<hr>
		
			<script src="<c:url value="resources/assets/js/viewPost.js"/>"></script>
			<div id="comments">
				<div id="commentForm">
					<textarea id="commentArea" placeholder="Comment"></textarea>
					<input id="author" placeholder="Name"/> <button id="postComment">Post Comment</button>
				</div>
				<div id="commentList">
					<span id="bottomSpan"><a id="loadMore">Load More</a></span>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>