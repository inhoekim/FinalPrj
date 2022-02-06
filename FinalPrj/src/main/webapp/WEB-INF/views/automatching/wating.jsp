<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.animation {
    animation: search 10s linear infinite;
}

@keyframes search {
    15%, 20% { transform: translate3d( -75%, 0px, 0px);}
    21% { transform: translate3d( -75%, 0px, 0px) scaleX(-1);}

    65%,80% {transform : translate3d(75%, 0px, 0px) scaleX(-1);}
    81%{transform : translate3d(73%, 0px, 0px);}

    100% { transform : translate3d(0, 0px, 0px); }
}

</style>
    
<div id="content">    
    <div class="myParty_container" style="min-height: 750px; max-width: 1200px; margin: auto;">
        <div style="width: 60%;margin:auto; margin-top: 110px;">
            <div style="font-size: 28px;">
                <b>댕...</b> <img src="${pageContext.request.contextPath}/resources/img/evil-32.png" style="position: relative;top:3px;"> <br>
                <div style="font-size: 26px;">지금 열심히 <b>${userName}</b> 님의 
                <b><span id="ott" style="color:#53e3ac"></span></b> 파티를 찾고 있어요!
                </div>
            </div>
            <div style="margin:20px 0;font-size: 15px;">
                잠시만 기다리면 곧 멋진 파티원분들을 만나볼 수 있을거예요.
            </div>
        </div>
        <div style="text-align: center; margin: 100px 0;">
            <img class="animation" src="${pageContext.request.contextPath}/resources/img/search-200.png">
        </div>
        <div class="confirm_button" style="width:60%; margin: auto; padding: 10px; font-size: 20px; text-align: center; margin-bottom: 20px;">
            <a style="font-size: 20px; color: white;display:inline-block;width:100%" href="${pageContext.request.contextPath}/autoMatch/cancelMatching">그냥 취소할래요..</a>
        </div>    
    </div>
</div>
<script>
	let ott = ["넷플릭스","왓챠","디즈니"];
	$(function(){
		$($(".navbar_menu_item a")[2]).addClass("active");
		$("#ott").text(ott[${watingRoomVo.ott_id}]);
	});
</script>