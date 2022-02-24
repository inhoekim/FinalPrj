<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<title>채팅창</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<!--  
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/js/jquery-ui.css">
-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Hahmlet:wght@500;600;700&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<!-- 알림버튼관련 
<link href="${pageContext.request.contextPath }/admin/css/sb-admin-2.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
-->

<style>
	* {
		font-family: 'Stylish', sans-serif;
	}
	#tabs{
	 	width:400px;
	 	height:690px;
	 	overflow:scroll;
	 	overflow-x:hidden;
	}
	.member{
		position:relative;
		width:340px;
		height:80px;
		border-bottom: 1px solid gray;
		padding:10px;
		display:flex;
		flex-direction:row;
	}
	.memtitle{
		position:relative;
		left:10px;
		font-size:20px;
	}
	.memimg{
	/*
		position: absolute;
		top:10px;
		left:10px;
		*/
		width:50px;
		height:50px;
		margin-right:10px;
		border-radius: 10px;
	}
	.name{
	/*
		position: absolute;
		top:20px;
		left:120px;
		*/
		font-size:15px; 
		font-weight:bold;
	}
	/*
	.cmscname{
		//position: absolute;
		//top:60px;
		//left:120px;
		
		font-size:12px;
	}
	
	.mycmscname{
		font-size:12px;
		width:200px;
	}
	.cmschangimg{
		position:absolute;
		right:40px;
		top:42px;
		width:20px;
		height:20px;
	}
	*/
	.buddytitle{
		margin-top:50px;
		position:relative;
		left:10px;
		font-size:20px;
	}
	.buddy{
		position:relative;
		width:340px;
		height:80px;
		display:flex;
		flex-direction:row;
		padding:10px;
	}
	
	.buddy_text {
		width:186px;
		display:block;
		margin-right:10px;
	}
	.cr_name{
		position:relative;
		font-weight:bold;
		font-size:12px;
		overflow: hidden; 
  		text-overflow: ellipsis;
  		white-space: nowrap;
	}
	.cnt{
		position: absolute;
		top:15px;
		right:80px;
		font-size:12px;
		color:gray;
	}
	.buddy_more {
		width:12px;
		height:12px;
		position:relative;
		
	}
	#moreContent{
		display:block;
	    position:absolute;
	    background-color:#E8E8E8;
	    align:right;
	    z-index:10;
	    top:25px;
	    right:10px;
	}
	#delbuddy{
    	display:none;
	}
	#newchat{
    	display:none;
	}
	.moreDetail a {
		line-height:22px;
	}
	#more{
	    position:relative;
	    margin-left:auto;
	}
	.cr_msgshottime{
		position:absolute;
		top:15px;
		right:10px;
		font-size:12px;
		color:gray;
	}
	.cr_msgmessage{
		position:relative;
		font-size:10px;
	}
	.cr_noread{
		position:absolute;
		right:15px;
		top:50px;
		font-size:12px;
		font-weight:bold;
		color:red;
	}
</style>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">문의하기</a></li>
    <li id="tabreload"><a href="#tabs-2">채팅목록</a></li>
  </ul>
  <div id="tabs-1">
  	<p class="memtitle">프로필</p>
   	<div class="member">
   	<!-- 이미지가 null일떄 -->
   	<c:choose>
		<c:when test="${vo.profile_id eq null }">
			<img src="${pageContext.request.contextPath }/resources/img/1.png" class="memimg">
		</c:when>
		<c:otherwise>
			<img src="${pageContext.request.contextPath }/resources/img/profile/${vo.org_name}" class="memimg">
 		</c:otherwise>
	 </c:choose>
   		<div class="buddy_text">
	   		<p class="name">${vo.name }</p>
   		</div>
   		<!-- 파라미터 넘기기 -->
   		<input type="hidden" id="user_id" value="${vo.user_id }">
   		<input type="hidden" id="profile_id" value="${vo.profile_id }">
   		<input type="hidden" id="name" value="${vo.name }">
   	</div>
   	
   	<p class="buddytitle">Q&A</p>
   	<c:forEach var="vo" items="${list }" varStatus="status">
		<div class="buddy">
			<c:choose>
				<c:when test="${vo.profile_id eq null }">
					<img src="${pageContext.request.contextPath }/resources/img/1.jpg" class="memimg">
				</c:when>
				<c:otherwise>
					<img src="${pageContext.request.contextPath }/resources/img/profile/${vo.org_name}" class="memimg">
 				</c:otherwise>
			 </c:choose>
   			<div class="buddy_text">
	   			<p class="name">${vo.name }</p>
   			</div>
   			<img src="${pageContext.request.contextPath }/resources/img/chat/threedotsicon.svg" class="buddy_more" id="more" onclick="btnmore(${status.index})">
   			<span id="moreContent" class="moreContent_${status.index}">
    			<span class="moreDetail_${status.index}" id="newchat" onclick='room_open("${vo.user_id}")'><a href="#">&nbsp;채팅방 생성&nbsp;</a></span>
    		</span>
   		</div>	   	
   	</c:forEach>
  </div>
  <div id="tabs-2">
  	<div id="tabcontent">
  	</div>
  </div>
