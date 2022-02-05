'use strict'

let bank = ["KEB하나", "KB국민", "신한", "NH농협", "우체국", "IBK기업"];
let bank_src = ["KEBhana_52.png","KBkookmin_52.png","shinhan_52.png","NHnonghyup-52.png","koreaPost-52.png","ibk_52.png"];

function confirm_bank(){
    $("#bank_account").stop(true,true);

    let bank_id = $("input[type='radio']:checked").val();
    if(bank_id == null) {
        console.log($($(".banks_box .box_title")[0]));
        $(".banks_box .box_title").css("color","#f32e2ed7");
        animate_shake(".banks_box .box_title",3);
        return;
    }
    $(".banks_box .box_title").css("color","black");
    let account = $("#bank_account").val();
    let regexr = /[0-9]{10,15}$/;
    if(account == "") {
        $("#bank_account").removeClass("waring");
        $("#bank_account").val("");
        $("#bank_account").addClass("waring");
        $("#bank_account").prop("placeholder", "정산받을 계좌번호를 입력해주세요");
        animate_shake("#bank_account",3);
        
        $("#bank_account").focus();
    }
    else if(!regexr.test(account)) {
        $("#bank_account").val("");
        $("#bank_account").addClass("waring");
        $("#bank_account").prop("placeholder", "올바르지 않은 형식의 계좌번호입니다!");
        animate_shake("#bank_account",3);
        $("#bank_account").focus();
    }
    else {
        let src = getCp() + "/resources/img/bank_logos/" + bank_src[bank_id];
        $(".banks_box .result_left img").attr("src", src);
        $(".box_result .content1").text(bank[bank_id]);
        $(".box_result .content2").text(account);
    
        $(".banks_box .box_title").addClass("hidden");
        $(".banks_box .box_content").addClass("hidden");
        $(".banks_box .box_input").addClass("hidden");
        $(".banks_box button").addClass("hidden");
        $(".banks_box .box_result").removeClass("hidden");
        $(".box").removeClass("active");
        
    }
} 

function change_result(){
    $(".banks_box .box_title").removeClass("hidden");
    $(".banks_box .box_content").removeClass("hidden");
    $(".banks_box .box_input").removeClass("hidden");
    $(".banks_box button").removeClass("hidden");
    $(".banks_box .box_result").addClass("hidden");
    $(".box").addClass("active");
}

function last_confirm(event){
    let id_regexr = /^[a-z]+[a-z0-9]{5,30}$/;
    let pwd_regexr = /[a-z0-9]{8,20}$/;

    let bank_box = $(".banks_box .box.active")[0];
    let share_id = $("#share_id").val();
    let share_pwd = $("#share_pwd").val();

    if(bank_box != undefined) {
        event.preventDefault();
        animate_shake(bank_box,2);
        
    }
    else if(!id_regexr.test(share_id)) {
        event.preventDefault();
        $("#share_id").val("");
        $("#share_id").focus();
        $("#share_id").prop("placeholder", "올바르지 않은 형식의 아이디입니다!");
        animate_shake("#share_id",2);
        
    }
    else if(!pwd_regexr.test(share_pwd)) {
        event.preventDefault();
        $("#share_id").val("");
        $("#share_pwd").focus();
        animate_shake("#share_pwd",2);
    }
}

