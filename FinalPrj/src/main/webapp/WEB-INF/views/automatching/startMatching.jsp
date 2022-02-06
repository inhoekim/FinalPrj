<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="content">    
	<div class="myParty_container" style="min-height: 750px; max-width: 1200px; margin: auto;">
	    <div style="width: 60%;margin:auto; margin-top: 110px;">
	        <div style="font-size: 30px;">
	            <b>${userName}</b> 님은<br>가입한 파티가 아직 존재하지않아요
	            <img src="${pageContext.request.contextPath}/resources/img/sorry-32.png" style="position: relative;top:3px;">
	        </div>
	        <div style="margin:20px 0;">
	            지금 <span style="color: #53e3ac"><b>파티매칭</b></span>을 시작하고 편리하게 계정을 공유해보세요!
	            <img src="${pageContext.request.contextPath}/resources/img/disgusted-24.png" style="position: relative;top:4px;">
	        </div>
	    </div>
	    <div style="text-align: center; margin: 100px 0;">
	        <img src="${pageContext.request.contextPath}/resources/img/invitation-200.png">
	    </div>
	    <div class="confirm_button" style="width:60%; margin: auto; padding: 10px; font-size: 20px; text-align: center; margin-bottom: 20px;">
	        <a style="font-size: 20px; color: white;" href="${pageContext.request.contextPath}/autoMatch/matching">매칭 시작해볼래요!</a>
	    </div>
	    
	</div>
</div>
<script>
	$(function(){
		$($(".navbar_menu_item a")[2]).addClass("active");

	});
</script>