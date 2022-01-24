<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1" width="300" height="300" align= "center">
			<p>인증 번호를 입력하세요.</p>        
            <tr> 
                <td>
                   <form action="${pageContext.request.contextPath }/join_auth${dice}" method="post">
                        <br>
                        <div>인증번호 : <input type="number" name="email_auth" placeholder="  인증번호를 입력하세요. ">
                        </div>                                                    
                        <br><br>
                        <button type="submit">인증번호 확인</button>
              		</form>
                    </td>
             </tr>
</table>    
</body>
</html>