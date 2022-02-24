<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div style="display: flex; flex-direction: column; justify-content: center;height: 100%">
<div class="joinBox">
<form:form method="post" action="${pageContext.request.contextPath }/deleteUser" name="uj">
    <div style="display: flex; width:100%; margin:15px 0;">
    <span style="width:100px">아이디</span><input type="text" name="user_id" id="user_id" maxlength="13" style= "height: 25px; margin-right:10px;" value="${user_id }" readonly="readonly">
    </div>
    <div style="display: flex; width:100%; margin:15px 0;">
    <span style="width:100px">비밀번호</span><input type="password" name="pwd" id="pwd" style= "height: 25px; margin-right:10px">
    </div>
    <div style="text-align:center;">
    <input type="submit" value="탈퇴" style="font-size:20px;width:200px;height: 50px;background: #b2e1cc73;border: 1px solid #d8e3d5;">
    </div><br>
</form:form>
</div>
</div>
</body>
</html>
