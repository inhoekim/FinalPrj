<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>비밀번호 찾기</h1>
<form:form method="post" action="${pageContext.request.contextPath }/findPwd">
	아이디<br>
	<input type="text" name="user_id" ><br>
	이메일<br>
	<input type="text" name="email"><br>	
	<div> ${resultMsg} </div>
	<input type="submit" value="비밀번호 찾기">
</form:form>
</body>
</html> 