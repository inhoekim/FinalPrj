<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
 <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}"/>
<title>Insert title here</title>

</head>
<body>
<button onclick="cancelPay()">환불하기</button>




<script>
function cancelPay() {
    $.ajax({

      "url": "/final/kakaocancel",
      "type": "get",
      "data": {
    	  // JSTL 변수 수정필요 
          tid : "T1620c996d20f93341d6",
          cancel_amount : "5240"
      },
      "dataType": "text",
      success:function(data){
    	  console.log("s")
    	  alert("결제취소완료!");
    	  location.href="${pageContext.request.contextPath}/kakaocancelend?tid=T1620c996d20f93341d6";
      }
    });
  }
</script>
</body>
</html>