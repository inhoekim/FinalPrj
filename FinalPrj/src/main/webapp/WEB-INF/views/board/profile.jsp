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
    <div class="profile_banner">유저: <b>@김인회</b></div>
    </div>
    <div class="profileBox">
        <h4 style="margin-bottom: 12px">최근 작성글</h4>
        <div class="profile_boxItem">
            <div>
                <a class="board_category" href="#">넷플릭스</a>
                <span>파티찾아요~~~~</span><span style="margin-left: 8px;">[2]</span>
            </div>
            <span style="color: #4040ad8c">2022-02-21 00:07:57</span>
        </div>
        
        <div class="profile_boxItem">
            <div>
                <a class="board_category" href="#">넷플릭스</a>
                <span>파티찾아요~~~~</span><span style="margin-left: 8px;">[2]</span>
            </div>
            <span style="color: #4040ad8c">2022-02-21 00:07:57</span>
        </div>        
    </div>

    <div class="profileBox">
        <h4 style="margin-bottom: 12px">최근 작성 댓글</h4>
        <div class="profile_boxItem">
            <div>
                <a class="board_category" href="#">넷플릭스</a>
                <span>파티찾아요~~~~</span>
            </div>
            <span style="color: #4040ad8c">2022-02-21 00:07:57</span>
        </div>
    </div>
</div>