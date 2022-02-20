'use strict'

$(function(){    
	$(".comment_profile").click(function(event){
		$(".profile_box_Wrapper").remove();
	
		$("<div class='profile_box_Wrapper'><div class='profile_box'></div></div>").appendTo("body").css({
			"top": event.pageY + 5,
			"left": event.pageX + 5,
			"position": "absolute"
		});
		
		let user_id = $(this).children(".profile_id").text();
		$("<a class='box_content' href='" + user_id + "'>최근글 보기</a>").appendTo(".profile_box");
		$("<a class='box_content' href='" + user_id + "'>최근댓글 보기</a>").appendTo(".profile_box");
		
	});
	
	$(".user_profile").click(function(event){
		$(".profile_box_Wrapper").remove();

		$("<div class='profile_box_Wrapper'><div class='profile_box'></div></div>").appendTo("body").css({
			"top": event.pageY + 5,
			"left": event.pageX + 5,
			"position": "absolute"
		});
		
		let user_id = $(this).children("span").text();
		$("<a class='box_content' href='" + user_id + "'>최근글 보기</a>").appendTo(".profile_box");
		$("<a class='box_content' href='" + user_id + "'>최근댓글 보기</a>").appendTo(".profile_box");
		
	});

	//profile_box창 이외 영역 클릭시 되돌아오기
    $(document).mouseup(function(event){       
        if($(".profile_box_Wrapper").has(event.target).length === 0){
            $(".profile_box_Wrapper").remove();
        };
    })  
});

