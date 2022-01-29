let otts = ["넷플릭스", "왓챠", "디즈니"];
let cost = [5240, 4215, 3465];
let roles = ["파티장", "파티원"];
let ott_src = ["icon_netflix_x2.png","icon_watcha_x2.png","icon_disney_x2.png"];
let role_src = ["leader-32.png","member-32.png"];
/*ott 선택버튼*/

function getContextPath() {
  return sessionStorage.getItem("cp");
}

function choice_ott(ott){
    let otts_box = $(".box.otts_box")[0];
    let ott_boxTitle = $(otts_box).children(".box_title");
    let role_box = $(".box.role_box")[0];
    let role_boxTitle = $(role_box).children(".box_title");
    let payment_box = $(".box.payment_box")[0];
    let payment_boxTitle = $(payment_box).children(".box_title");

    $(otts_box).removeClass("active");
    $(".box.otts_box .box_title").addClass("complete");
    
    let src = getContextPath() + "/resources/img/ott_logos/";
    let img = "<img src='" + src + ott_src[ott] +"' class='icon'>";
    ott_boxTitle.html("<div class='inner_title'>" + img + otts[ott] + " 볼래요 !</div>");
    $("<span class='change'>변경</span>").appendTo(ott_boxTitle).on("click",function(){ 
        //ott박스 재활성화
        $(".box.otts_box .box_content").removeClass("hidden");
        $(otts_box).addClass("active");
        //자신보다 아랫단계의 box 비활성화
        $(role_box).removeClass("active");
        $(".box.payment_box").removeClass("active");
        //문구 되돌리기 (변경 span제거)
        $(ott_boxTitle).text("보고싶은 OTT를 선택해주세요");
        $(role_boxTitle).html(" 파티 이용 역할을 선택해주세요");
        $(payment_boxTitle).html(" 이용료를 확인해주세요");
        $(".role_box .circlenum").removeClass("hidden");
        $(".payment_box .circlenum").removeClass("hidden");
        //다른박스 content들 hidden 활성화
        $(".box.role_box .box_content").addClass("hidden");
        $(".box.payment_box .box_content").addClass("hidden");
        //다른박스 title들 complete 비활성화
        $(".box.role_box .box_title").removeClass("complete");
        $(".box.payment_box .box_title").removeClass("complete");

    })
    //ott박스 내용 가리기
    $(".box.otts_box .box_content").addClass("hidden");
    //role박스 타이틀번호가리기
    $(".role_box .circlenum").addClass("hidden");
    //role박스 내용 보이기
    $(".box.role_box .box_content").removeClass("hidden");
    $(".box.role_box").addClass("active");

    //form에 값 담기
    $("#ott").val(ott);
    $("#cost").val(cost[ott]);
} 

/*party box에서 ver전환*/
function choice_ver(ver){
    let vers = [".master", ".member"];
    let otherVer = 1 - ver;
    $($(".choice_ver").children()[ver]).addClass("c");
    $($(".choice_ver").children()[otherVer]).removeClass("c");
    $(vers[ver]).removeClass("hidden");
    $(vers[otherVer]).addClass("hidden");
}


/*party 선택버튼*/
function choice_role(role){
    let role_box = $(".box.role_box")[0];
    let role_boxTitle = $(role_box).children(".box_title");
    let payment_box = $(".box.payment_box")[0];
    let payment_boxTitle = $(payment_box).children(".box_title");
    
    $(role_box).removeClass("active");
    $(".box.role_box .box_title").addClass("complete");

    let src = getContextPath() + "/resources/img/";
    let img = "<img src='" + src + role_src[role] +"' class='icon'>";
    role_boxTitle.html("<div class='inner_title'>" + img + roles[role] + "으로 이용할게요</div>");
    $("<span class='change'>변경</span>").appendTo(role_boxTitle).on("click",function(){ 
        //role박스 재활성화
        $(".box.role_box .box_content").removeClass("hidden");
        $(role_box).addClass("active");
        //자신보다 아랫단계의 box 비활성화
        $(".box.payment_box").removeClass("active");
        //문구 되돌리기 (변경 span제거)
        $(role_boxTitle).text("파티 이용 역할을 선택해주세요");
        $(payment_boxTitle).html(" 이용료를 확인해주세요");
        $(".payment_box .circlenum").removeClass("hidden");
        //다른박스 content들 hidden 활성화
        $(".box.payment_box .box_content").addClass("hidden");
        //다른박스 title들 complete 비활성화
        $(".box.payment_box .box_title").removeClass("complete");
    })

    //role 박스 내용 가리기
    $(".box.role_box .box_content").addClass("hidden");
    //payment박스 타이틀번호가리기
    $(".payment_box .circlenum").addClass("hidden");
    //payment 박스 활성화
    $(".payment_box .box_content").removeClass("hidden");
    $(".payment_box").addClass("active");
    //payment button ver 처리
    $($(".payment_box .confirm_button")[0]).removeClass("hidden");
    $($(".payment_box .confirm_button")[1]).removeClass("hidden");
    let another_role = 1 - role;
    console.log($(".payment_box .confirm_button"));
    $($(".payment_box .confirm_button")[another_role]).addClass("hidden");
    //form에 값 담기
    $("#role").val(role);
}
