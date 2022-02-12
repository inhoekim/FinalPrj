'use strict'

$(function() {
    //게시판 Menu바 움직임(span영역클릭)
    $(".category_name").click(function(e) {
        folder_toggle(e.target);
    })
    //게시판 Menu바 움직임(arrow영역클릭)
    $(".fa-angle-down").click(function(e) {
        let target = $(e.target).siblings('.category_name');
        folder_toggle(target);
    })
})

function folder_toggle(target) {
    $(target).toggleClass("active");
    if($(target).children('i').hasClass('fa-folder')){
        $(target).children('i').removeClass('fa-folder');
        $(target).children('i').addClass('fa-folder-open');
        //arrow 뒤집기
        $(target).parent().children('i').css('transform','rotate(-180deg)' );
    }else {
        $(target).children('i').removeClass('fa-folder-open');
        $(target).children('i').addClass('fa-folder');
        //arrow 뒤집기
        $(target).parent().children('i').css('transform','rotate(0)' );
    }
    
    $(target).parent().siblings('.folder_items').toggleClass('active');
};

