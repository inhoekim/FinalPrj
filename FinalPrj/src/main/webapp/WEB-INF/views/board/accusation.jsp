<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고</title>
</head>
<body>
<form:form method="post" action="${pageContext.request.contextPath}/post/accusation">
	신고대상아이디<input type="text" name="target_id" value="${vo.user_id}" readonly="readonly"><br>
	<input type="hidden" name="post_id" value="${vo.post_id}"><br>
	신고사유<select name="category_id">
		<option value="0">욕설</option>
		<option value="1">허위광고</option>
		<option value="2">말도안되는짓</option>
	</select><br>
	제목<input type="text" name="title"><br>
	내용<textarea rows="4" cols="40" name="content"></textarea><br>
	<input type="submit" value="완료"><br>
</form:form>
</body>
</html>