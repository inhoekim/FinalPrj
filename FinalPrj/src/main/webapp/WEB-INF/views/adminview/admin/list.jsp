<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#title{ margin-left: 10px; }
	table,tr{ border: 1px solid; text-align: left; 
		margin-top: 30px; border-color: #282E47;
	}
	th{
		background-color: #1E1E2F;
		color: white;
		text-align: left;
		padding-left: 20px;}
	td{
		background-color: #27293D;
		color:#757068;
		text-align: left;
		padding-left: 20px;}
	#th1{ width: 250px; height: 50px;	}
	#th2{ width: 210px; height: 50px;	}
	#th3{ width: 400px; height: 50px;	}
	#th4{ width: 210px; height: 50px;	}
	#th5{ width: 240px; height: 50px;	}
	#th6{ width: 240px; height: 50px;	}
	

</style>
</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

	<h2 id="title">회원목록</h2>
	<hr>


	               <!-- Topbar Search -->
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
                        </div>
                    </form> 

	
	<table>
		<tr>
			<th id="th1" >아이디</th>
			<th id="th2" >이름</th>
			<th id="th3" >이메일</th>
			<th id="th4" >지역</th>
			<th id="th5" >회원등급</th>
			<th id="th6" >가입일</th>
		</tr>
	<c:forEach var="vo" items="${list }">
		<tr>
			<td id="th1" > ${vo.user_id} </td>
			<td id="th2" > ${vo.name}</td>
			<td id="th3" > ${vo.email}</td>
			<td id="th4" > ${vo.area}</td>	<!-- 지역컬럼 -->
			<td id="th5" > ${vo.state}</td> <!-- 0:정상 , 1:블랙회원 , 2:탈퇴회원 -->
			<td id="th6" > ${vo.regdate}</td>
		</tr>
	</c:forEach>
	</table>








</body>
</html>