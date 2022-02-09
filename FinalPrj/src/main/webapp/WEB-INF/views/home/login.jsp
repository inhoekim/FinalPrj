<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원 로그인</h1>
<form:form method="post" action="${pageContext.request.contextPath }/login">
	아이디<br>
	<input type="text" name="user_id"><br>
	비밀번호<br>
	<input type="password" name="pwd"><br>
	<label for="remember-me">로그인 유지</label>
	<input type="checkbox" id="remember-me" name="remember-me" /><br>	
	<c:if test="${not empty ERRORMSG}">
        <font color="red">
        	<p> ${ERRORMSG }</p>
        </font>
    </c:if><br>
<input type="submit" value="로그인"><br>
</form:form>
<a href="${pageContext.request.contextPath }/findId">아이디 찾기</a> | <a href="${pageContext.request.contextPath }/findPwd">비밀번호 찾기</a>
</body>
</html> 