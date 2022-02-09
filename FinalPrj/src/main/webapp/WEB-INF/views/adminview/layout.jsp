<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin- Dashboard</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">

	   
</head>
<body id="page-top">
	
	<!-- Page Wrapper -->
	<div id="wrapper">
		
		
		<!-- 왼쪽메뉴 lieftmenu.jsp -->
		
			<tiles:insertAttribute name="leftmenu"/>
		
		<!-- 왼쪽메뉴 테스트 끝 -->
		
		        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">
	
	
	            <!-- Main Content -->
            <div id="content" style="background-color: #27293D">
	
					<!-- 위쪽 메뉴 topmenu.jsp -->
				
					<tiles:insertAttribute name="siteTop"/>
				
	
	
	                <!-- Begin Page Content -->
                	<div class="container-fluid" style="background-color: #27293D">
	
							<!--진짜 캔탠츠 내용페이지 삽입 알맹이 -->
				        <div id="content">
							<tiles:insertAttribute name="content"/>
						</div>
				
					</div>
                	<!-- /.container-fluid -->
					
	        
	        </div>
            <!-- End of Main Content -->
		
		
		<!-- 푸터 footer.jsp -->
		<div id="contentfooter" style="background-color: #27293D">
			<tiles:insertAttribute name="siteBottom"/>
		</div>
		
		
		</div>
        <!-- End of Content Wrapper -->
	
	</div>
	<!-- End of Page Wrapper -->
	
	
	    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    
    
		<!-- 로그아웃 모델 logoutmodel.jsp-->
	<%@include file="../adminview/logoutmodel.jsp" %>
	
	
	    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>
    
    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>
</body>
</html>