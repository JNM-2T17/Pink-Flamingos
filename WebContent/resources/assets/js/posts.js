var maxPage = 0;
var pageNo = 1;

$(document).ready(function() {
	maxPage = Math.ceil($("#postCtr").val() * 1 / 5);
	
	$("#loadMore").click(function() {
		pageNo++;
		$.ajax({
			url:"getPosts",
			method: "POST",
			data : {
				pageNo : pageNo
			},
			dataType : "json",
			success : function(a) {
				var html = "";
				for(x in a ) {
					var post = a[x];
					console.log("inserting");
					html += "<div class=\"post\">\n" + 
					"<h3>" + post.title + "</h3>" + 
					"<div class=\"post-info\">" + 
						post.author + 
					"</div>" + 
					"<p>" + post.content + "</p>" + 

					"<a href=\"/Pink_Flamingos/ViewPost?id=" + post.id + "\" class=\"read-more\">Read More</a>";
					var com = post.topComment;
					if( com ) {
						html += "<div class=\"commentBox\">" + 
						"<h5>" + com.author + "</h5>" + 
						"<h6>" + com.date + "</h6>" + 
						"<p>" + com.content + "</p>" + 
						"</div>";
					}
					html += "</div><hr/>";
				}	
				$("#bottomSpan").before(html);
			}
		});
		
		if( pageNo == maxPage ) {
			$("#loadMore").remove();
		}
	});
});