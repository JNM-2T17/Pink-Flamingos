var postId = 0;
var pageNo = 0;
var idCap = -1;
var maxPage = 0;
$(document).ready(function() {
	postId = $("#postId").val() * 1;
	maxPage = Math.ceil($("#commentCtr").val() / 5.0);
	
	$("#postComment").click(function() {
		var author = $("#author").val();
		var comment = $("#commentArea").val();
		var message = "";
		
		if( checkStrEmpty(author) || author.length == 0 ) {
			message += "Author cannot be empty.";
		}
		
		if( checkStrEmpty(comment) || comment.length == 0 ) {
			message += (message.length == 0 ? "" : "\n") + "Comment cannot be empty";
		}
		if( message.length > 0 ) {
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
													"<span class=\"comment-author\">" + a.author + "</span> &bull; " + 
													"<span class=\"comment-date\">" + a.date + "</span>" +
													"<p>" + a.content + "</p>" + 
													"</div>");
					} else {
						alert("Comment failed to add.");
					}
				}
			});
		}
	});
	
	loadMore();
	
	$("#loadMore").click(loadMore);
});

function loadMore() {
	pageNo++;
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
													"<span class=\"comment-author\">" + com.author + "</span> &bull; " + 
													"<span class=\"comment-date\">" + com.date + "</span>" +
													"<p>" + com.content + "</p>" + 
													"</div>";
			}
			$("#bottomSpan").before(html);
		} 
	});
//	console.log(maxPage + " " + pageNo);
	
	if( pageNo >= maxPage ) {
		$("#loadMore").remove();
	}
}