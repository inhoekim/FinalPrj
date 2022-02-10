'use strict'

$(document).ready(function() {
    $(document).scroll(function () {
        let navbar_height = $("#navbar")[0].getBoundingClientRect().height; 
        if(navbar_height/4 <= window.scrollY) {
            $("#navbar").addClass("navbar--scroll");
            $("body").css("padding-top",navbar_height);
        }
        else{
            $("#navbar").removeClass("navbar--scroll");
            $("body").css("padding-top", 0);
        }
        
    })
})

//컨텍스트 패스
function getCp(){
    return window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
}


//clipBoard 함수
function clipBoard(target) {
    //복사
    $("#my_clipBoard").val($(target).text());
    $("#my_clipBoard").select();
    document.execCommand("copy");
    //애니메이션
    let check_str = $(target).parent().siblings(".content_right").children()[0];
    let copy_str = $(target).parent().siblings(".content_right").children()[1];

    $(copy_str).addClass("copy_str");
    $(check_str).addClass("check_str");

    $(copy_str).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function (e) {
        $(copy_str).removeClass('copy_str');
    });
    $(check_str).bind('animationend webkitAnimationEnd MSAnimationEnd oAnimationEnd', function (e) {
        $(check_str).removeClass('check_str');
    });


}
