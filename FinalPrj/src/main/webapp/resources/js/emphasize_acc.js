'use strict'

$(function(){
    let acc_state = false;
    //info창 이벤트 등록
    $(".accusation").click(function(){
        $("html").css("pointer-events" , "none");
        $("#accWrapper").css("pointer-events" , "auto");
        $("#accWrapper").removeClass("hidden");
        acc_state = true;
    	});
    
    //info창 이외 영역 클릭시 되돌아오기
    $(document).mouseup(function(event){       
        // 영역 외 클릭시
        if($("#accWrapper").has(event.target).length === 0 && acc_state === true){
            $("#accWrapper").toggleClass("hidden");
            acc_state = false;
            $("html").css("pointer-events" , "auto");
        };
        
    // login 박스 영역 안 x 클릭이벤트   
    $("#cancle").off('click').on('click', function(){
	    $("#accWrapper").toggleClass("hidden");
	    acc_state = false;
	    $("html").css("pointer-events" , "auto");
    	});   
  
    })       
});
