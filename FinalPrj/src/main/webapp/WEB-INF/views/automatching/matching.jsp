<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="content">
    <div class="matching_container">
        <div class="box statistics_box">
            <h3 class="box_title">최근 일주일 매칭 현황</h3>
            <div class="numboxs">
	            	 <div class="numbox">
	            	 	<div class="box_wrapper box1">
		            	 	<c:forEach begin="0" end="1">
		            	 	<c:forEach var="i" begin="0" end="9">
		            	 		<div class="box1">${i}</div>
		            	 	</c:forEach>
		            	 	</c:forEach>
	            	 	</div>
	            	 </div>
	            	
	            	 <div class="numbox">
	            	 	<div class="box_wrapper box2">
		            	 	<c:forEach begin="0" end="1">
		            	 	<c:forEach var="i" begin="0" end="9">
		            	 		<div class="box2">${i}</div>
		            	 	</c:forEach>
		            	 	</c:forEach>
	            	 	</div>
	            	 </div> 
	            	 
	            	 <div class="numbox">
	            	 	<div class="box_wrapper box3">
		            	 	<c:forEach begin="0" end="1">
		            	 	<c:forEach var="i" begin="0" end="9">
		            	 		<div class="box3">${i}</div>
		            	 	</c:forEach>
		            	 	</c:forEach>
	            	 	</div>
	            	 </div>
	            	 
	            	 <div class="numbox">
	            	 	<div class="box_wrapper box4">
			            	 <c:forEach	 begin="0" end="1">
			            	 	<c:forEach var="i" begin="0" end="9" step="1">
			            	 		<div class="box4">${i}</div>
			            	 	</c:forEach>
			            	</c:forEach> 	
		            	</div>
	            	</div>           	             	            	                
                <span>명</span>
            </div>
        </div>

        <div class="box otts_box active">
            <h3 class="box_title">보고싶은 OTT를 선택해주세요</h3>
            <div class="box_content">
                <div class="ott netflex" onclick="choice_ott(0)">
                    <img src="${pageContext.request.contextPath}/resources/img/ott_logos/icon_netflix_x2.png">
                    <span>넷플릭스</span>
                </div>
                <div class="ott watcha" onclick="choice_ott(1)">
                    <img src="${pageContext.request.contextPath}/resources/img/ott_logos/icon_watcha_x2.png">
                    <span>왓챠</span>
                </div>
                <div class="ott disney" onclick="choice_ott(2)">
                    <img src="${pageContext.request.contextPath}/resources/img/ott_logos/icon_disney_x2.png">
                    <span>디즈니</span>
                </div>
            </div>
        </div>

        <div class="box role_box">
                <div class="circlenum">2</div>
                <h3 class="box_title">파티 이용 역할을 선택해주세요</h3>
            <div class="box_content hidden">
                <div class="choice_ver">
                    <div class="v0 c" onclick="choice_ver(0)">파티장 이용</div>
                    <div class="v1" onclick="choice_ver(1)">파티원 이용</div>
                </div>
                <div class="master">
                    <div class="master_content">
                        <div class="howToImgs">
                            <div class="img">
                                <i class="far fa-address-card"></i>
                                <div class="img_content">
                                    <span>계정 정보</span>
                                    <span>등록하고</span>
                                </div>
                            </div>
                            <i class="fas fa-long-arrow-alt-right i_arrow"></i>
                            <div class="img">
                                <i class="far fa-credit-card"></i>
                                <div class="img_content">
                                    <span>정산 계좌</span>
                                    <span>등록 하면</span>
                                </div>
                            </div>
                            <i class="fas fa-long-arrow-alt-right i_arrow"></i>
                            <div class="img">
                                <i class="fas fa-file-invoice-dollar"></i>
                                <div class="img_content">
                                    <span>매달</span>
                                    <span>자동정산!</span>
                                </div>
                            </div>
                        </div>

                        <div class="howToText page1">
                            <div class="title">파티장이란</div>
                            <div class="content">
                                <span>-자신의 OTT 계정을 공유하는 파티를 만들어요.</span>
                                <span>-파티원 3명의 이용료를 매달 자동으로 정산 받아요.</span>
                            </div>
                        </div>

                        <div class="howToText page2">
                            <div class="title">
                                <img src="${pageContext.request.contextPath}/resources/img/gift-32.png">
                                파티장을 위한 특별 혜택
                            </div>
                            <div class="content">
                                <span>-자동매칭 수료료 <b style="color: #4DCA9A">매달 500원 할인</b></span>
                                <span>-원하는 사람을 자유롭게 <b style="color : #4DCA9A">파티 초대!</b></span>
                            </div>
                        </div>
                    </div>
                    
                    <button class="confirm_button" onclick="choice_role(0)">파티장으로 이용</button>
                </div>
                <div class="member hidden">
                    <div class="member_content">
                        <div class="howToImgs">
                            <div class="img">
                                <i class="far fa-credit-card"></i>
                                <div class="img_content">
                                    <span>구독료</span>
                                    <span>결제하면</span>
                                </div>
                            </div>
                            <i class="fas fa-long-arrow-alt-right i_arrow"></i>
                            <div class="img">
                                <i class="fas fa-envelope-open-text"></i>
                                <div class="img_content">
                                    <span>파티매칭</span>
                                    <span>즉시 진행!</span>
                                </div>
                            </div>
                        </div>
                        
                        <div class="howToText">
                            <div class="title">파티원이란</div>
                            <div class="content">
                                <span>-OTT 계정을 공유받는 파티원으로 참가해요.</span>
                                <span>-매달 자신의 구독료(OTT 구독료의 1/4분치)를 파티장에게 납부하게 돼요.</span>
                            </div>
                        </div>

                    </div>
                    <button class="confirm_button" onclick="choice_role(1)">파티원으로 이용</button>
                </div>
            </div>
            
        </div>

        <div class="box payment_box">
            <div class="circlenum">3</div>
            <h3 class="box_title">이용료를 확인해주세요</h3>
            <!--form 전송으로 보내기-->
            <div class="box_content hidden">
                <div class="detail">
                    <div class=""></div>
                    <div class="fees"></div>
                </div>
                <div class="total_cost">
                    <span>예상 총 이용료</span>
                    <span>5,240원</span>
                </div>
                <form:form method="get">
                    <input id="ott" type="hidden" name="ott_id" value="">
                    <button class="confirm_button" formaction="${pageContext.request.contextPath}/autoMatch/matching/createParty">파티만들기</button>
                    <button class="confirm_button" formaction="${pageContext.request.contextPath}/autoMatch/matching/enroll">매칭시작하기</button>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script>
	$(function(){
		$($(".navbar_menu_item a")[1]).addClass("active");
		if("${msg}" != ""){
			alert("${msg}");
		}
		// 일주일 매칭 애니메이션 만들기
		let weekMatchingNum = 4 * ${weekNum};
		let weekMatchingNum_str = ("000" + String(weekMatchingNum)).slice(-4);
		let num1 = parseInt(weekMatchingNum_str.charAt(0));
		let num2 = parseInt(weekMatchingNum_str.charAt(1));
		let num3 = parseInt(weekMatchingNum_str.charAt(2));
		let num4 = parseInt(weekMatchingNum_str.charAt(3));
		
		for(let i = 9; i >= num1; i--) {
			$(".box_wrapper.box1").prepend("<div class='box1'>"+ i +"</div>");
		}
		
		for(let i = 9; i >= num2; i--) {
			$(".box_wrapper.box2").prepend("<div class='box2'>"+ i +"</div>");
		}
		
		for(let i = 9; i >= num3; i--) {
			$(".box_wrapper.box3").prepend("<div class='box3'>"+ i +"</div>");
		}
		
		for(let i = 9; i >= num4; i--) {
			$(".box_wrapper.box4").prepend("<div class='box4'>"+ i +"</div>");
		}
		$(".box_wrapper.box1").css("top", ((num1-9)*20)-400 + "px");
		$(".box_wrapper.box2").css("top", ((num2-9)*20)-400 + "px");
		$(".box_wrapper.box3").css("top", ((num3-9)*20)-400 + "px");
		$(".box_wrapper.box4").css("top", ((num4-9)*20)-400 + "px");
		
		$(".box_wrapper.box1").animate({top: 0}, 2500);
		setTimeout(function(){
			$(".box_wrapper.box2").animate({top: 0}, 2500);
		},80);
		setTimeout(function(){
			$(".box_wrapper.box3").animate({top: 0}, 2500);
		},160);
		setTimeout(function(){
			$(".box_wrapper.box4").animate({top: 0}, 2500);
		},240);			
	});
</script>

<script src="${pageContext.request.contextPath}/resources/js/matching.js"></script>