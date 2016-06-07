<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
	<div id="mainContent">
		<!-- temporary -->
		<input id="postId" type="hidden" value="${post.id }"/>
		<input id="commentCtr" type="hidden" value="${commentCtr }"/>
		<h2>${post.title }</h2>
		<h3>${post.author }</h3>
		<p>${post.content }</p>
	
		<script src="<c:url value="resources/assets/js/viewPost.js"/>"></script>
		<div id="comments">
			<div id="commentForm">
				<input id="author" /><br/>
				<textarea id="commentArea"></textarea><br/>
				<button id="postComment">Post Comment</button>
			</div>
			<div id="commentList">
				<span id="bottomSpan"><a id="loadMore">Load More</a></span>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>