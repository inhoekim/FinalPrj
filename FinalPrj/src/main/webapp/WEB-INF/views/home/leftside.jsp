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
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=0">넷플릭스</a></div>
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=1">왓챠</a></div>
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=2">디즈니</a></div>
                 </div>
             </div>
             <div class="folder">
                 <div class="folder_category">
                     <span class="category_name">
                     <i class="fas fa-folder"></i>
                     공용
                     </span>
                     <i class="fas fa-angle-down toggle" style="color:black"></i>
                 </div>

                 <div class="folder_items">
                     <div class="folder_item">전체공지</div>
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/accusation">신고</a></div>
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
                     <div class="profile_id">${cRList[0].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[0].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/undraw_posting_photo.svg"/>
                     <div class="profile_id">${cRList[1].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[1].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">${cRList[2].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[2].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">${cRList[3].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[3].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <i class="fas fa-user profile_img"></i>
                     <div class="profile_id">${cRList[4].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[4].content}</div>
             </div>

         </div>
     </div>
 </aside>