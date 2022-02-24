<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#content1{
		display: flex; 
		flex-wrap: wrap;
		align-content: stretch;
	}
	#bigbox1{
	display: flex; 
	width : 100%; height : 500px;
	margin-bottom: 25px;
	}
	#box100{
		width: 1600px; height: 700px;
	}
	#myChart1{
		 width : 1580px;  height: 600px;
		!important
	}
	#bigbox2{
	display: flex; 
	width : 100%; height : 500px;
	margin-bottom: 100px;
	}
	
	#box110{
	 	width: 520px;
	 	height: 500px;
	 	margin-right: 25px;
	}
	#myChart2{
	 width : 480px;  height: 400px;
	!important
	}
	
	
	#box120{
	 	width: 1055px;
	 	height: 500px;
	 	
	}
	#myChart3{
		width : 1020px;  height: 400px;
		!important
	}
</style>
</head>
<body>
<h2 style="color: black; ">회원 통계</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

<div id="content1" >
	<div class="card shadow mb-4" id="box100">
		<!-- Card Header - Dropdown -->
		<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" id="box101">
			<h6 class="m-0 font-weight-bold text-primary" id="t1">회원가입 차트</h6>
		</div>
		
		<!-- Card Body -->
		<div class="card-body" id="box102">
			<div class="chart-area">
				<canvas id="myChart1"></canvas>
			</div>
		</div>
	</div>



	
	<div id="bigbox2">
	
		<div class="card shadow mb-4" id="box110">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" id="box111">
				<h6 class="m-0 font-weight-bold text-primary">회원 연령대</h6>
			</div>
			
			<!-- Card Body -->
			<div class="card-body" id="box112">
					<canvas id="myChart2"></canvas>
			</div>
		</div>
		
		
		<div class="card shadow mb-4" id="box120">
			<!-- Card Header - Dropdown -->
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between" id="box121">
				<h6 class="m-0 font-weight-bold text-primary">블랙,탈퇴 회원 통계</h6>
			</div>
			
			<!-- Card Body -->
			<div class="card-body" id="box122">
					<canvas id="myChart3"></canvas>
			</div>
		</div>
		

	</div>

</div>
</body>
<script type="text/javascript">
<!-- 차트1 -->
$(document).ready(function(){
		
		$.ajax({
			url:"/final/admin/adminmemberchart1",
			type :"get",
			
			success:function(data){
				
				var jsonData = data;
				var jsonObject = JSON.stringify(jsonData);
				var jData = JSON.parse(jsonObject);
				
				
				var labelList = new Array();
				var valueList = new Array();
						
				for(var i = 0; i<jData.length; i++) {
					var d = jData[i];
					labelList.push(d.Count,d.Count1);
					valueList.push(d.Count,d.Count1);
				}
						
						
				var data = {
								labels: ["블랙회원", "탈퇴회원"],
								datasets: [{
										
										backgroundColor: [
											'rgba(181, 181, 181, 0.9)',
											'rgba(104, 104, 104, 0.9)'
										],
										data : labelList
								}],
								options : {
										title : {
										display : true,
										text: '회원상태 비율'
										}
								}
				};
				
				var ctx1 = document.getElementById('myChart3').getContext('2d');
				new Chart(ctx1, {
					      type: 'bar',
						  data: data,
						  options: {
							    //그래프의 제목 옵션
							     responsive: false,
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
							    
							} //옵션의 끝 태그
						  
				});
				
				
				
				
			}
			
		})
		
	
});



<!-- 차트2 -->
$(document).ready(function(){
		
		$.ajax({
			url:"/final/admin/adminmemberchart2",
			type :"get",
			
			success:function(data){
				
				var jsonData = data;
				var jsonObject = JSON.stringify(jsonData);
				var jData = JSON.parse(jsonObject);
						
				
				
				var labelList = new Array();
				var valueList = new Array();
				var colorList = new Array();
						
				for(var i = 0; i<jData.length; i++) {
					var d = jData[i];
					labelList.push(d.Age10,d.Age20,d.Age30,d.Age40);
					valueList.push(d.Age10,d.Age20,d.Age30,d.Age40);
					
				}
						
						
				var data = {
								labels: ["10대", "20대", "30대", "40대"],
								datasets: [{
										label:'접속자 비율', //차트 제목
										backgroundColor: [
											'rgba(114, 255, 184, 0.8)',
											'rgba(238, 238, 238, 0.8)',
											'rgba(132, 176, 220, 0.8)',
											'rgba(239, 225, 171, 0.8)'],
										data : labelList
								}],
								options : {
										title : {
										display : true,
										text: '회원상태 비율'
										}
								}
				};
				
				var ctx1 = document.getElementById('myChart2').getContext('2d');
				new Chart(ctx1, {
					      type: 'doughnut',
						  data: data,
						  options: {
							  responsive: false,
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
							    
							} //옵션의 끝 태그
						  
				});
				
				
				
				
				
			}
			
		})
		
	
});




<!-- 차트3 -->
$(document).ready(function(){
		
		$.ajax({
			url:"/final/admin/adminmemberchart3",
			type :"get",
			
			success:function(data){
				
				var jsonData = data;
				var jsonObject = JSON.stringify(jsonData);
				var jData = JSON.parse(jsonObject);
						
				
				
				var labelList = new Array();
				var valueList = new Array();
						
				for(var i = 0; i<jData.length; i++) {
					var d = jData[i];
					labelList.push(d.DAY1,d.DAY2,d.DAY3,d.DAY4,d.DAY5,d.DAY6,d.DAY7);
					valueList.push(d.DAY1,d.DAY2,d.DAY3,d.DAY4,d.DAY5,d.DAY6,d.DAY7);
				}
						
						
				var data = {
								// 날짜 7개를 줘야함
								labels: valueList,
								
								datasets: [{
										label:'회원가입 횟수', //차트 제목
										backgroundColor: [
											'rgba(89, 111, 216, 0.8)'],
										data : labelList
								}],
								options : {
										title : {
										display : true,
										text: '회원상태 비율'
										}
								}
				};
				
				var ctx1 = document.getElementById('myChart1').getContext('2d');
				new Chart(ctx1, {
					      type: 'line',
						  data: data,
						  options: {
							  responsive: false,
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
							    
							} //옵션의 끝 태그
						  
				});
					
				
			}
			
		})
		
	
});

</script>
</html>