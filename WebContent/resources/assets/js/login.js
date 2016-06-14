var mode; // 0 if login and 1 if signup

$(document).ready(function(){

	$("#login-button").click(function(){
		$("#login").css("display", "block");
		$("#signup-button").parent().removeClass("active");
		$("#login-button").parent().addClass("active");
		mode = 0;
		setLoginListeners();
	});

	$("#signup-button").click(function(){
		$("#login").css("display", "block");
		$("#login-button").parent().removeClass("active");
		$("#signup-button").parent().addClass("active");
		mode = 1;
		setLoginListeners();
	});
});

function setLoginListeners(){
	$("#cancel-user").click(function(){
		$("#login input").val("");
		$("#login").css("display", "none");
		$("#login-button").parent().removeClass("active");
		$("#signup-button").parent().removeClass("active");
	})
}