<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<jsp:include page="header.jsp"/>
<body>
	<c:if test="${not empty status }">
		<c:choose>
			<c:when test="${status }">
				<!-- code when new post is added -->
				Success
			</c:when>
			<c:otherwise>
				<!-- code when new post failed to add
						You can access previous data using ${title },
						${content }, and ${author } -->
				Failed
				${title },${content }, and ${author }
			</c:otherwise>
		</c:choose>
	</c:if>
	<form action="NewPost" method="POST">
		<input name="title"/><br/>
		<input name="author"/><br/>
		<textarea name="content"></textarea>
		<input type="submit" />
	</form>
</body>
</html>