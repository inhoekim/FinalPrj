<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<style type="text/css">
	#content1{
		display: flex; 
		
	}
	#box1{
		width: 600px; height: 630px;
		background-color: white;
	}
	#myChart{
		width: "100%";
	}
	#box2{
		width: 650px; height: 800px;
		margin-left: 90px;
	}
	#minibox2{
		display: flex; 
		justify-content: space-around;
		
		height: 50px;
		background-color: #bdbdbd;
		color: black;
		border-radius: 6px;
		font-size: 20px;
		padding: 10px;
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
<h2 style="color: white; ">방문자 조회</h2>
<hr style="width: 100%; height: 2px; background-color: #bdbdbd; margin-bottom: 20px;">

<div id="content1" >
	
	<div id="">
	
	</div>
	
	<div id="box1">
		<!--차트가 그려질 부분-->
		<canvas id="myChart"></canvas>
	</div>

	<div id="box2">

	<div id="minibox2">
	<h4>금일 방문자 : ${todaycnt }명</h4> <h4>어제 방문자 : ${yesterday }명</h4>
	</div>
	
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
		    <thead id="dd">
		        <tr id="dd">
		            <th id="d">아이피주소</th>
		            <th id="d">접속한 횟수</th>
		            <th id="d">접속날짜</th>
		        </tr>
		    </thead>
		    <tbody>
		       <c:forEach var="vo" items="${list}">
		             <tr id="d0">
		                <td id="d0">${vo.ip_address}</td>
		                <td id="d0">${vo.count}</td>
		                <td id="d0">${vo.visit_date2}</td>
		             </tr>

		        </c:forEach>
		    </tbody>
		</table>
		
	</div>
</div>
<script type="text/javascript">

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
                            label: 'test1', //차트 제목
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
                            ],
                            borderColor: [
                                //경계선 색상
                                'rgba(255, 54, 0, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)',
                                'rgba(255, 159, 64, 1)'
                            ],
                            borderWidth: 1 //경계선 굵기
                        }
                    ]
                },
                options: {	
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
        </script>
</body>
</html>