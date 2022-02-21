<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<c:set var="cp" value="${pageContext.request.contextPath}"/>


<div class="profile_wrapper">
    <div>
    <div class="profile_banner">유저: <b>@${user_id}</b></div>
    </div>
    <div class="profileBox">
        <h4 style="margin-bottom: 12px">최근 작성글</h4>
        <c:forEach var="post" items="${pList}">
        <div class="profile_boxItem">
            <div>
                <a class="board_category" href="#">${post.cname }</a>
                <span>${post.title}</span><span style="margin-left: 8px;">${post.comCnt }</span>
            </div>
            <span style="color: #4040ad8c">${post.created_day}</span>
        </div>
        </c:forEach>
    </div>

    <div class="profileBox">
        <h4 style="margin-bottom: 12px">최근 작성 댓글</h4>
        <c:forEach var="comm" items="${cList}">
        <div class="profile_boxItem">
            <div>
                <a class="board_category" href="#">
                <c:if test="${comm.cate==0}">
                	넷플릭스
                </c:if>
                <c:if test="${comm.cate==1}">
                	왓챠
                </c:if>
                <c:if test="${comm.cate==2}">
                	디즈니
                </c:if>
                <c:if test="${comm.cate==3}">
                	전체공지
                </c:if>
                </a>
                <span>${comm.content }</span>
            </div>
            <span style="color: #4040ad8c">${comm.created_day}</span>
        </div>
        </c:forEach>
    </div>
</div>