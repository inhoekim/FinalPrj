<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
<title>Insert title here</title>

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
	<h2 id="title">회원목록</h2>
	<hr>
	
	<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead>
			<tr>
				<th id="th1" >아이디</th>
				<th id="th2" >이름</th>
				<th id="th3" >이메일</th>
				<th id="th4" >지역</th>
				<th id="th5" >탈퇴/정상</th>
				<th id="th6" >블랙/정상</th>
				<th id="th7" >가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="vo" items="${list }">
				<tr>
					<td id="th1" > ${vo.user_id} </td>
					<td id="th2" > ${vo.name}</td>
					<td id="th3" > ${vo.email}</td>
					<td id="th4" > ${vo.area}</td>
					<td id="th5" > ${vo.enabled}</td> <!-- 0:탈퇴 , 1:정상 -->
					<td id="th6" > ${vo.black_enabled}</td>
					<td id="th7" > ${vo.regdate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>