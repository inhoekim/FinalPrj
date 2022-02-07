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
	<h2 id="title">회원목록</h2>
	<hr>
	  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead id="dd">
			<tr id="dd">
				<th id="d" >아이디</th>
				<th id="d" >이름</th>
				<th id="d" >이메일</th>
				<th id="d" >지역</th>
				<th id="d" >탈퇴/정상</th>
				<th id="d" >블랙/정상</th>
				<th id="d" >가입일</th>
			</tr>
		</thead> 
		<tbody>
			<c:forEach var="vo" items="${list }">
			<c:choose>
				<c:when test="${vo.enabled=='1' && vo.black_enabled=='1' }">
				<tr id="d0">
					<td id="d0" > ${vo.user_id} </td>
					<td id="d0" > ${vo.name}</td>
					<td id="d0" > ${vo.email}</td>
					<td id="d0" > ${vo.area}</td>
					<td id="d0" > ${vo.enabled}</td> <!-- 0:탈퇴 , 1:정상 -->
					<td id="d0" > ${vo.black_enabled}</td>
					<td id="d0" > ${vo.regdate}</td>
				</tr>
				</c:when>
				<c:when test="${vo.enabled=='1' && vo.black_enabled=='0' }">
				<tr id="d1">
					<td id="d1" > ${vo.user_id} </td>
					<td id="d1" > ${vo.name}</td>
					<td id="d1" > ${vo.email}</td>
					<td id="d1" > ${vo.area}</td>
					<td id="d1" > ${vo.enabled}</td> <!-- 0:탈퇴 , 1:정상 -->
					<td id="d1" > ${vo.black_enabled}</td>
					<td id="d1" > ${vo.regdate}</td>
				</tr>
				</c:when>
				<c:when test="${vo.enabled=='0' && vo.black_enabled=='1' }">
				<tr id="d2">
					<td id="d2" > ${vo.user_id} </td>
					<td id="d2" > ${vo.name}</td>
					<td id="d2" > ${vo.email}</td>
					<td id="d2" > ${vo.area}</td>
					<td id="d2" > ${vo.enabled}</td> <!-- 0:탈퇴 , 1:정상 -->
					<td id="d2" > ${vo.black_enabled}</td>
					<td id="d2" > ${vo.regdate}</td>
				</tr>
				</c:when>
			</c:choose>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>