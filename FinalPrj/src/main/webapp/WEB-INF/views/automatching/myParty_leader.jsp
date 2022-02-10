<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="${pageContext.request.contextPath}/resources/js/myparty.js"></script>
<c:set var="profile_src" value="${pageContext.request.contextPath}/resources/img/profile/"/>
<c:set var="searching_src" value="${pageContext.request.contextPath}/resources/img/searching/search"/>
<c:set var="searching_num" value="${3 - partyVo.member_num}"/>

<div id="content">
    <div class="myParty_container">
        <div class="myParty_box" style="margin-top: 60px;">
            <div class="box_title">
                <div class="title_left">
                    <img src="${pageContext.request.contextPath}/resources/img/ott_logos/${logo_src}">
                    <div class="two_line">
                        <span class="line_top">${ottVo.ott_name } 프리미엄 파티</span>
                        <span class="line_bottom">파티장으로 이용중</span>
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
                                <img src="${profile_src}${leader.src_name}">
                                <span class="profile_id">${leader.user_id }<span class="you">(당신)</span></span>
                            </div>
                        </div> 

                        <div class="gap_box"></div>

                        <div class="member_box">
                        	<c:forEach var="member" items="${member_list}"> 
                      	    	<div class="profile_item">
	                                <img src="${profile_src}${member.src_name}">
	                                <span class="profile_id">${member.user_id }</span>
	                                <span class="payment_state">
	                                	<c:choose>
	                                		<c:when test="${not empty member.payment_id}">
	                                			<c:set var="authority" value="true"/>
	                                			결제완료
	                                		</c:when>
	                                		<c:otherwise>
	                                			<c:set var="authority" value="false"/>
	                                			결제대기
	                                		</c:otherwise>
	                                	</c:choose>
	                                </span>                             
                            	</div>
                        	</c:forEach>
							
							<c:forEach var="i" begin="1" end="${searching_num}"> 
								<div class="profile_item">
									<c:set var="rand"><%= java.lang.Math.round(java.lang.Math.random() * 2 + 1) %></c:set>
	                                <img src="${searching_src}${rand}-64.png">
	                                <span class="profile_id empty">(빈자리)</span>
	                                <span class="payment_state">매칭중..</span>   
                            	</div>
							</c:forEach>
                        </div>
                        
                    </div>
                </div>   
            </div>
        </div> 

        <div class="myParty_box">
            <div class="box_title">
                <div class="title_left" style="line-height:50px">
                    <img src="${pageContext.request.contextPath}/resources/img/keys-64.png">
                    <span style="margin-left: 5px; font-size: 16px; font-weight: 600;">계정 정보</span>
                </div>    

                <a href="${ottVo.domain_addr}" style="margin-top: 20px" target="_blank">
                    <span style="margin-left: 5px; font-size: 14px; font-weight: 400; color: #3E9FFF; margin-top: 25px;">
                        ${ottVo.ott_name } 바로가기
                        <i class="fas fa-link"></i>
                    </span>
                </a> 
            </div>

            <div class="box_content default">
                <div class="content_left">
                    <span>ID</span>
                    <span id="user_id" style="margin-left: 22px; font-size: 16px;">${partyVo.share_id }</span>
                </div>
                <div class="content_right">
                    <span style="position: relative; left: 23px; color:black; opacity: 0;"><i class="fas fa-check"></i></span>
                    <span style="position: relative; display: inline-block; cursor: pointer;" onclick="clipBoard('#user_id')">복사</span>
                </div>
            </div>

            <div class="box_content default">  
                <div class="content_left">
                    <span>PW</span>
                    <span id="user_pwd" style="margin-left: 15px; font-size: 16px;">
                    	${partyVo.share_pwd }
                    </span>
                </div>
                <div class="content_right">
                    <span style="position: relative; left: 23px; color:black; opacity: 0;"><i class="fas fa-check"></i></span>
                    <span style="position: relative; display: inline-block; cursor: pointer;" onclick="clipBoard('#user_pwd')">복사</span>
                </div>
            </div>
        </div>
   
        <div class="myParty_box">
            <div class="box_title">
                <div class="title_left" style="line-height:50px">
                    <img src="${pageContext.request.contextPath}/resources/img/calendar-64.png">
                    <span style="margin-left: 5px; font-size: 16px; font-weight: 600;">결제 정보</span>
                </div>    

            </div>

            <div class="box_content">
                <div class="payment_content">
                    <span>계정만료 예정일(정산일)</span>
                    <span>${partyVo.expiration_date} (${remain_day}일남음)</span>
                </div>

                <div class="payment_content">
                    <span>정산 정보</span>
                    <div>
                        <img id="info" src="${pageContext.request.contextPath}/resources/img/info-24.png" style="vertical-align: middle; position: relative; top:-2px; width: 18px; height: 18px; cursor: pointer;">
                        <span>
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${price }" />원
						</span>
                    </div>
                </div>

                <div class="payment_content" style="padding: 0px 20px;">
                    <span>정산 계좌</span>
                    <div style="display:flex;align-items: center">
                    	<img src="${pageContext.request.contextPath}/resources/img/bank_logos/${bank_src}" style="width:40px;">
                    	<span>(${bank_name}) ${bank_account}</span>
                    </div>                    
                </div>
            </div>    
    	</div>

    
	<span style="color:#908dc0e6;font-size:13px;">(안내사항)</span><br>
    <span style="color:#908dc0e6;font-style:italic;font-size:13px;margin:3px 0;">- 결제취소와 파티탈퇴는 파티매칭이 완전히 완료되기 전까지만 가능합니다 </span><br>
    <span style="color:#908dc0e6;font-style:italic;font-size:13px;">- 반복적인 파티탈퇴 및 매칭취소의 행위는 강력한 제재대상이며, 해당 행위에 따른 불이익이 존재할 수 있음을 알려드립니다</span>
    <div class="confirm_button" style="width:60%;margin: auto; padding: 5px; font-size: 20px; text-align: center; background-color: #fe918d; margin-top: 50px;">
        <a style="font-size: 20px; color: white;width:100%;display:inline-block" href="${pageContext.request.contextPath}/autoMatch/resign/member?party_id=${partyVo.party_id}">파티 탈퇴</a>
    </div>

    <input type="text" id="my_clipBoard" style="opacity: 0;">
