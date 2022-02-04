<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	#dataTable{
		border-color: #171717;
		border: 1px solid;
	}
	th{
		background-color: #4C515C;
	}
	td{
	
	}
</style>
</head>
<body>

<h2 id="title">결제조회</h2>
<hr>

<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
    <thead>
        <tr>
	        <th >결제번호</th>
	        <th >회원아이디</th>
	        <th >결제금액</th>
	        <th >결제상태</th>
	        <th >결제일</th>
        </tr>
    </thead>
    <tbody>
    	<c:forEach var="vo" items="${list}">
	   		<tr>
		        <td>${vo.payment_id}</td>
		        <td>${vo.user_id}</td>
		        <td>${vo.price}</td>
		        <td>${vo.status}</td>
		        <td>${vo.payment_date}</td>
		     </tr>
	    </c:forEach>
    </tbody>
</table>


</body>
</html>
