<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div id="content">
    <form class="createForm" method="post" action="${pageContext.request.contextPath}/autoMatch/matching/createParty">
        <h2 class="middle_h2"><span class="userid">${userName}</span>님의 <span class="ottName">${ottName}</span> 파티를 만들어 드릴게요
        <img src="${pageContext.request.contextPath}/resources/img/sparkling-32.png"/>
        </h2>    
        <div class="middle_div">
            <a class="middle_a" href="${ottAddr}">
                ${ottName} 주소 바로가기
                <i class="fas fa-link"></i>
            </a>
        </div>
        
        <div class="notifyBox">
            <h5>다음과 같은 계정을 준비해주세요</h5>
            <ul class="listBox">
                <img src="${pageContext.request.contextPath}/resources/img/checked-32.png" style="float: left;"/>
                <li>- ${ottName} 프리미엄 요금제를 구독중인 계정 (파티를 만든 날짜를 기준으로 한달동안 구독을 유지하셔야 해요. <span class="highlight">${expire}일 까지</span>)</li>
                <li>- 성인인증이 완료된 계정</li>
            </ul>
        </div>

        
        <div class="notifyBox">
            <h5>다음과 같은 계정은 공유가 불가합니다</h5>
            <ul class="listBox">
                <img src="${pageContext.request.contextPath}/resources/img/warning-24.png" style="float: left; position: relative; top: -3px;"/>
                <li>- SNS(카톡, 페이스북등) 회원가입한 계정</li>
            </ul>
        </div>

        <div class="banks_box">
            <h4>정산받을 계좌를 등록해주세요</h4>
            <div class="box active">
                <span class="box_title" style="margin: 15px 0; font-weight: 400; font-size: 17px;">계좌의 은행을 선택해주세요</span>
                <div class="box_content">

                    <input type="radio" name="bank_id" id="bank0" value="0">
                    <label class="bank" for="bank0">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/KEBhana_52.png">
                        <span>KEB하나</span>
                    </label>

                    <input type="radio" name="bank_id" id="bank1" value="1">
                    <label class="bank" for="bank1">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/KBkookmin_52.png">
                        <span>국민</span>
                    </label>

                    <input type="radio" name="bank_id" id="bank2" value="2">
                    <label class="bank" for="bank2">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/shinhan_52.png">
                        <span>신한</span>
                    </label>

                    <input type="radio" name="bank_id" id="bank3" value="3">
                    <label class="bank" for="bank3">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/ibk_52.png">
                        <span>기업</span>
                    </label>

                    <input type="radio" name="bank_id" id="bank4" value="4">
                    <label class="bank" for="bank4">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/koreaPost-52.png">
                        <span>우체국</span>
                    </label>

                    <input type="radio" name="bank_id" id="bank5" value="5">
                    <label class="bank" for="bank5">
                        <img src="${pageContext.request.contextPath}/resources/img/bank_logos/NHnonghyup-52.png">
                        <span>농협</span>
                    </label>

                </div>
                <div class="box_input" style="margin-top: 50px">
                    <label for="bank_account">계좌번호를 입력해주세요 (본인명의의 계좌로 입력해주세요)</label><br>
                    <input type="text" id="bank_account" name="bank_account" placeholder="정산받을 계좌번호를 입력해주세요" style="margin: 15px 0;">
                </div>

                <button type="button" class="confirm_button" style="width: 100%;"  onclick="confirm_bank()">입력확인</button>

                <div class="box_result hidden">
                    <div class="result_left">
                        <img src="#">
                        <div class="content">
                            <span class="content1"></span>
                            <span class="content2"></span>
                            <span class="content3">${userName}</span>
                        </div>
                    </div>
                    <span class="change" onclick="change_result()">변경</span>
                </div>
            </div>
        </div>

        <div class="inputContainer" style="margin-top: 30px;">
            <div class="inputBox">
                <label><span class="ottName"></span>${ottName} 아이디<br>
                    <input type="text" id="share_id" name="share_id" placeholder="아이디를 입력해주세요">
                </label>
            </div>
        </div>

        <div class="inputContainer">
            <div class="inputBox">
                <label><span class="ottName"></span>${ottName} 비밀번호<br>
                    <input type="text" id="share_pwd" name="share_pwd" placeholder="비밀번호를 입력해주세요">
                </label>
                <span class="hint"><i class="fas fa-check"></i> 공유 가능한 안전한 비밀번호를 사용해주세요</span>
            </div>
        </div>

        <div style="text-align: center;">
        <button class="anime_btn" onclick="last_confirm(event)">
            <img src="${pageContext.request.contextPath}/resources/img/confetti-24-left.png" style="position: relative; top:2px">
            파티 생성 할래요
            <img src="${pageContext.request.contextPath}/resources/img/confetti-24-right.png" style="position: relative; top:2px">
        </button>

        </div>

        <input type="hidden" name="ott_id" value="${ottId}">
    </form>
</div>

<script>
	$(function(){
		$($(".navbar_menu_item a")[1]).addClass("active");
	});
</script>

<script src="${pageContext.request.contextPath}/resources/js/createParty.js"></script>