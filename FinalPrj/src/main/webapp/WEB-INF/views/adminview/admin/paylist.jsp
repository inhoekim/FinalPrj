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
	#title{
		color: white;
	}
	#d{
	background: #bdbdbd;
	color: black;
	}
	#dd{
	background: #bdbdbd;
	color: black;
	}
	#d0:hover{ 
	background-color: #69f0ae;

	color: white;
	}
	#d1:hover{ 
	background-color: #FFC107;
	color: white;
	}
	#d2:hover{ 
	background-color: #ff6e40;
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
    
</table>
</body>
<script type="text/javascript">

//데이터테이블 API
$(document).ready(function() {
    $('#dataTable').DataTable({
        
    	ajax : {
    		"url":"/final/adminpaylist1",
    		type:"get",
    		'dataSrc':''
                
    	},
    	columns :[
    		{data: "payment_id"},
    		{data: "user_id"},
    		{data: "price"},
    		{data: "status"},
    		{data: "payment_date"}
    	]
    } );
} );
</script>
</html>
