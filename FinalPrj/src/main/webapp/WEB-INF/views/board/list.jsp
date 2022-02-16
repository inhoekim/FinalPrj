<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
</head>
<body>
<h1>전체게시판</h1>
<table>
 	<tr>
 		<th>번호</th>
 		<th>분류</th>
 		<th>제목</th>
 		<th>글쓴이</th>
 		<th>날짜</th>
 		<th>조회수</th>
 	</tr>
 	<c:forEach var="vo" items="${list}">
 	<tr>
 		<th>${vo.post_id}</th>
 		<th>
 		<c:if test="${vo.subcate==0}">자유</c:if>
 		<c:if test="${vo.subcate==1}">파티찾기</c:if>
 		<c:if test="${vo.subcate==2}">영화추천(소개)</c:if>
 		<c:if test="${vo.subcate==3}">신고</c:if>
 		</th>
 		<th><a href="${cp}/board/detail?post_id=${vo.post_id}">${vo.title}</a><span>&nbsp;&nbsp;${vo.comCnt}</span></th>
 		<th>${vo.user_id}</th>
 		<th>${vo.created_day}</th>
 		<th>${vo.hit}</th>
 	</tr>
 	</c:forEach>
</table>
<div>	
	<c:if test="${pu.startPageNum != 1}">
		<a href="${cp}/board/list?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
	</c:if>
	<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
	<c:choose>
	 	<c:when test="${i==param.pageNum}">
	 		<a href="${cp }/board/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:blue">${i}</span></a>
	 	</c:when>
		<c:otherwise>
			<a href="${cp }/board/list?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:gray">${i}</span></a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<c:if test="${pu.endPageNum<pu.totalPageCount}">
		<a href="${cp }/board/list?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
	</c:if>
</div>
			
<!-- 검색 -->
<div>	
	<form action="${cp}/board/list">
	<select name="field">
		<option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
		<option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
		<option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
		<option value="ticon" <c:if test="${field=='ticon'}">selected</c:if>>제목+내용</option>
	</select>
	<input type="text" name="keyword" value="${keyword}">
	<input type="submit" value="검색">
	</form>
</div>
 	<a href="${cp}/board/insert">글쓰기</a>
</body>
</html>