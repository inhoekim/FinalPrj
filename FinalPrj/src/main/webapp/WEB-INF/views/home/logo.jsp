<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header_container">
    <div class="container_notice">
        <div class="notice_title">공지사항</div>
        <div class="notice_content">내용...</div>
    </div>

    <div class="container_logo">
        <a href="#">OTT Plus</a>
    </div>

    <div class="container_login">
        <div class="login_item" style="border-bottom: 1px solid #efefef;">
        	<a href="${pageContext.request.contextPath }/login">로그인</a>
        </div>
        <div class="login_item">
        	<a href="${pageContext.request.contextPath }/email">회원가입</a>
        </div>
        <!--
        <div class="login_item">
            <i class="profile fas fa-user-circle"></i>
        </div>
        -->
        </ul>
    </div>
</div>
