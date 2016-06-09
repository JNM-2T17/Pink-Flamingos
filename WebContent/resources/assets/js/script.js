$(window).load(function(){
	checkScroll();

	$(window).bind('scroll', function () {
		checkScroll();
	});
});

function checkScroll(){
	var scroll = $(window).scrollTop();
	var height;

	console.log(scroll);

	if(scroll < 260){
		$('#header').css('height', (400 - scroll) + 'px');
		console.log("if");
	}
	else{
		$('#header').css('height', '140px');
		console.log("else " + $('#header').css('height'));
	}
}

function checkStrEmpty(str) {
	var error = true;
	for(var i = 0; error && i < str.length; i++) {
		if( str.charAt(i) != " " ) {
			error = false;
		}
	}
	return error;
}