function checkInput() {
	var title = $("#title").val();
	var author = $("#author").val();
	var content = $("#content").val();

	var message = "";
	
	if(checkStrEmpty(title)) { 
			message += (message.length == 0 ? "" : "\n") +  "Title cannot be empty.";
	}
	if(checkStrEmpty(author) ) { 
			message += (message.length == 0 ? "" : "\n") +  "Author cannot be empty.";
	}
	if(checkStrEmpty(content)) { 
			message += (message.length == 0 ? "" : "\n") +  "Content cannot be empty.";
	}
	
	if( message.length == 0 ) {
		return true;
	} else {
		$("#errorMessage").css("display", "block");
		$("#errorMessage").html(message);
		return false;
	}
}