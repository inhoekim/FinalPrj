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