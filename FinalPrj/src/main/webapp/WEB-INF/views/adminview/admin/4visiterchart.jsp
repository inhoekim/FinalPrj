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
		margin-bottom: 200px;
	}
	#box1{
		width: 600px; height: 630px;
	}
	#myChart{
		width: "100%";
	}
	#box2{
		width: 650px; height: 800px;
		margin-left: 90px;
	}
	#minibox1{
		display: flex; 
		height: 250px;
		background-color: #bdbdbd;
		color: black;
		border-radius: 6px;
		font-size: 20px;
		padding: 10px;
		text-align: center;
		margin-bottom: 30px;
	}
	#minibox11{
	display: flex; 
	background-color: #bdbdbd;
	width: 50%;
	}
	#minibox12{
	display: flex; 
	background-color: #bdbdbd;
	width: 25%;
	text-align: center;
	padding-left: 20px;
	}
	#minibox13{
	display: flex; 
	background-color: #bdbdbd;
	width: 25%;
	text-align: center;
	}

	#day{
		display: flex; 
		width: 100%; height: 50px;
		border-radius: 6px;
		background-color: black;
		color: white;
		text-align: center;
		cursor: pointer;
		
	}
	#daybutton{
		display: flex; 
		width: 100%; height: 50px;
		border-radius: 6px;
		background-color: black;
		color: white;
		text-align: center;
		cursor: pointer;
		margin-left: 10px;
	}
	#d{
	background: #bdbdbd;
	color: black;
	}
	#dd{
	background: #bdbdbd;
	color: black;
	}
	
	#d0{
		background-color: white;
	}
	
	
</style>
</head>
<body>
<h2 style="color: black; ">방문자 조회</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

<div id="content1" >
	
	
	<div id="box1">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>

	<div id="box2">
	
		<div id="minibox1">
			
				<div id="minibox11">
					<input class="datepicker" id="day" value="${today}" >
					<input id="daybutton" value="조회하기" >
				</div>
				<div id="minibox12">
					<h4 >금일 방문자 <br> ${todaycnt }명</h4> 
				</div>
				<div id="minibox13">
					<h4 >어제 방문자 <br> ${yesterday }명</h4>
				</div>
		</div>
	
	
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		    <thead id="dd">
		        <tr id="dd">
		            <th id="d">아이피주소</th>
		            <th id="d">접속한 횟수</th>
		            <th id="d">접속날짜</th>
		        </tr>
		    </thead>
		</table>
		
	</div>
</div>
<script type="text/javascript">


// 초기 차트api
	
	var context = document
	.getElementById('myChart')
	.getContext('2d');
	var myChart = new Chart(context, {
	type: 'pie', // 차트의 형태
	data: { // 차트에 들어갈 데이터
	    labels :
	    	//x 축
	  eval('${iplist}')
	    ,datasets: [
	        { //데이터
	        	label:'접속자 비율', //차트 제목
	            fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
	            data: 
	            	 eval('${cntlist}')//x축 label에 대응되는 데이터 값
	            	 ,
	            backgroundColor: [
	                //색상
	                'rgba(255, 54, 0, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ]
	        }
	    ]
	},
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
	        yAxes: [
	            {
	                ticks: {
	                    beginAtZero: true
	                }
	            }
	        ]
	    }
	}
	});

//	차트 js
	$(document).ready(function(){
		$("#daybutton").click(function(){
			let day =$("#day").val();
			console.log(day);
			
			
			$.ajax({
				url:"/final/admin/adminvisiterchart2",
				type :"get",
				data:{  day  },
				
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
					
					
					
					$("#myChart").remove();
					$("#box1").append('<canvas id="myChart"></canvas>');


					
					var ctx1 = document.getElementById('myChart').getContext('2d');
					new Chart(ctx1, {
						      type: 'pie',
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
	});

	//달력 api
$.datepicker.setDefaults({
    dateFormat: 'yy/mm/dd',
    prevText: '이전 달',
    nextText: '다음 달',
    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
    showMonthAfterYear: true,
    yearSuffix: '년'
    });

  $(function(){
    $('.datepicker').datepicker();
  })

	//데이터테이블 API
$(document).ready(function() {
    $('#dataTable').DataTable({
        
    	ajax : {
    		"url":"/final/admin/adminvisiterchart3",
    		type:"get",
    		'dataSrc':''
                
    	},
    	columns :[
    		{data: "ip_address"},
    		{data: "count"},
    		{data: "visit_date2"}
    	]
    } );
} );
	
	
</script>
</body>
</html>