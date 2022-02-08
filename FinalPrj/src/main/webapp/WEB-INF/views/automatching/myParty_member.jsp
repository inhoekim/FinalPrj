<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<div id="content">
    <div class="myParty_container">
        <div class="myParty_box">
            <div class="box_title">
                <div class="title_left">
                    <img src="#">
                    <div class="two_line">
                        <span class="line_top">${ottVo.ott_name} 프리미엄 파티</span>
                        <span class="line_bottom">파티원으로 이용중</span>
                    </div>
                </div>    

                <a class="title_right" href="#">
                    <i class="fas fa-cog party_setting"></i>
                </a> 
            </div>

            <div class="box_content">
                <div class="member_container">
                    <div class="member_roll">
                        <div class="leader_box">파티장</div> 
                        <div class="gap_box"></div>
                        <div class="member_box">파티원</div>
                    </div>

                    <div class="member_profile">
                        <div class="leader_box">
                            <div class="profile_item">
                                <img src="#">
                                <span class="profile_id"></span>
                            </div>
                        </div> 

                        <div class="gap_box"></div>

                        <div class="member_box">
                            <div class="profile_item">
                                <img src="#">
                                <span class="profile_id"></span>
                                <span class="payment_state"></span>
                            </div>

                            <div class="profile_item">
                                <img src="#">
                                <span class="profile_id"></span>
                                <span class="payment_state"></span>
                            </div>

                            <div class="profile_item">
                                <img src="#">
                                <span class="profile_id"></span>
                                <span class="payment_state"></span>
                            </div>
                        </div>
                    </div>
                </div>
        
            
            </div>
        </div> 
    </div>
</div>

<c:forEach var="vo" items="${matching_list}">
	<div>테스트: ${vo.user_id}</div>
</c:forEach>

<script>
	$(function(){
		$($(".navbar_menu_item a")[2]).addClass("active");
		if("${msg}" != ""){
			alert("${msg}");
		}
	});
</script>
