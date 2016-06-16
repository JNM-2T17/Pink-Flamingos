<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="header.jsp"/>
	<script src="<c:url value="/resources/assets/js/newPost.js" />"></script>
				<div id="content-full">
					<h3>Create Post</h3>
					
					<div class="status">
					<c:if test="${not empty status }">
						<c:choose>
							<c:when test="${status }">
								<!-- code when new post is added -->
								Successfully added
							</c:when>
							<c:otherwise>
								<!-- code when new post failed to add
										You can access previous data using ${title },
										${content }, and ${author } -->
								Unable to add
							</c:otherwise>
						</c:choose>
					</c:if>
					</div>
					<form action="NewPost" method="POST" onSubmit="return checkInput();">
						<div class="form-desc">title</div>
						<textarea id="title" name="title" class="form-textarea title-textarea"></textarea>
						<hr>
						<div class="form-desc">author</div>
						${sessionScope.session_user.username }
						<input type="hidden" id="author" name="author" value="${sessionScope.session_user.id }"/>
						<hr>
						<div class="form-desc">text</div>
						<textarea id="content" name="content" class="form-textarea text-textarea"></textarea>
						<hr>
						<button class="action-button" type="submit"><i class="fa fa-plus-circle"></i>&nbsp;&nbsp;Submit</button>
					</form>
				</div>
<jsp:include page="footer.jsp"/>