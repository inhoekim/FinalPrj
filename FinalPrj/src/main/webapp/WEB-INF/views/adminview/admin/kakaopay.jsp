<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="principal.username" var="userId"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
	#check_module{
  		width: 580px; height: 40px; background-color: #FEE500;
        font-size: 17px; font-weight: bolder;
        border-color: #FEE500; border-radius: 10px;
        text-align: center; cursor:pointer;
        padding-top: 10px;
        }
</style>
</head>
<body>
	<h1>카카오페이 테스트</h1>
	
	<div id="check_module" >카카오로 계속하기</div>
			<form:form method="post" name='kakaopayf' action="${pageContext.request.contextPath}/kakaopayform">
				<input type="hidden" name="payment_id" value="" >
				<input type="hidden" name="user_id" value="${userId}" ><!-- 로긴한 아이디 -->
				<input type="hidden" name="price" value="" >
				<input type="hidden" name="status" value="${0}" >
			</form:form>
	<script>
	$("#check_module").click(function () {
		var IMP = window.IMP; // 생략가능
		IMP.init('imp44517334'); 
		IMP.request_pay({
			pg: 'kakaopay',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: '본인 몫(1/4)의 넷플릭스 이용료',
			amount: 5240,
			buyer_name: '이름',//셀렉해서 유저 이름으로 변경해줘야함
			buyer_postcode: '123-456',
			}, function (rsp) {
				if(rsp.success){
					//결제 성공시
				var msg = '결제에 성공하였습니다.';
				msg += '\n결제번호 : ' + rsp.imp_uid; //결제 번호
				msg += '\n주문자명 : ' + "ㅁㄴㅇ"; // name
				msg += '\n결제금액 : ' + rsp.paid_amount; //결제금액
				
				//제이쿼리 
				$("input[name='payment_id']").val(rsp.imp_uid);
				$("input[name='price']").val(rsp.paid_amount);
				document.kakaopayf.submit();
				alert(msg);

				
				} else{
					//결제 실패시
				var msg = '결제에 실패하였습니다.';
				msg += '\n실패사유 : ' + rsp.error_msg;
				
				alert(msg);
				}
				
			});
		});

</script>
</body>
</html>