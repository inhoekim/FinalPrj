<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/accusation">신고</a></div>
                     </sec:authorize>
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
    
     <div class="dropdown-area">
        <ul class="notify-area">
          <sec:authorize access="isAnonymous()">
          	<li>로그인이 필요합니다.</li>
          </sec:authorize>
          <sec:authorize access="isAuthenticated()">
      		
          </sec:authorize>
       
        </ul>
        <div class="notify-button">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#757575" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
        </div>
      </div>
      <script type="text/javascript">
    	let notifyButton = document.querySelector(".notify-button");
		let notifyArea = document.querySelector(".notify-area");
		
		const ShowDropdown = () => {
		  notifyButton.classList.add("#active");
		  notifyArea.style.visibility = "visible";
		  list();
		}
		function list(){
			$(".notify-area").empty();
			
			 $.ajax({
					url:"${cp}/notiShow",
					dataType:'json',
					success:function(data){
						if(data.list=='good'){
							$(".notify-area").html("<li>알림이 없습니다.</li>");
						}else{
						$(".notify-area").append("<li><button class='w-btn w-btn-indigo' onclick='delAll();'>전체삭제</button></li>");
						$(data.list).each(function(i,d){
							let notify_id=d.notify_id;
							let sender_id=d.sender_id;
							let notify_type=d.notify_type;
							let type="";
							if(notify_type==1){
								type=" 회원님 글에 댓글을 작성했습니다."
							}
							if(notify_type==2){
								type=" 회원님 댓글에 댓글을 작성했습니다."
							}
							if(notify_type==3){
								type=" 회원 글 및 댓글에 좋아요를 눌렀습니다."
							}
							let html="<li>"+sender_id+"님이"+type+" <button class='w-btn w-btn-indigo' onclick='removeNoti("+ notify_id +")' >삭제</button><li>"
							$(".notify-area").append(html);
							
							});
							
						}
						
					}
			  });
		}
		const HideDropdown = () => {
		  notifyButton.classList.remove("#active");
		  notifyArea.style.visibility = "hidden";
		 
		}
		
		function ToggleNotifyDropdown (event) {
		  var isInside = notifyButton.contains(event.target) || notifyArea.contains(event.target);
		  
		  return isInside ? ShowDropdown() : HideDropdown();
		}
		
		document.addEventListener("click", ToggleNotifyDropdown);
		
		function removeNoti(notify_id){
			console.log(notify_id);
			$.ajax({
				url:'${cp}/noti/delnoti',
				data:{
					"notify_id":notify_id
				},
				success:function(data){
					list();
				}
			});
		}
		function delAll(){
			$.ajax({
				url:'${cp}/notiDel',
				success:function(data){
					list();
				}
			});
		}
</script>
 </aside>