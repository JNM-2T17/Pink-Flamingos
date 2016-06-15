var maxPage = 0;
var pageNo = 1;

$(document).ready(function() {
	maxPage = Math.ceil($("#postCtr").val() * 1 / 5);
	var error = $("#error").val();
	if( error.length > 0 ) {
		alert(error);
	}

	var query = $("#query").val();
	query = query.length == 0 ? null : query;
	
	$("#loadMore").click(function() {
		pageNo++;
		$.ajax({
			url:query ? "search" : "getPosts",
			method: "POST",
			data : query ? {
				query : query,
				pageNo : pageNo
			} : {
				pageNo : pageNo
			},
			dataType : "json",
			success : function(a) {
				var html = "";
				for(x in a ) {
					var post = a[x];
					html += "<div class=\"post\">\n" + 
					"<h3>" + post.title + "</h3>" + 
					"<div class=\"post-info\">" + 
						post.author + "<br/>" + post.date +
					"</div>" + 
					"<p>" + post.content + "</p>" + 

					"<a href=\"/Pink_Flamingos/ViewPost?id=" + post.id + "\" class=\"read-more\">Read More</a>";
					var com = post.topComment;
					if( com ) {
						html += "<div class=\"commentBox\">" + 
 						"<span class=\"comment-details\"><span class=\"comment-author\">" + com.author + "</span> &bull; <span class=\"comment-date\">" + com.date + "</span></span>" + 
 						"<p>" + com.content + "</p>" + 
 						"</div>";
					}
					html += "</div><hr/>";
				}	
				$("#bottomSpan").before(html);
			}
		});
		
		checkPage();
	});
	
	checkPage();
});

function checkPage() {
	if( pageNo >= maxPage ) {
		$("#loadMore").remove();
	}
}