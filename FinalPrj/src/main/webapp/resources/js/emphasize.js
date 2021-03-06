'use strict'

$(function(){
    let login_state = false;
    //info창 이벤트 등록
    $("#login_div").click(function(){
        $("html").css("pointer-events" , "none");
        $("#loginWrapper").css("pointer-events" , "auto");
        $("#loginWrapper").removeClass("hidden");
        login_state = true;
    	});
    
    //info창 이외 영역 클릭시 되돌아오기
    $(document).mouseup(function(event){       
        // 영역 외 클릭시
        if($("#loginWrapper").has(event.target).length === 0 && login_state === true){
            $("#loginWrapper").toggleClass("hidden");
            login_state = false;
            $("html").css("pointer-events" , "auto");
        };
        
    // login 박스 영역 안 x 클릭이벤트   
    $("#cancle").off('click').on('click', function(){
	    $("#loginWrapper").toggleClass("hidden");
	    login_state = false;
	    $("html").css("pointer-events" , "auto");
    	});   
  
    })       
});
