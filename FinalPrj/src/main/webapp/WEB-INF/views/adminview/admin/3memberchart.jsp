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
	#box1{
	
	display: flex; 
	background-color: white;
	border-radius: 6px;
 	box-shadow: 5px 5px 5px gray;
	}
	#box10{
	display: flex; 
	width : 400px;
	background-color: white;
	border-radius: 6px;
 	box-shadow: 5px 5px 5px gray;
 	margin-left: 25px;
 	flex-direction: column;
	}
	
	
	#box11{
	display: flex; 
	background-color: #353535;
	height: 16%;
	border-top-left-radius: 6px;
	border-top-right-radius: 6px;
	text-align: center ;
	font-size: 30px;
	}
	#box12{
	display: flex; 
	background-color: rgba(57, 138, 185);
	height: 28%;
	cursor: pointer;
	text-align: center ;
	font-size: 40px;
	}
	#box13{
	display: flex; 
	background-color: rgba(216, 210, 203);
	height: 28%;
	cursor: pointer;
	text-align: center ;
	font-size: 40px;
	}
	#box14{
	display: flex; 
	background-color: rgba(238, 238, 238);
	height: 28%;
	border-bottom-left-radius: 6px;
	border-bottom-right-radius: 6px;
	cursor: pointer;
	text-align: center ;
	font-size: 40px;
	}
	
	
	#box2{
	display: flex; 
	margin-right: 25px;
	background-color: white;
	border-radius: 6px;
	box-shadow: 5px 5px 5px gray;
	margin-left: 25px;
	}
	
	#bigbox2{
	display: flex; 
	width : 100%; height : 500px;
	margin-bottom: 100px;
	}
	#box3{
	width : 900px;
	display: flex; 
	background-color: white;
	border-radius: 6px;
	box-shadow: 5px 5px 5px gray;
	}
	
	#myChart1{
		width: "100%";
	}
	#myChart2{
		width: "100%";
	}
	#myChart3{
		width: "100%";
	}
</style>
</head>
<body>
<h2 style="color: black; ">회원 통계</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

<div id="content1" >
	
	<div id="bigbox1">
		<div id="box1">
			<!--차트가 그려질 부분-->
			<canvas id="myChart1"></canvas>
		</div>
		<div id="box2">
			<!--차트가 그려질 부분-->
			<canvas id="myChart2"></canvas>
		</div>

	</div>
	
	<div id="bigbox2">

		<div id="box3">
			<!--차트가 그려질 부분-->
			<canvas id="myChart3"></canvas>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
		<!-- 차트1 -->
		$(document).ready(function(){
				
				$.ajax({
					url:"/final/adminmemberchart1",
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
									    title: {
									        display: true,
									        text: '회원 비율',
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
									    
									} //옵션의 끝 태그
								  
						});
						

						
						
						
					}
					
				})
				
			
		});
		
		
		
		<!-- 차트2 -->
		$(document).ready(function(){
				
				$.ajax({
					url:"/final/adminmemberchart2",
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
							colorList.push(colorize());
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
									    //그래프의 제목 옵션
									    title: {
									        display: true,
									        text: '회원 비율',
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
									    
									} //옵션의 끝 태그
								  
						});
						
						function colorize() {
							var r = Math.floor(Math.random()*200);
							var g = Math.floor(Math.random()*200);
							var b = Math.floor(Math.random()*200);
							var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
							return color;
						}
						

						
						
						
					}
					
				})
				
			
		});
		
		
		
		
		<!-- 차트3 -->
		$(document).ready(function(){
				
				$.ajax({
					url:"/final/adminmemberchart3",
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
							labelList.push(d.DAY1,d.DAY2,d.DAY3,d.DAY4,d.DAY5,d.DAY6,d.DAY7);
							valueList.push(d.DAY1,d.DAY2,d.DAY3,d.DAY4,d.DAY5,d.DAY6,d.DAY7);
							colorList.push(colorize());
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
									    
									} //옵션의 끝 태그
								  
						});
						
						function colorize() {
							var r = Math.floor(Math.random()*200);
							var g = Math.floor(Math.random()*200);
							var b = Math.floor(Math.random()*200);
							var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
							return color;
						}
						

						
						
						
					}
					
				})
				
			
		});
	

</script>
</html>