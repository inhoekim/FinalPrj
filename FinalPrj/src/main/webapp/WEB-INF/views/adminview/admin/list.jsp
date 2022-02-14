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
	background-color:#bdbdbd;
	color: black;
	}
	#dd{
	background-color:#bdbdbd;
	color: black;
	}

</style>
</head>
<body>

	<h2 style="color: black; ">회원 목록</h2>
	<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">
	  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead id="dd">
			<tr id="dd">
				<th id="d" >아이디</th>
				<th id="d" >이름</th>
				<th id="d" >이메일</th>
				<th id="d" >지역</th>
				<th id="d" >탈퇴/정상</th>
				<th id="d" >가입일</th>
			</tr>
		</thead> 
	</table>

</body>
<script type="text/javascript">

$(document).ready(function() {	
    $('#dataTable').DataTable({
    	ajax : {
    		"url":"/final/adminlist1",
    		type:"get",
    		'dataSrc':''
    	},
    	columns :[
    		{data: "user_id"},
    		{data: "name"},
    		{data: "email"},
    		{data: "area"},
    		{data: "enabled"},
    		{data: "regdate"}
    	]
    } );
} );
</script>
</html>