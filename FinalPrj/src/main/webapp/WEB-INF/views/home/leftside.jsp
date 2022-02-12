<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <aside class="leftside">
     <div class="leftside_container">
         <div class="cotainer_title">게시판 Menu</div>

         <div class="cotainer_items">
             <div class="folder">
                 <div class="folder_category">
                     <span class="category_name">
                         <i class="fas fa-folder"></i>
                         OTT 종류
                     </span>
                     <i class="fas fa-angle-down toggle" style="color:black"></i>
                 </div>
                 <div class="folder_items">
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list">넷플릭스</a></div>
                     <div class="folder_item">왓챠</div>
                     <div class="folder_item">디즈니</div>
                 </div>
             </div>
             <div class="folder">
                 <div class="folder_category">
                     <span class="category_name">
                     <i class="fas fa-folder"></i>
                     기타게시판
                     </span>
                     <i class="fas fa-angle-down toggle" style="color:black"></i>
                 </div>

                 <div class="folder_items">
                     <div class="folder_item">자유게시판</div>
                     <div class="folder_item">신고</div>
                 </div>
             </div>
         </div>
     </div>

     <div class="leftside_container">
         <div class="cotainer_title">최신 댓글</div>
         <!--댓글-->
         <div class="cotainer_items">

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/undraw_posting_photo.svg"/>
                     <div class="profile_id">김인회</div>
                 </div>
                 <div class="comment_content">댓글내용입니다.TEST입니다.어쩌구저쩌구 블라블라.</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/undraw_posting_photo.svg"/>
                     <div class="profile_id">가나다라마바사아자차카타파하</div>
                 </div>
                 <div class="comment_content">어쩌구 저쩌구 블라블라</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">ABCDEFGHIJKLMNOPQRS</div>
                 </div>
                 <div class="comment_content">댓글내용</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">테스트</div>
                 </div>
                 <div class="comment_content">댓글내용</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">테스트</div>
                 </div>
                 <div class="comment_content">댓글내용</div>
             </div>

         </div>
     </div>
 </aside>