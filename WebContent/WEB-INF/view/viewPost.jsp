<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="header.jsp"/>
	<div id="mainContent">
		<input id="postId" type="hidden" />
		<h2>Title</h2>
		<h3>Author</h3>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vel pulvinar mauris, in porta arcu. Nunc faucibus nec ipsum vel efficitur. Donec malesuada elit ipsum, vel finibus mauris malesuada vitae. Suspendisse auctor placerat libero in ullamcorper. Nulla eu ipsum elit. Cras ut ipsum id nisi consequat ultrices commodo non justo. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam in enim placerat, hendrerit turpis eget, posuere felis. Nullam pulvinar nibh vel nibh cursus varius. Suspendisse consectetur et risus quis tincidunt.
	
	Quisque a nisl bibendum, efficitur lorem id, rutrum dolor. Phasellus a egestas sem. Praesent vel massa velit. Nulla eu purus lectus. Nam semper, quam in blandit porttitor, risus neque sollicitudin quam, sed cursus lorem ipsum in ante. Nam fringilla erat sem, eu rhoncus neque elementum quis. Pellentesque sed magna varius, posuere velit sit amet, scelerisque neque. Nullam mauris sapien, posuere et fringilla quis, bibendum nec ex.
	
	Donec tincidunt, ipsum a condimentum bibendum, dolor sem tempor felis, a rhoncus turpis enim quis tortor. Nullam semper tortor ut justo auctor, non facilisis elit fermentum. Pellentesque viverra magna sed enim dapibus aliquet. Duis in dui ac risus lobortis congue nec id tortor. Sed ultrices hendrerit consequat. Morbi mattis dapibus eros eu dapibus. Vivamus vitae nisl lorem. Sed at magna bibendum, semper lacus ac, tempus augue. Cras pharetra volutpat volutpat. Ut bibendum lorem sed metus ultricies efficitur. Aenean eget diam leo.
	
	Fusce ultricies molestie arcu, nec ultrices ante fermentum at. Donec non iaculis ipsum, vel tincidunt nunc. Praesent in nisl in elit aliquet interdum. Vestibulum sed orci est. Proin ultrices nibh hendrerit aliquam commodo. Vivamus consectetur, lorem eu sodales aliquam, massa nisi vestibulum nunc, id sagittis ipsum metus et ligula. Maecenas vestibulum lectus sed nisl ornare, at fermentum est iaculis. Integer commodo justo sed lectus porttitor tincidunt. Sed vel justo risus.
	
	Duis vitae dapibus erat, vel commodo turpis. Etiam sapien metus, sollicitudin a nisi vitae, eleifend vulputate erat. Proin ultrices leo quam, ac dapibus quam hendrerit in. Ut quis interdum velit. Etiam quis augue eget purus gravida euismod a sed augue. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Mauris at elit commodo, dictum est id, tincidunt massa. Donec ac accumsan nunc. Fusce nec sodales massa.</p>
	
		<script src="<c:url value="resources/assets/js/viewPost.js"/>"></script>
		<div id="comments">
			<div id="commentForm">
				<input id="author" /><br/>
				<textarea id="commentArea"></textarea><br/>
				<button id="postComment">Post Comment</button>
			</div>
			<div id="commentList">
				<a id="loadMore">Load More</a>
			</div>
		</div>
	</div>
<jsp:include page="footer.jsp"/>