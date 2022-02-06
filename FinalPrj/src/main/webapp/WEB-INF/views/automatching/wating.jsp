<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">    
    <div class="myParty_container" style="min-height: 750px; max-width: 1200px; margin: auto;">
        <div style="width: 60%;margin:auto; margin-top: 110px;">
            <div style="font-size: 28px;">
                <b>댕...</b> <img src="${pageContext.request.contextPath}/resources/img/evil-32.png" style="position: relative;top:3px;"> <br>
                지금 열심히 <b>${userName}</b> 님의 파티를 찾고 있어요!
                
            </div>
            <div style="margin:20px 0;font-size: 15px;">
                잠시만 기다리면 곧 멋진 파티원분들을 만나볼 수 있을거예요.
            </div>
        </div>
        <div style="text-align: center; margin: 100px 0;">
            <img class="animation" src="${pageContext.request.contextPath}/resources/img/search-200.png">
        </div>
        <div class="confirm_button" style="width:60%; margin: auto; padding: 10px; font-size: 20px; text-align: center; margin-bottom: 20px;">
            <a style="font-size: 20px; color: white;" href="${pageContext.request.contextPath}/autoMatch/cancelMatching">그냥 취소할래요..</a>
        </div>    
    </div>
</div>
<script>
	$(function(){
		$($(".navbar_menu_item a")[2]).addClass("active");
	});
</script>