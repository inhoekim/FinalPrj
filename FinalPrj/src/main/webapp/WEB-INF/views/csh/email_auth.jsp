<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#submitBtn{
        width:100px;
        margin:auto;
        display:block;
    }
</style>
</head>
<body>
<table border="1" width="300" height="300" align= "center">
			<div style="text-align:center;">인증 번호를 입력하세요.</div>
			<br><br>        
            <tr> 
                <td>
                   <form:form action="${pageContext.request.contextPath }/join_auth${dice}" method="post">
                        <br>
                        <div>인증번호 : <input type="number" name="email_auth" placeholder="  인증번호를 입력하세요. ">
                         	<input type="hidden" name="email_id" value="${email_id }">
                        </div>                                                    
                        <br><br>
                        <button type="submit" id="submitBtn">인증번호 확인</button>
              		</form:form>
                    </td>
             </tr>
</table>    
</body>
</html>