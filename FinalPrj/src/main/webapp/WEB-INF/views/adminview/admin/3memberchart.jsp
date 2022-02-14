<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	}
	#box1{
	display: flex; 
	width: 700px;
	margin-right: 50px;

	}
	#box2{
	display: flex; 
	width: 500px;
	height: 400px;
	}
	
	#bigbox2{
	display: flex; 
	background-color: white;
	width : 100%; height : 400px;
	}
	#box3{
	display: flex; 
	background-color: orange;
	
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
<h2 style="color: black; ">회원 조회</h2>
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
						var colorList = new Array();
								
						for(var i = 0; i<jData.length; i++) {
							var d = jData[i];
							labelList.push(d.IP);
							valueList.push(d.Count);
							colorList.push(colorize());
						}
								
								
						var data = {
										labels: labelList,
										datasets: [{
												label:'접속자 비율', //차트 제목
												backgroundColor: colorList,
												data : valueList
										}],
										options : {
												title : {
												display : true,
												text: '유저별 접속 횟수'
												}
										}
						};
						
						var ctx1 = document.getElementById('myChart1').getContext('2d');
						new Chart(ctx1, {
							      type: 'bar',
								  data: data,
								  options: {
									    //그래프의 제목 옵션
									    title: {
									        display: true,
									        text: '유저별 접속 횟수',
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