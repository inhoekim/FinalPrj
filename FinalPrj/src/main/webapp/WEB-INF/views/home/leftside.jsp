<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<style>
		.notify-cnt {
		    background-color: #ffb6c1;
		    border-radius: 50%;
		    width: 20px;
		    height: 20px;
		    display: flex;
		    justify-content: center;
		    align-content: center;
		    font-weight: 800;
		    font-family: 'Montserrat', sans-serif;
		    font-size: 15px;
		    font-weight: bold;
		    color: #ff0000;
		    position: absolute;
		    top: -0.1rem;
		    right: -0.3rem;
		}
		
		.notify-button {
		  position: fixed;
		  top:90%;
		  right: 5%;
		  z-index: 10;
		  background-color: #ffffff;
		  width: 3.5rem;
		  height: 3.5rem;
		  border-radius: 3.5rem;
		  display: flex;  
		  align-items: center;
		  justify-content: center;
		  
		  cursor: pointer;
		  transition: all 0.2s ease;
		  box-shadow:
		  0 1.1px 2.2px rgba(0, 0, 0, 0.014),
		  0 2.7px 5.3px rgba(0, 0, 0, 0.02),
		  0 5px 10px rgba(0, 0, 0, 0.025),
		  0 8.9px 17.9px rgba(0, 0, 0, 0.03),
		  0 16.7px 33.4px rgba(0, 0, 0, 0.036),
		  0 40px 80px rgba(0, 0, 0, 0.05);
		}
		
		#active {
		  background-color: #6a1b9a;
		}
		
		#active svg {
		  fill: #ffffff;
		  stroke: #ffffff;
		}
		
		.notify-area {
		  position: absolute;
    	  transform: translate(-60%, -50%);
          width: 300px;
          margin-right: 20px;
		  background-color: #ffffff;
		  border-radius: 0.3rem;
		  margin-left:5px;
		  display: flex;
		  flex-direction: column;
		  margin-bottom: 0.5rem;
		  
		  box-shadow:
		  0 1.1px 2.2px rgba(0, 0, 0, 0.014),
		  0 2.7px 5.3px rgba(0, 0, 0, 0.02),
		  0 5px 10px rgba(0, 0, 0, 0.025),
		  0 8.9px 17.9px rgba(0, 0, 0, 0.03),
		  0 16.7px 33.4px rgba(0, 0, 0, 0.036),
		  0 40px 80px rgba(0, 0, 0, 0.05);
		  
		  visibility: hidden;
		  
		  transition: visibility 0.2s ease-in;
		}
		
		.notify-area li {
		  list-style: none;
		  padding: 1rem 2rem;
		  
		  transition: background-color 0.1s ease;
		}
		
		.notify-area li:first-child {
		  border-radius: 0.3rem 0.3rem 0 0;
		}
		
		.notify-area li:last-child {
		  border-radius: 0 0 0.3rem 0.3rem;
		}
		
		.notify-area li:hover {
		  background-color: #eaeaea;
		}
		#del:after {content: "\00d7"; font-size:15pt;line-height:50px;}
		
		.w-btn {
		    position: relative;
		    border: none;
		    display: inline-block;
		    padding: 3px 10px;
		    border-radius: 15px;
		    font-family: "paybooc-Light", sans-serif;
		    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
		    text-decoration: none;
		    font-weight: 600;
		    text-align:center;
		    transition: 0.25s;
		    font-size: 12px;
		}
		
		
		
		.w-btn-indigo {
		    background-color: #EAEAEA;
		    color: #000000;
		}
		
		.w-btn-indigo-outline {
		    border: 3px solid aliceblue;
		    color: #000000;
		}
		
		.w-btn-indigo-outline:hover {
		    color: #1e6b7b;
		    background: aliceblue;
		}
		
		
		
		.w-btn:hover {
		    letter-spacing: 2px;
		    transform: scale(1.2);
		    cursor: pointer;
		}
