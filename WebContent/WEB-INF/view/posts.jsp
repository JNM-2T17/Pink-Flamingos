<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
				<div id="content">
				<input type="hidden" id="error" value="${error }"/>
				<input type="hidden" id="query" value="${query }"/>
	<c:choose>
		<c:when test="${postCtr > 0 }">
			<c:forEach items="${posts }" var="post">
					<div class="post">
						<h3>${post.title }</h3>
						<div class="post-info">
							${post.author }<br/>
							${post.date }
						</div>

						<p>${post.content }</p>

	 						<a href="/Pink_Flamingos/ViewPost?id=${post.id }" class="read-more">Read More</a>
	 					<c:if test="${not empty post.topComment }">
	 					<div class="commentBox">
	 						<c:set var="com" value="${post.topComment }" />
	 						<span class="comment-details"><span class="comment-author">${com.author }</span> &bull; <span class="comment-date">${com.date }</span></span>
	 						<p>${com.content }</p>
	 					</div>
	 					</c:if>
 					</div>

					<hr>
			</c:forEach>
		<span id="bottomSpan"><a id="loadMore">Load More</a></span>
		</c:when>
		<c:otherwise>
		<h3>No posts to show</h3>
		</c:otherwise>
	</c:choose>
	</div>
	
	<input type="hidden" id="postCtr" value="${postCtr }" />
	<script src="<c:url value="/resources/assets/js/posts.js" />"></script>
				
<jsp:include page="sidebar.jsp"/>
<jsp:include page="footer.jsp"/>