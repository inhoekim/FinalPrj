<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>


<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OTT+</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainstyle.css">
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
<script src="https://kit.fontawesome.com/ea309b6399.js" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/animate.js"></script>

<script type="text/javascript" charset="utf-8">
	sessionStorage.setItem("cp", "${pageContext.request.contextPath}");
</script>
</head>

<body>
	<nav id="navbar">
		<tiles:insertAttribute name="navbar"/>
	</nav>
	

	<tiles:insertAttribute name="main_content"/>
	
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>