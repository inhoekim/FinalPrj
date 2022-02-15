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
	.d{
	background-color:#bdbdbd;
	color: black;
	}
	.dd{
	background-color:#bdbdbd;
	color: black;
	}

</style>
</head>
<body>

	<h2 style="color: black; ">블랙리스트 목록</h2>
	<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">
	  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		<thead class="dd">
			<tr class="dd">
				<th class="d" >아이디</th>
				<th class="d" >정지 시작 날짜</th>
				<th class="d" >정지 만료 날짜</th>
				<th class="d" >정지 사유</th>
				<th class="d" >블랙/정상</th>
			</tr>
		</thead> 
	</table>

</body>
<script type="text/javascript">

$(document).ready(function() {	
    $('#dataTable').DataTable({
    	ajax : {
    		"url":"/final/adminblacklist1",
    		type:"get",
    		'dataSrc':''
    	},
    	columns :[
    		{data: "user_id"},
    		{data: "black_start_date"},
    		{data: "black_expiry_date"},
    		{data: "content"},
    		{data: "black_enabled"}
    	]
    } );
} );
</script>
</html>