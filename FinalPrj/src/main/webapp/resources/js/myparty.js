'use strict'

$(function(){
    let info_state = false;
    //info 버튼 이벤트 등록
    $("#info").click(function(){
        $("html").css("pointer-events" , "none");
        $("#info_div").css("pointer-events" , "auto");
        $("#info_div").removeClass("hidden");
        info_state = true;
    	});
    
    //info창 이외 영역 클릭시 되돌아오기
    $(document).mouseup(function(event){       
        // 영역 외 클릭시
        if($("#info_div").has(event.target).length === 0 && info_state === true){
            $("#info_div").toggleClass("hidden");
            info_state = false;
            $("html").css("pointer-events" , "auto");
        };
        
    // login 박스 영역 안 x 클릭이벤트   
    $(".cancle").off('click').on('click', function(){
	    $("#info_div").toggleClass("hidden");
	    info_state = false;
	    $("html").css("pointer-events" , "auto");
    	});   
  
    })       
});