</div>
<script type="text/javascript">

	//2번째 탭메뉴 새로고침
	$("#tabreload").on('click',function(){
		$("#tabcontent").empty();
		chat_room();
	});

	$( "#tabs" ).tabs();
	
	var user_id=$("#user_id").val();
	var profile_id=$("#profile_id").val();
	var name=$("#name").val();
	function chat_room(){
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/chat_room1',
			data:{'user_id':user_id},
			dataType:'json',
			success:function(data){
				$(data.countlist).each(function(i,d){
						var crid=d.CRID;
						var cnt=d.CNT;
						var html="<div class='chat_room"+crid+"' ondblClick='chating("+crid+")' id='chat_room'>"+
						"<div class='roomimgbox"+crid+"'>"+
						"</div>"+
						"<div class='roombox"+crid+"'>"+
						"</div>"+
						"<div class='roommsgbox"+crid+"'>"+
						"</div>"+
						"</div>";
						
						$("#tabcontent").append(html);
						
						//인원수 주기(2명이상만)
						if(cnt > 2){
							let cnthtml="<p class='cnt'>("+cnt+")</p>"
							$(".chat_room"+crid).append(cnthtml);
						}
						
						
						//인원별 프로필
						//나는 제외하고
						if(cnt == 2){
							//상대방과 나만있을때
							let imghtml="<img src='' class='profile_"+crid+"_0'>";
							$(".roomimgbox"+crid).append(imghtml);
							$(".profile_"+crid+"_0").css({
								position:"absolute",
								width:"60px",
								height:"60px",
								borderRadius: "10px",
							});
						}/*else if(cnt == 3 || cnt==4){
							let imghtml="<img src='' class='profile_"+crid+"_0'>"+
							"<img src='' class='profile_"+crid+"_1'>";
							$(".roomimgbox"+crid).append(imghtml);
							$(".profile_"+crid+"_0").css({
								position:"absolute",
								top:"20px",
								left: "20px",
								width:"40px",
								height:"40px",
								borderRadius: "10px",
								zIndex: "2"
							});
							$(".profile_"+crid+"_1").css({
								position:"absolute",
								top:"0px",
								left: "0px",
								width:"40px",
								height:"40px",
								borderRadius: "10px",
								zIndex: "1"
							});
						}else if(cnt > 4){
							let imghtml="<img src='' class='profile_"+crid+"_0'>"+
							"<img src='' class='profile_"+crid+"_1'>"+
							"<img src='' class='profile_"+crid+"_2'>"+
							"<img src='' class='profile_"+crid+"_3'>";
							$(".roomimgbox"+crid).append(imghtml);
							$(".profile_"+crid+"_0").css({
								position:"absolute",
								top:"0px",
								left: "0px",
								width:"30px",
								height:"30px",
								borderRadius: "10px",
							});
							$(".profile_"+crid+"_1").css({
								position:"absolute",
								top:"0px",
								left: "30px",
								width:"30px",
								height:"30px",
								borderRadius: "10px",
							});
							$(".profile_"+crid+"_2").css({
								position:"absolute",
								top:"30px",
								left: "0px",
								width:"30px",
								height:"30px",
								borderRadius: "10px",
							});
							$(".profile_"+crid+"_3").css({
								position:"absolute",
								top:"30px",
								left: "30px",
								width:"30px",
								height:"30px",
								borderRadius: "10px",
							});
						}
						*/
						
						//css주기
						$(".chat_room"+crid).css({
							position:"relative",
							width:"340px",
							height:"80px"
						});
						$(".roomimgbox"+crid).css({
							position:"absolute",
							left:"10px",
							top:"10px",
							width:"60px",
							height:"60px",
							overflow:"hidden"
						});
						$(".roombox"+crid).css({
							position:"absolute",
							left:"80px",
							top:"15px",
							width: "160px",
							height:"15px",
							overflow:"hidden"
						});
						$(".roommsgbox"+crid).css({
							position:"absolute",
							left:"80px",
							top:"35px",
							width: "160px",
							height:"35px",
							overflow:"hidden"
						});
						
						chat_room2(crid);
				});
			}
		});
	}

	chat_room();
	
	//더보기버튼
	function btnmore(data) {
		//$("#moreContent").css("top",25).css("right",10);
		$(".moreContent_"+data).css("top",25);
		   if( $(".moreDetail_"+data).is(":visible")){
		        $(".moreDetail_"+data).hide();
		   }else{
		        $(".moreDetail_"+data).show();
		   }
	}
	
	function chat_room2(crid){
		$.ajax({
			type:'get',
			url:'${pageContext.request.contextPath }/chat_room2',
			data:{'user_id':user_id,'crid':crid},
			dataType:'json',
			success:function(data){
				//안읽은 메세지 개수표시(0제외)
				if(data.notread!=0){
					let notread="<p class='cr_noread'>메세지:"+data.notread+"</p>";
					$(".chat_room"+crid).append(notread);					
				}
				var htmlname="<p class='cr_name'>";
				$(data.list).each(function(i,d){
					//본인은 제외하고
					if(user_id!=d.user_id){
						//뒤에 , 붙이기
						if(i == 0){
							htmlname+=d.name;
						}else{
							htmlname+=","+d.name;
						}
						//이미지 속성넣기
						if(d.profile_id==1){
							//대체 이미지
							d.profile_id="man1-64.png";
						} else if(d.profile_id==2){
							//대체 이미지
							d.profile_id="man2-64.png";
						} else if(d.profile_id==3){
							//대체 이미지
							d.profile_id="man3-64.png";
						} else if(d.profile_id==4){
							//대체 이미지
							d.profile_id="man4-64.png";
						} else if(d.profile_id==5){
							//대체 이미지
							d.profile_id="woman1-64.png";
						} else if(d.profile_id==6){
							//대체 이미지
							d.profile_id="woman2-64.png";
						} else if(d.profile_id==7){
							//대체 이미지
							d.profile_id="woman3-64.png";
						} else if(d.profile_id==8){
							//대체 이미지
							d.profile_id="woman4-64.png";
						}
						$(".profile_"+crid+"_"+i).attr("src","${pageContext.request.contextPath }/resources/img/profile/"+d.profile_id);
					}
				});
				htmlname+="</p>"
				$(".roombox"+crid).append(htmlname);
				//최근 대화내역 출력
				$(data.list2).each(function(i,d){
					if(d.msgmessage!=null){
						let msgshottime="<p class='cr_msgshottime'>"+d.msgshottime+"</p>";
						let msgmessage="<p class='cr_msgmessage'>"+d.msgmessage+"</p>";
						$(".chat_room"+crid).append(msgshottime);
						$(".roommsgbox"+crid).append(msgmessage);
					}
				});
			}
		});
	}
	//드래그 방지
	$(document).on("selectstart", function(event){return false;});
	
	//기존 방 열기
	function chating(crid){
		var url='${pageContext.request.contextPath }/chating_room?crid='+crid+'&user_id='+user_id+'&profile_id='+profile_id+'&name='+name;
		location.href=url;
	}
	
	//친구아이디로 확인하여 방이 있는지 여부 체크 후 채팅창 열기
	function room_open(cbbuid){
		var url='${pageContext.request.contextPath }/chating_check?cbbuid='+cbbuid+'&user_id='+user_id+'&profile_id='+profile_id+'&name='+name;
		location.href=url;
	}
	
	//마우스 이벤트
	$(document).on("mouseenter",".buddy",function(){
		$(this).css({
			background: "#EAEAEA"
		});
	});
	$(document).on("mouseleave",".buddy",function(){
		$(this).css({
			background: "none"
		});
	});
	$(document).on("mouseenter","#chat_room",function(){
		$(this).css({
			background: "#EAEAEA"
		});
	});
	$(document).on("mouseleave","#chat_room",function(){
		$(this).css({
			background: "none"
		});
	});

</script>
