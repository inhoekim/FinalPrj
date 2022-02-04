<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Custom styles for this page -->
<link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<style type="text/css">
	
	#d{
	background: linear-gradient( white , #AFC0E0,#AFC0E0 ,#AFC0E0, #AFC0E0 ,white);
	color: black;
	}
	#dd{
	background: linear-gradient( white , #AFC0E0,#AFC0E0 ,#AFC0E0, #AFC0E0 ,white);
	color: black;
	}
	#d0:hover{ 
	background-color: #28A745;
	color: white;
	}
	#d1:hover{ 
	background-color: #FFC107;
	color: white;
	}
	#d2:hover{ 
	background-color: #DC3545;
	color: white;
	}

</style>
</head>
<body>

<h2 id="title">결제조회</h2>
<hr>
<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead id="dd">
        <tr id="dd">
            <th id="d">결제번호</th>
            <th id="d">회원아이디</th>
            <th id="d">결제금액</th>
            <th id="d">결제상태</th>
            <th id="d">결제일</th>
        </tr>
    </thead>
    <tbody>
       <c:forEach var="vo" items="${list}">
       	<c:choose>
       		<c:when test="${vo.status =='0' }">
             <tr id="d0">
                <td id="d0">${vo.payment_id}</td>
                <td id="d0">${vo.user_id}</td>
                <td id="d0">${vo.price}</td>
                <td id="d0">결제완료 (환불가능)</td>
                <td id="d0">${vo.payment_date}</td>
             </tr>
     		</c:when>
       		<c:when test="${vo.status =='1' }">
             <tr id="d1">
                <td id="d1">${vo.payment_id}</td>
                <td id="d1">${vo.user_id}</td>
                <td id="d1">${vo.price}</td>
                <td id="d1">결제완료 (환불 불가능)</td>
                <td id="d1">${vo.payment_date}</td>
             </tr>
     		</c:when>
       		<c:when test="${vo.status =='2' }">
             <tr id="d2">
                <td id="d2">${vo.payment_id}</td>
                <td id="d2">${vo.user_id}</td>
                <td id="d2">${vo.price}</td>
                <td id="d2">환불</td>
                <td id="d2">${vo.payment_date}</td>
             </tr>
     		</c:when>
     		
     	</c:choose>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
