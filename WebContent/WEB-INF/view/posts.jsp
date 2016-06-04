<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
				<div id="content">
	<c:forEach items="${posts }" var="post">
					<div class="post">
						<h3>${post.title }</h3>
						<div class="post-info">
							${post.author }
						</div>

						<p>${post.content }</p>

	 						<a href="/Pink_Flamingos/ViewPost?id=${post.id }" class="read-more">Read More</a>
	 					<c:if test="${not empty post.topComment }">
	 					<div class="commentBox">
	 						<c:set var="com" value="${post.topComment }" />
	 						<h5>${com.author }</h5>
	 						<h6>${com.date }</h6>
	 						<p>${com.content }</p>
	 					</div>
	 					</c:if>
 					</div>

					<hr>
	</c:forEach>
		<span id="bottomSpan"><a id="loadMore">Load More</a></span>
	</div>
	
	<input type="hidden" id="postCtr" value="${postCtr }" />
	<script src="<c:url value="/resources/assets/js/posts.js" />"></script>
				
<jsp:include page="sidebar.jsp"/>
<jsp:include page="footer.jsp"/>