</style>
 <aside class="leftside">
     <div class="leftside_container">
         <div class="cotainer_title">????????? Menu</div>

         <div class="cotainer_items">
             <div class="folder">
                 <div class="folder_category">
                     <span class="category_name">
                         <i class="fas fa-folder"></i>
                         OTT ??????
                     </span>
                     <i class="fas fa-angle-down toggle" style="color:black"></i>
                 </div>
                 <div class="folder_items">
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=0">????????????</a></div>
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=1">??????</a></div>
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/list?category=2">?????????</a></div>
                 </div>
             </div>
             <div class="folder">
                 <div class="folder_category">
                     <span class="category_name">
                     <i class="fas fa-folder"></i>
                     ??????
                     </span>
                     <i class="fas fa-angle-down toggle" style="color:black"></i>
                 </div>

                  <div class="folder_items">
                     <div class="folder_item">????????????</div>
                     <sec:authorize access="hasRole('ROLE_ADMIN')">
                     <div class="folder_item"><a href="${pageContext.request.contextPath}/board/accusation">??????</a></div>
                     </sec:authorize>
                 </div>
             </div>
         </div>
     </div>

      <div class="leftside_container">
         <div class="cotainer_title">?????? ??????</div>
         <!--??????-->
         <div class="cotainer_items">

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cRList[0].profile_src}"/>
                     <div class="profile_id">${cRList[0].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[0].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cRList[1].profile_src}"/>
                     <div class="profile_id">${cRList[1].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[1].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cRList[2].profile_src}"/>
                     <div class="profile_id">${cRList[2].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[2].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cRList[3].profile_src}"/>
                     <div class="profile_id">${cRList[3].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[3].content}</div>
             </div>

             <div class="comment">
                 <div class="comment_profile">
                     <img class="profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cRList[4].profile_src}"/>
                     <div class="profile_id">${cRList[4].user_id}</div>
                 </div>
                 <div class="comment_content">${cRList[4].content}</div>
             </div>

         </div>
     </div>
     
     <!-- ?????? -->
     <input type="button" value="??????" onclick="openchat()">
	<script>
	function openchat(){
	    var popup = window.open('${pageContext.request.contextPath }/chat_main', '????????????', 'width=400px,height=700px,scrollbars=no,location=no');
	}
	</script>
     <!-- ?????? -->
    	
     <div class="dropdown-area">
        <div class="notify-button">
	          <ul class="notify-area">
	          <sec:authorize access="isAnonymous()">
	          	<li>???????????? ???????????????.</li>
	          </sec:authorize>
	          <sec:authorize access="isAuthenticated()">
	          </sec:authorize>
	          </ul>
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#757575" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
          
          <sec:authorize access="isAuthenticated()">
          <div class="notify-cnt"></div>
          </sec:authorize>   
        </div>
      </div>
</aside>      
      
<script type="text/javascript">
let notifyButton = document.querySelector(".notify-button");
let notifyArea = document.querySelector(".notify-area");

const ShowDropdown = () => {
  notifyButton.classList.add("#active");
  notifyArea.style.visibility = "visible";
  notify_list();
}
function notify_list(){
	$(".notify-area").empty();
	
	 $.ajax({
			url:"${cp}/notiShow",
			dataType:'json',
			success:function(data){
				console.log(data);
				if(data.list=='login'){
					$(".notify-area").html("<li>???????????? ???????????????.</li>");
					return;
				}
				if(data.list=='good'){
					$(".notify-area").html("<li>????????? ????????????.</li>");
				}else{
				$(".notify-area").append("<li style='text-align: center'><button class='w-btn w-btn-indigo' onclick='delAll();'>????????????</button></li>");
				$(data.list).each(function(i,d){
					let notify_id=d.notify_id;
					let sender_id=d.sender_id;
					let notify_type=d.notify_type;
					let type="";
					if(notify_type==1){
						type=" ????????? ?????? ????????? ??????????????????."
					}
					if(notify_type==2){
						type=" ????????? ????????? ????????? ??????????????????."
					}
					if(notify_type==3){
						type=" ?????? ??? ??? ????????? ???????????? ???????????????."
					}
					let html="<li>"+sender_id+"??????"+type+" <button class='w-btn w-btn-indigo' onclick='removeNoti("+ notify_id +")' >??????</button><li>"
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
			notify_list();
			notiCnt();
		}
	});
}
function delAll(){
	$.ajax({
		url:'${cp}/notiDel',
		success:function(data){
			notify_list();
			notiCnt();
		}
	});
}
function notiCnt(){
	$(".notify-cnt").empty();
	$.ajax({
		url:'${cp}/noti/count',
		dataType:'json',
		success:function(data){
				$(".notify-cnt").html(data.noticount);
			}
		});
	}
$(document).ready(function(){
	notiCnt();
});

</script>
