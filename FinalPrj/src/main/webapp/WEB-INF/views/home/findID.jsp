<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div style="display: flex; flex-direction: column; justify-content: center;height: 100%">
<form:form method="post" action="${pageContext.request.contextPath }/findId">
<div class="findBox">
	<h4 style="margin-bottom: 10px;">아이디 찾기</h4>
		<div style="margin-bottom: 25px;">가입시 등록한 메일 주소를 입력하면 ID를 찾을 수 있습니다. 성함과 가입할 때 등록한 메일 주소를 입력하고 "아이디 찾기" 버튼을 클릭해주세요.</div>
		<div style="display: flex; justify-content: space-between;width:230px;">
			<span>이름</span>
			<input type="text" name="name" style= "height: 20px;" >
		</div>

		<div style="display: flex; justify-content: space-between;margin: 10px 0;width:230px;">
			<span>이메일</span>
			<input type="text" name="email" style="margin-bottom: 10px;height: 20px">	
		</div>

		<div> ${user_id} </div><br>
		<input type="submit" value="아이디 찾기" style="width:100px;width: 100px;background: #b2e1cc73;border: 1px solid #d8e3d5;">
</div>
</form:form>

<form:form method="post" action="${pageContext.request.contextPath }/findPwd" style="margin: 10px;">
<div class="findBox">
	<h4 style="margin-bottom: 10px;">비밀번호 찾기</h4>
	<div style="margin-bottom: 25px;">임시 비밀번호를 새로 발급 받을 수 있습니다. 아이디와 가입시 등록한 메일 주소를 입력하고 "비밀번호 찾기" 버튼을 클릭해주세요.</div>
	<div style="display: flex; justify-content: space-between;width:230px;">
		<span>아이디</span>
		<input type="text" name="user_id" style= "height: 20px;" >
	</div>
		
	<div style="display: flex; justify-content: space-between;margin: 10px 0;width:230px;">
		<span>이메일</span>
		<input type="text" name="email" style="margin-bottom: 10px;height: 20px">	
	</div>
	<div> ${resultMsg} </div><br>
	<input type="submit" value="비밀번호 찾기" style="width: 100px;background: #b2e1cc73;border: 1px solid #d8e3d5;">
</div>
</form:form>
</div>