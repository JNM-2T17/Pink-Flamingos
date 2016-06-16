function checkInput() {
	var title = $("#title").val();
	var author = $("#author").val();
	var content = $("#content").val();

	var message = "";
	
	if(checkStrEmpty(title)) { 
			message += (message.length == 0 ? "" : "<br/>") +  "Title cannot be empty.";
	}
	if(checkStrEmpty(author) ) { 
			message += (message.length == 0 ? "" : "<br/>") +  "Author cannot be empty.";
	}
	if(checkStrEmpty(content)) { 
			message += (message.length == 0 ? "" : "<br/>") +  "Content cannot be empty.";
	}
	
	if( message.length == 0 ) {
		return true;
	} else {
		$("#errorMessage").css("display", "block");
		$("#errorMessage").html(message);
		return false;
	}
}