<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
   
 <div class="navbar_container">
     <div class="navbar_logo">
         <a href="${pageContext.request.contextPath}/autoMatch/">
             <i class="fab fa-diaspora"></i>
             OTT+
         </a>
     </div>

     <div>
         <ul class="navbar_menu">
             <li class="navbar_menu_item">
             	<a href="${pageContext.request.contextPath}/autoMatch/">홈</a>
             </li>
             <li class="navbar_menu_item">
             	<a href="${pageContext.request.contextPath}/autoMatch/matching">파티매칭</a>
             </li>
             <li class="navbar_menu_item">
             	<a href="${pageContext.request.contextPath}/autoMatch/myParty">MY파티</a>
             </li>
         </ul>
     </div>

     <div>
         <ul class="navbar_login">
         <sec:authorize access="isAnonymous()">
             <li class="navbar_menu_item">로그인</li>
             <li class="navbar_menu_item">회원가입</li>
         </sec:authorize>
         
    	 <sec:authorize access="isAuthenticated()">        
    	 	<sec:authentication property="principal.username" var="userId"/>
    	 	<li><i class="profile fas fa-user-circle"></i><span style="margin-left: 5px;">${userId}님</span></li>
         </sec:authorize>
         </ul>
     </div>
 </div>