</div>

<div id="info_div" class="hidden">
    <div class="emphasized_div" style="height: 295px">
        <div class="div_title">
            <h4>정산금액 상세 안내</h4>
            <img class="cancle" src="${pageContext.request.contextPath}/resources/img/close-24.png" style="width: 14px; height: 14px;">
        </div>
       
        <div class="div_content">
            <div class="paycontent">
                <span>${ottVo.ott_name } 프리미엄 요금제 금액</span>
                <span><del><fmt:formatNumber type="number" pattern="#,###" maxFractionDigits="0" value="${ottVo.month_price}" />원</del></span>
            </div>

            <div class="paycontent">
                <span>본인 몫(1/4)의 ${ottVo.ott_name } 이용료</span>
                <span style="color : #42c5939e">- <fmt:formatNumber type="number" pattern="#,###" maxFractionDigits="0" value="${ottVo.month_price / 4}" />원</span>
            </div>

            <div class="paycontent">
                <span>OTT플러스 수수료</span>
                <span>+ 490원</span>
            </div>

            
            <div class="paycontent" style="margin-top: 20px; margin-bottom: 0; padding-top:20px; border-top: 1px solid #cccccc; font-size:16px;">
                <span>총 정산금액</span>
                <span><fmt:formatNumber type="number" maxFractionDigits="3" value="${price}" />원</span>
            </div>
        </div>
    </div>
</div>
    
    
<script>
	$(function(){
		$($(".navbar_menu_item a")[2]).addClass("active");
		if("${msg}" != ""){
			alert("${msg}");
		}
	});
</script>
