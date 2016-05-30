<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>
<body>
	<c:forEach items="${posts }" var="post">
		<div>
			<h1><a href="/ViewPost&id=${post.id }">${post.title }</a></h1>
			<h2>${post.author }</h2>
			<p>${post.content }</p>
		</div>
	</c:forEach>
</body>
</html>