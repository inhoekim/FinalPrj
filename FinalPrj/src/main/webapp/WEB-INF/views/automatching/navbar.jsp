<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="navbar_container">
     <div class="navbar_logo">
         <a href="${pageContext.request.contextPath}/autoMatch/">
             <i class="fab fa-diaspora"></i>
             OTT+
         </a>
     </div>

     <div>
         <ul class="navbar_menu">
             <li class="navbar_menu_item"><a href="${pageContext.request.contextPath}/autoMatch/">홈</a></li>
             <li class="navbar_menu_item">
             	<a href="${pageContext.request.contextPath}/autoMatch/matching">파티매칭</a>
             </li>
             <li class="navbar_menu_item">MY파티</li>
             <li class="navbar_menu_item">가이드</li>
         </ul>
     </div>

     <div>
         <ul class="navbar_login">
             <li class="navbar_menu_item">로그인</li>
             <li class="navbar_menu_item">회원가입</li>
             <!--<li><i class="profile fas fa-user-circle"></i></li>-->
         </ul>
     </div>
 </div>