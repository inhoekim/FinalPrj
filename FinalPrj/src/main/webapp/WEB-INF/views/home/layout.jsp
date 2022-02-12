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
    <title>OTT</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/boardstyle.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.js"></script>
    <script src="https://kit.fontawesome.com/ea309b6399.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/emphasize.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/leftside.js"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
				<tiles:insertAttribute name="content"/>
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
    	
    	<form:form method="post" action="${pageContext.request.contextPath }/login">
        	<div style="margin-top: 20px;"> 
	        아이디<br>
			<input type="text" name="user_id" value="${user_id }"><br>
			비밀번호<br>
			<input type="password" name="pwd"><br>
			<label for="remember-me">로그인 유지</label>
			<input type="checkbox" id="remember-me" name="remember-me" /><br>	
			<input type="submit" value="로그인"><br>
			<c:if test="${not empty param.errormsg}">
		        <font color="red">
		        	<p> ${param.errormsg }</p>
		        </font>
		    </c:if><br>
			<a href="${pageContext.request.contextPath }/findId">아이디 찾기</a> | <a href="${pageContext.request.contextPath }/findPwd">비밀번호 찾기</a>
	    </div>
	    </form:form>
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