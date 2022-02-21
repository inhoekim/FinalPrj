<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">
	#icon{
		width: 100%; height: 100%;
		font-size: 23px;
	}

</style>
</head>
<body>

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800" id="h1">Dashboard</h1>
                    </div>

                    <!-- Content Row -->
                    <div class="row">

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div id="font" class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                파티 매칭 진행중</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> Count : ${cnt0} </div>
                                        </div>
                                        <div class="col-auto">
                                         <i id="icon" class="fa fa-refresh fa-spin fa-fw"></i>  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div id="font" class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                                파티 매칭 완료</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">Count : ${cnt1}</div>
                                        </div>
                                        <div class="col-auto">
                                          	 <i id="icon" class="fa-regular fa-paper-plane"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Earnings (Monthly) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">파티 해체 예정
                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div id="font" class="h5 mb-0 mr-3 font-weight-bold text-gray-800">Count : ${cnt2}</div>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="col-auto">
                                          <i id="icon" class="fa-regular fa-share-from-square"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div id="font" class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                오늘의 새로운 회원</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800"> ${cnt3}명 가입했어요!</div>
                                        </div>
                                        <div class="col-auto">
                                        <i id="icon" class="fa-regular fa-face-smile-wink"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                  

                    

                        <!-- Area Chart -->

                            <div class="card shadow mb-4" style="width: 100%; height: 500px;">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">Earnings Overvi</h6>

                                </div>
                                <!-- Card Body -->
                                <div class="card-body" >
                                    <canvas id="myChart1"></canvas>
                                </div>
                            </div>



                    <!-- Content Row -->
                    <div class="row">

                        <!-- Content Column -->
                        <div class="col-lg-6 mb-4">

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Projects</h6>
                                </div>
                                <div class="card-body">
                                    <h4 class="small font-weight-bold">Server Migration <span
                                            class="float-right">20%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-danger" role="progressbar" style="width: 20%"
                                            aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Sales Tracking <span
                                            class="float-right">40%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-warning" role="progressbar" style="width: 40%"
                                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Customer Database <span
                                            class="float-right">60%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar" role="progressbar" style="width: 60%"
                                            aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Payout Details <span
                                            class="float-right">80%</span></h4>
                                    <div class="progress mb-4">
                                        <div class="progress-bar bg-info" role="progressbar" style="width: 80%"
                                            aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <h4 class="small font-weight-bold">Account Setup <span
                                            class="float-right">Complete!</span></h4>
                                    <div class="progress">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                            </div>

                            <!-- Color System -->
                            <div class="row">
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-primary text-white shadow">
                                        <div class="card-body">
                                            Primary
                                            <div class="text-white-50 small">#4e73df</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-success text-white shadow">
                                        <div class="card-body">
                                            Success
                                            <div class="text-white-50 small">#1cc88a</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-info text-white shadow">
                                        <div class="card-body">
                                            Info
                                            <div class="text-white-50 small">#36b9cc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-warning text-white shadow">
                                        <div class="card-body">
                                            Warning
                                            <div class="text-white-50 small">#f6c23e</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-danger text-white shadow">
                                        <div class="card-body">
                                            Danger
                                            <div class="text-white-50 small">#e74a3b</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-secondary text-white shadow">
                                        <div class="card-body">
                                            Secondary
                                            <div class="text-white-50 small">#858796</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-light text-black shadow">
                                        <div class="card-body">
                                            Light
                                            <div class="text-black-50 small">#f8f9fc</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 mb-4">
                                    <div class="card bg-dark text-white shadow">
                                        <div class="card-body">
                                            Dark
                                            <div class="text-white-50 small">#5a5c69</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6 mb-4">

                            <!-- Illustrations -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Illustrations</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;"
                                            src="${cp}/resources/img/undraw_posting_photo.svg" alt="...">
                                    </div>
                                    <p>Add some quality, svg illustrations to your project courtesy of <a
                                            target="_blank" rel="nofollow" href="https://undraw.co/">unDraw</a>, a
                                        constantly updated collection of beautiful svg images that you can use
                                        completely free and without attribution!</p>
                                    <a target="_blank" rel="nofollow" href="https://undraw.co/">Browse Illustrations on
                                        unDraw &rarr;</a>
                                </div>
                            </div>

                            <!-- Approach -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Development Approach</h6>
                                </div>
                                <div class="card-body">
                                    <p>SB Admin 2 makes extensive use of Bootstrap 4 utility classes in order to reduce
                                        CSS bloat and poor page performance. Custom CSS classes are used to create
                                        custom components and custom utility classes.</p>
                                    <p class="mb-0">Before working with this theme, you should become familiar with the
                                        Bootstrap framework, especially the utility classes.</p>
                                </div>
                            </div>

                        </div>
                    </div>

</body>
<script type="text/javascript">
<!-- 차트 -->
$(document).ready(function(){
		
		$.ajax({
			url:"/final/admin/mainch",
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
</script>
</html>