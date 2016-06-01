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

						<a href="/ViewPost&id=${post.id }" class="read-more">Read More</a>
					</div>

					<hr>
	</c:forEach>
				</div>
<jsp:include page="sidebar.jsp"/>
<jsp:include page="footer.jsp"/>