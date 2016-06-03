var postId = 0;
var pageNo = 1;
$(document).ready(function() {
	postId = $("#postId").val() * 1;
	
	$("#postComment").click(function() {
		var author = $("#author").val();
		var comment = $("#commentArea").val();
		if( author.length == 0 || comment.length == 0 ) {
			var message = "";
			if( author.length == 0 ) {
				message += "Author cannot be empty.";
			}
			
			if( comment.length == 0 ) {
				message += (message.length == 0 ? "" : "\n") + "Comment cannot be empty";
			}
			//change this to modal
			alert(message);
		} else {
			$.ajax({
				url : "AddComment",
				method : "POST",
				data : {
					postId : postId,
					author : author,
					comment : comment
				},
				success : function(a) {
					if( a === "true") {
						$("#author").val("");
						$("#commentArea").val("");
						//TODO: prepend html for comment
						$("#commentList").prepend("");
					} else {
						alert("Comment failed to add.");
					}
				}
			});
		}
	});
	
	loadPosts(pageNo);
	
	$("#loadMore").click(function() {
		pageNo++;
		loadPosts(pageNo);
		//TODO if pageNo is past number of comments, remove Load More
	});
});

function loadPosts(pageNo) {
	$.ajax({
		url : "LoadComments",
		method : "POST",
		data : {
			postId : postId,
			pageNo : pageNo
		},
		dataType : "json",
		success : function(a) {
			//add HTML
		} 
	});
}