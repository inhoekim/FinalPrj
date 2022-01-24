<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<div id="header"> 
			<jsp:include page="${requestScope.header }" />
		</div>
		
		<div id="contentmapping">
			<jsp:include page="${requestScope.contentmapping }" />
		</div>
		
			<div id="content">
				<jsp:include page="${requestScope.main }" />
			</div>
			
		<div id="contentfooter">
			<jsp:include page="${requestScope.contentfooter }" />
		</div>
	</div>
	<!-- End of Page Wrapper -->
	
	
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top">
	    <i class="fas fa-angle-up"></i>
	</a>
	
	<%@include file="../adminview/logoutpopup.jsp" %>
	
    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-area-demo.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/demo/chart-pie-demo.js"></script>
    
</body>
</html>