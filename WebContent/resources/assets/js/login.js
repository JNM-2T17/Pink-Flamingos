var mode; // 0 if login and 1 if signup

$(document).ready(function(){

	$("#login-button").click(function(){
		$("#login").css("display", "block");
		$("#signup").css("display", "none");
		$("#signup-button").parent().removeClass("active");
		$("#login-button").parent().addClass("active");
		mode = 0;
		setLoginListeners();
	});

	$("#signup-button").click(function(){
		$("#signup").css("display", "block");
		$("#login").css("display", "none");
		$("#login-button").parent().removeClass("active");
		$("#signup-button").parent().addClass("active");
		mode = 1;
		setLoginListeners();
	});
});

function setLoginListeners(){
	var id;
	if(mode == 0){
		id = "login";
	}
	else{
		id = "signup"
	}

	$("#" + id + " .cancel-user").click(function(){
		$("#" + id + " .login input").val("");
		$("#" + id).css("display", "none");
		$("#login-button").parent().removeClass("active");
		$("#signup-button").parent().removeClass("active");
	})
}