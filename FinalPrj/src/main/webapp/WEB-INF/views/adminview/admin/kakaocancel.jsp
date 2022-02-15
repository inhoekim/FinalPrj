<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<button onclick="cancelPay()">환불하기</button>
ㄹ
<script>
  function cancelPay() {
    $.ajax({
      "url": "/final/kakaopaycancel",
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "merchant_1643336055309", // 예: ORD20180131-0000011
        "cancel_request_amount": 5240, // 환불금액
        "reason": "테스트 결제 환불" // 환불사유
      }),
      "dataType": "json"
      
    }).done(function(result) { // 환불 성공시 로직 
      alert("환불 성공");
    }).fail(function(error) { // 환불 실패시 로직
      alert("환불 실패");
    });
  }
</script>
</body>
</html>