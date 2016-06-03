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
				for(x in a ) {
					var post = a[x];
					console.log("inserting");
					$("#bottomSpan").before("<div class=\"post\">\n" + 
							"<h3>" + post.title + "</h3>" + 
							"<div class=\"post-info\">" + 
								post.author + 
							"</div>" + 
							"<p>" + post.content + "</p>" + 

							"<a href=\"/Pink_Flamingos/ViewPost?id=" + post.id + "\" class=\"read-more\">Read More</a>" +
						"</div><hr/>");
				}	
			}
		});
		
		if( pageNo == maxPage ) {
			$("#loadMore").remove();
		}
	});
});