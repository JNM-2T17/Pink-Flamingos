var postId = 0;
var pageNo = 1;
var idCap = -1;
var maxPage = 1000;
$(document).ready(function() {
	postId = $("#postId").val() * 1;
	maxPage = Math.ceil($("#commentCtr").val() / 5.0);
	
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
				dataType : "json",
				success : function(a) {
					if( a ) {
						$("#author").val("");
						$("#commentArea").val("");
						//TODO: prepend html for comment
						$("#commentList").prepend("<div class=\"comment\">" + 
													"<h5>" + a.author + "</h5>" + 
													"<h6>" + a.date + "</h6>" +
													"<p>" + a.content + "</p>" + 
													"</div>");
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
		if( pageNo == maxPage ) {
			$("#loadMore").remove();
		}
	});
});

function loadPosts(pageNo) {
	$.ajax({
		url : "LoadComments",
		method : "POST",
		data : {
			postId : postId,
			pageNo : pageNo,
			idCap : idCap
		},
		dataType : "json",
		success : function(a) {
			//TODO: add HTML
			var html = "";
			for( x in a ) {
				var com = a[x];
				if( idCap == -1 ) {
					idCap = com.id;
				}
				
				html += "<div class=\"comment\">" + 
				"<h5>" + com.author + "</h5>" + 
				"<h6>" + com.date + "</h6>" +
				"<p>" + com.content + "</p>" + 
				"</div>";
			}
			$("#bottomSpan").before(html);
		} 
	});
}