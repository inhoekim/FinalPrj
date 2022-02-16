<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="board_title">
    <h4>${category_str[category]} 게시판</h4>
</div>

<div class="board_topbar">
    <div class="topbar_title">
        <div class="topbar_classification">분류: ${subcate_str[subcate]}</div>
        <i class="fas fa-angle-down toggle"></i>
    </div>
    <div class="topbar_content">
        <div class="content_wrapper">
            <a href="${pageContext.request.contextPath}/board/list?category=${category}&subcate=0">전체</a>
            <a href="${pageContext.request.contextPath}/board/list?category=${category}&subcate=1">공지</a>
            <a href="${pageContext.request.contextPath}/board/list?category=${category}&subcate=2">파티찾기</a>
            <a href="${pageContext.request.contextPath}/board/list?category=${category}&subcate=3">자유</a>
            <a href="${pageContext.request.contextPath}/board/list?category=${category}&subcate=4">신고</a>
        </div>

    </div>
</div>

<div class="table_wrapper">
    <table class="board_table">
        <thead>
       		<tr style="height: 40px;">
                <th>번호</th>
                <th style="width:60px">분류</th>
                <th style="width: 50%">제목</th>
                <th class="th_writer">글쓴이</th>
                <th>날짜</th>
                <th>조회수</th>
                <th>추천수</th>
            </tr>
        	
        </thead>

		<tbody>
			<c:forEach var="vo" items="${notice}">
				<tr class="notice">
	                <td><div>${vo.post_id}</div></td>
	                <td><div>공지</div></td>
	                <td class="td_title">
	                    <div class="title">
	                        ${vo.title}
	                    </div>
	                    <div class="commentNum">${vo.comCnt}</div>
	                </td>
	                <td>
	                    <div class="writer">
	                        <img class="writer_profile" src="${pageContext.request.contextPath}/resources/img/ott_logos/${admin_profile}">
	                        admin
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${vo.hit}</div></td>
	                <td><div>${vo.voCnt}</div></td>
            	</tr>
			</c:forEach>
			
			<c:forEach var="vo" items="${list}">
				<tr>
	                <td><div>${vo.post_id}</div></td>
	                <td><div>${subcate_str[vo.subcate]}</div></td>
	                <td class="td_title">
	                    <div class="title">
	                        ${vo.title}
	                    </div>
	                    <div class="commentNum">${vo.comCnt}</div>
	                </td>
	                <td>
	                    <div class="writer">
	                        ${vo.user_id}
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${vo.hit}</div></td>
	                <td><div>${vo.voCnt}</div></td>
            	</tr>
			</c:forEach>
      </tbody>
    </table>
</div>

<div class="board_bottomBar">
    <form action="${pageContext.request.contextPath}/board/list">
        <div class="searchBar">
            <select class="searchBar_select" name="field">
                <option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
                <option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
                <option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
                <option value="ticon" <c:if test="${field=='ticon'}">selected</c:if>>제목+내용</option>
            </select>
            <input type="text" class="searchBar_input" name="keyword" value="${keyword}">
            <input type="hidden" name="category" value="${category}">
            <input type="hidden" name="subcate" value="${subcate}">
            <button class="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
    <a class="writeButton" href="${pageContext.request.contextPath}/board/insert?category=${category}"><i class="fa-solid fa-pencil"></i><span style="font-size: 12px; margin-left: 3px;">쓰기</span></a>

</div>