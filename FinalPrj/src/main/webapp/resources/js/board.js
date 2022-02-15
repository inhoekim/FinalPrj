'use strict'

$(document).ready(function() {
	$(".topbar_title").click(function(event){
		$(event.target).siblings(".topbar_content").children(".content_wrapper").toggleClass("open");
	}) 
})