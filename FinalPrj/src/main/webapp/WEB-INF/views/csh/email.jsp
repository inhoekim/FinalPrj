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
			<div style="text-align:center;">이메일 인증 (이메일을 인증 받아야 다음 단계로 넘어갈 수 있습니다.)</div>       
			<br><br> 
            <tr> 
                <td>
                   <form:form action="${pageContext.request.contextPath }/emailAuth" method="post">
                        <br>
                        <div>이메일 : <input type="email" name="email" placeholder="  이메일주소를 입력하세요. ">
                        </div>                                                    
                        <br><br>
                        <button type="submit" id="submitBtn">이메일 보내기</button>
              		</form:form>
                    </td>
             </tr>
</table>    
</body>
</html>