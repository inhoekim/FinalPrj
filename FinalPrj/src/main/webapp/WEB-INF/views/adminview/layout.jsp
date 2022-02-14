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
    <!-- Bootstrap core JavaScript-->
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	
    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>
	
	
	<!-- 달력 api -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	
	<!-- 차트 api -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	
	<!-- 데이터테이블 api -->
	<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.11.4/datatables.min.css"/>
	<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.11.4/datatables.min.js"></script>

	
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
            <div id="content" style="background-color: #ECECEC; color:black;">
	
					<!-- 위쪽 메뉴 topmenu.jsp -->
				
					<tiles:insertAttribute name="siteTop"/>
				
	
	
	                <!-- Begin Page Content -->
                	<div class="container-fluid" style="background-color: #ECECEC">
	
							<!--진짜 캔탠츠 내용페이지 삽입 알맹이 -->
				        <div id="content">
							<tiles:insertAttribute name="content"/>
						</div>
				
					</div>
                	<!-- /.container-fluid -->
					
	        
	        </div>
            <!-- End of Main Content -->
		
		
		<!-- 푸터 footer.jsp -->
		<div id="contentfooter" style="background-color: #ECECEC">
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
	

</body>
</html>