<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="board_title">
    <h4>신고 게시판</h4>
</div>

<div class="table_wrapper">
    <table class="board_table">
        <thead>
       		<tr style="height: 40px;">
                <th>번호</th>
                <th style="width:80px">사유</th>
                <th style="width: 50%">제목</th>
                <th class="th_writer">글쓴이</th>
                <th class="th_writer">신고대상</th>
                <th style="width:60px">날짜</th>
                <th style="width:80px">처리내역</th>
            </tr>
        	
        </thead>

		<tbody>			
			<c:forEach var="vo" items="${list}">
				<tr>
	                <td><div>${vo.accusate_id}</div></td>
	                <td><div>${acc_str[vo.why]}</div></td>
	                <td class="td_title">
	                    <div class="title">
	                        <a href="${pageContext.request.contextPath}/board/acc_detail?post_id=${vo.post_id}&pageNum=${pu.pageNum}">${vo.title}</a>
	                    </div>
	                </td>
	                <td>
	                    <div class="writer">
	                    	<img class="writer_profile" style="background-color: #817e7e36;" src="${pageContext.request.contextPath}/resources/img/profile/${vo.my_profile}">
	                        ${vo.user_id}
	                    </div>
	                </td>
	                <td>
	                    <div class="writer">
	                    	<img class="writer_profile" style="background-color: #817e7e36;" src="${pageContext.request.contextPath}/resources/img/profile/${vo.target_profile}">
	                        ${vo.target_id}
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${result_str[vo.result]}</div></td>
            	</tr>
			</c:forEach>
      </tbody>
    </table>
</div>

<div class="board_bottomBar">
    <form action="${pageContext.request.contextPath}/board/accusation">
        <div class="searchBar">
            <select class="searchBar_select" name="field">
                <option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
                <option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
            </select>
            <input type="text" class="searchBar_input" name="keyword" value="${keyword}">
            <button class="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
</div>

<div class="pagination_wrapper">	
<div class="pagination">
	<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
	<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
	<c:choose>
	 	<c:when test="${i==pu.pageNum}">
	 		<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:#e67979">${i}</span></a>
	 	</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:gray">${i}</span></a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
</div>
</div>