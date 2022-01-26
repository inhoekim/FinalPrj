<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTT</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardstyle.css">
    <script src="https://kit.fontawesome.com/ea309b6399.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Smooch&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
</head>
<body>
	<header id="header">
		<tiles:insertAttribute name="logo"/>
	</header>
	
	<div id="main">
		<tiles:insertAttribute name="leftside"/>
		<tiles:insertAttribute name="content"/>
		<tiles:insertAttribute name="rightside"/>
	</div>
	
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
</body>
</html>