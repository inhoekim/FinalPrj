<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="board_title">
    <h4>OTT 게시판</h4>
</div>

<div class="post_detail">
    <div class="post_title">
        <span class="classification">파티찾기</span>
        <span class="title">글제목</span>
    </div>

    <div class="post_profile">
        <div class="mainInfo">
            <div class="writer"><img class="writer_profile" src="#">김인회</div>
            <span style="margin-left: 10px">2022-02-15 08:13</span>
        </div>

        <div class="otherInfo">
            <span>조회수 423</span>
            <span>하트 2</span>
            <span>댓글 3</span>
        </div>
    </div>

    <div class="post_content">
        글내용
    </div>

    <div class="interaction">
        <div class="likeBox">
            <div class="likeVote"><i class="fas fa-heart like" style="margin-right: 5px;"></i>좋아요 <span class="like_cnt">188</span></div>
            <div class="like_detailBox">
                <i class="fas fa-user profile_img"></i>
                <span>{user_id}포함 <span style="color:#e67979">{like_cnt}</span>명이 추천</span>
            </div>
        </div>

        <div class="accusation">
            <div class="accusation_word">신고</div>
            <i class="fa-solid fa-triangle-exclamation"></i>
        </div>
    </div>

    <div class="like_detail_wrapper">
        <div class="like_detail">
            <div class="detail">
                <img class="writer_profile" src="/profile/man4-32.png"/>
                <span style="margin-top: 3px;">{user_id}</span>
            </div>         
        </div>
    </div>

    <div class="commentBox">
        <div class="commentBox_title">댓글<span style="color : #e67979; margin-left: 5px;">{comment_cnt}</span></div>
        <div class="commentBox_content">
            <div class="comment">
                <img class="writer_profile" src="profile/woman1-32.png">
                <div class="comment_wrapper">
                    <div class="content_header">
                        <span style="margin-right: 10px"><b>{user_id}</b></span>
                        <span style="color: darkgray">{timestamp}</span>
                    </div>
                    <div class="content_main">
                        댓글내용 {comment_content}
                    </div>
                    <div class="content_interaction">
                        <div class="recommnet">답글</div>
                        <div class="likeButton"><i class="fas fa-heart" style="color: #e67979;margin-right: 3px;font-size: 12px;"></i><span class="like_cnt" style="font-size: 12px; margin: 0;">188</span></div>
                    </div>

                </div>
            </div>

            <div class="comment">
                <img class="writer_profile" src="profile/woman1-32.png">
                <div class="comment_wrapper">
                    <div class="content_header">
                        <span style="margin-right: 10px"><b>{user_id}</b></span>
                        <span style="color: darkgray">{timestamp}</span>
                    </div>
                    <div class="content_main">
                        댓글내용 {comment_content}
                    </div>
                    <div class="content_interaction">
                        <div class="recommnet">답글 <span style="maring-left: 5px">{답글_cnt}</span></div>
                        <div class="likeButton"><i class="fas fa-heart" style="color: #e67979;margin-right: 3px;font-size: 12px;"></i><span class="like_cnt" style="font-size: 12px; margin: 0;">188</span></div>
                    </div>

                </div>
            </div>
            
        </div>
    </div>
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
	                        <a href="${pageContext.request.contextPath}/board/detail?post_id=${vo.post_id}">${vo.title}</a>
	                    </div>
	                    <div class="commentNum">${vo.comCnt}</div>
	                </td>
	                <td>
	                    <div class="writer">
	                        <img class="writer_profile" style="background-color: #817e7e36;" src="${pageContext.request.contextPath}/resources/img/ott_logos/${admin_profile}">
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
	                        <a href="${pageContext.request.contextPath}/board/detail?post_id=${vo.post_id}">${vo.title}</a>
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

<div class="pagination_wrapper">	
<div class="pagination">
	<a href="${pageContext.request.contextPath}/board/list?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}">이전</a>
	<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
	<c:choose>
	 	<c:when test="${i==pu.pageNum}">
	 		<a href="${pageContext.request.contextPath}/board/list?pageNum=${i}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}"><span style="color:#e67979">${i}</span></a>
	 	</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/board/list?pageNum=${i}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}"><span style="color:gray">${i}</span></a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/board/list?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}">다음</a>
</div>
</div>