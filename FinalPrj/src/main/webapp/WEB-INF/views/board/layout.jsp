<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
    <title>OTT</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardstyle2.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/emphasize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/leftside.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/profileClick_board.js"></script>
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
	<!-- include summernote-ko-KR -->
	<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
	
    <link href="${pageContext.request.contextPath}/resources/fontawesome-6.0.0-web/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Smooch&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&display=swap" rel="stylesheet">
</head>
<body style="min-height: 1000px">
	<header id="header">
		<tiles:insertAttribute name="logo"/>
	</header>
	
	<div id="main">
		<tiles:insertAttribute name="leftside"/>
		 <div class="right_two">
			<section id="content">
				<tiles:insertAttribute name="main_content"/>
			</section>
			<tiles:insertAttribute name="rightside"/>
		</div>
	</div>
	
	<footer id="footer">
		<tiles:insertAttribute name="footer"/>
	</footer>
	
	<div id="loginWrapper" class="hidden">
    <div class="emphasized_div">
    	<div class="top_bar">
    		<h3>회원 로그인</h3>
    		<div id="cancle" class="cancle" style="display: inline-block">
    		<img src="${pageContext.request.contextPath}/resources/img/close-24.png" style="width:18px; height: 18px">
    		</div>
    	</div>
    	<div class="loginContainer" style="text-align:center;">
    	<form:form method="post" action="${pageContext.request.contextPath }/login" class="loginForm">
        	<div style="margin-top: 20px;"> 
		        
				<input type="text" name="user_id" value="${user_id }" placeholder="아이디" style="width:300px; height:30px;"><br><br>
				<input type="password" name="pwd" placeholder="비밀번호" style="width:300px; height:30px;"><br><br>
				<label for="remember-me">로그인 유지</label>
				<input type="checkbox" id="remember-me" name="remember-me" /><br><br>	
				<input type="submit" value="로그인"><br>
				<c:if test="${not empty param.errormsg}">
			        <font color="red" size="2">
			        	 ${param.errormsg }
			        </font>
			    </c:if><br><br>
				<a style="color:#5d5e5e73;font-weight:600;font-size:13px" href="${pageContext.request.contextPath }/findId">아이디 찾기 | 비밀번호 찾기</a>
	    	</div>
	    </form:form>
	    </div>
	 </div>
    </div>
</body>
<script>
 	$(function(){
 		let flag = ${!empty param.login};
 		if(flag) {
 			$("#loginWrapper").removeClass("hidden");
 	        $("html").css("pointer-events" , "none");
 	        $("#loginWrapper").css("pointer-events" , "auto");
 		}
 	});
</script>
</html>