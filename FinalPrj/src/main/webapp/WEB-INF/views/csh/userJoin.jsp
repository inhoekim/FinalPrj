<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
<form:form method="post" action="${pageContext.request.contextPath }/join">
	아이디 <br>
	<input type="text" name="user_id"><br>
	비밀번호 <br>
	<input type="password" name="pwd"><br>
	이름 <br>
	<input type="text" name="name"><br>
	주민번호 <br>
	<input type="text" name="jnum"><br>
	나이 <br>
	<input type="text" name="age"><br>
	지역 <br>
	<input type="text" name="area"><br>
	이메일 <br>
	<input type="text" name="email"><br>
	<input type="submit" value="가입">
</form:form>
</body>
</html>