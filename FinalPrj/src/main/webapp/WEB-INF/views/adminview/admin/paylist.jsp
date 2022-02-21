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
	#box1{
		width: 100%; height: 600px;

	}
	#myChart1{
		width: 100%; height: 100%;
	}
	#dataTable{
		margin-bottom: 100px;
	}

	#d{
	background: #bdbdbd;
	color: black;
	}
	#dd{
	background: #bdbdbd;
	color: black;
	}


</style>
</head>
<body>

<h2 style="color: black; ">결제 조회</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

<!-- 차트 -->
	<div id="box1">
		<!--차트가 그려질 부분-->
		<canvas id="myChart1"></canvas>
	</div>
	
<!-- 테이블 -->
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
<!-- 차트 -->
$(document).ready(function(){
		
		$.ajax({
			url:"/final/admin/adminpaymentchart1",
			type :"get",
			
			success:function(data){
				
				var jsonData = data;
				var jsonObject = JSON.stringify(jsonData);
				var jData = JSON.parse(jsonObject);
						
				
				console.log(data);
				var labelList1 = new Array();
				var labelList2 = new Array();
				var labelList3 = new Array();
				
				
				for(var i = 0; i<jData.length; i++) {
					var d = jData[i];
					//리스트1 결제총매출
					console.log(d);
					labelList3.push(d.Pay1 , d.Pay2 , d.Pay3 , d.Pay4 , d.Pay5 , d.Pay6 , d.Pay7);
					labelList2.push(d.Pay11 , d.Pay12 , d.Pay13 , d.Pay14 , d.Pay15 , d.Pay16 , d.Pay17);
					labelList1.push(d.Pay21 , d.Pay22 , d.Pay23 , d.Pay24 , d.Pay25 , d.Pay26 , d.Pay27);
				}
				
		
				console.log(labelList1);
				console.log(labelList2);
				console.log(labelList3);


					
				
				
				var ctx1 = document.getElementById('myChart1').getContext('2d');
				new Chart(ctx1, {
					      type: 'line',
						  data: {
							  labels: ['1월','2월','3월','4월','5월','6월','7월'],
							  datasets: [{
							  label: '결제 총횟수',
			                    type : 'line',         // 'line' type
			                    fill : true,         // 채우기 없음
			                    lineTension : 0.2,  // 0이면 꺾은선 그래프, 숫자가 높을수록 둥글해짐
			                    pointRadius : 0,    // 각 지점에 포인트 주지 않음
			                    backgroundColor: 'rgb(255, 153, 0, 0.2)',
			                    borderColor: 'rgb(255, 153, 0)',
			                    data: labelList1
						  },{
							  label: '결제 완료',
			                    type : 'line',
			                    fill : true,
			                    lineTension : 0.2,
			                    pointRadius : 0,
			                    backgroundColor: 'rgb(255, 204, 0, 0.2)',
			                    borderColor: 'rgb(255, 204, 0)',
			                    data: labelList2
						  
					},{
						  label: '결제 취소',
		                    type : 'line',
		                    fill : true,
		                    lineTension : 0.2,
		                    pointRadius : 0,
		                    backgroundColor: 'rgb(155, 184, 0, 0.2)',
		                    borderColor: 'rgb(155, 184, 0)',
		                    data: labelList3
					  
				}],
						  },  options: {
							    //그래프의 제목 옵션
							    title: {
							        display: true,
							        text: '회원가입 차트',
							        fontSize: 20
							    },
							    //그래프의 항목 옵션
							    legend: {
							        display: true,
							        position: 'bottom',
							    },

							    
							    scales: {
							        yAxes: [{
							            ticks: {
							                beginAtZero: true
							            }
							        }]
							    }
							    
							}
						  
				});
				
			}
		})
});
//데이터테이블 API
$(document).ready(function() {
    $('#dataTable').DataTable({
        
    	ajax : {
    		"url":"/final/admin/adminpaylist1",
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
