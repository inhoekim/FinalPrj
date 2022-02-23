<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="cp" value="${pageContext.request.contextPath}"/>

<div class="board_title">
    <h4>${category_str[category]} 게시판</h4>
</div>

<div class="post_detail">
    <div class="post_title">
        <span class="classification">${subcate_str[postVo.subcate]}</span>
        <span class="title">${postVo.title }</span>
    </div>

    <div class="post_profile">
        <div class="mainInfo">
            <div class="writer"><img class="writer_profile" src="${cp}/resources/img/profile/${postVo.post_profile}"><span style="font-weight: 600">${postVo.user_id }</span></div>
            <span style="margin-left: 10px"><fmt:formatDate value="${postVo.created_day}" pattern="yyyy-MM-dd HH:mm"/></span>
        </div>

        <div class="otherInfo">
            <span>조회수 ${postVo.hit}</span>
            <span>하트 ${postVo.voCnt}</span>
            <span>댓글 ${postVo.comCnt}</span>
        </div>
    </div>

    <div class="post_content">
        ${postVo.content}
    </div>

    <div class="interaction">
        <div class="likeBox">
            <div class="likeVote"><i class="fas fa-heart like" style="margin-right: 5px;"></i>좋아요 <span class="like_cnt">${postVo.voCnt}</span></div>
            <div class="like_detailBox">
                <i class="fas fa-user profile_img"></i>
                	<c:choose>
					 	<c:when test="${empty profiles}">
					 		<span>추천이 존재하지 않습니다</span>
					 	</c:when>
						<c:otherwise>
							<span><b>${profiles[0].user_id}</b>님 포함 <span style="color:#e67979"> ${fn:length(profiles)}</span>명이 추천</span>
						</c:otherwise>
					</c:choose>
            </div>
        </div>
		
		<div class="otherInteraction">
			<c:choose>
			<c:when test="${not empty myProfile && myProfile.user_id eq postVo.user_id}">
		        <a class="inter_update" onclick="postUpdate()">
		            <span class="accusation_word">수정</span>
		            <i class="fa-solid fa-pencil"></i>
		        </a>
		        
		        <a class="inter_delete" href="${cp}/post/delete?post_id=${postVo.post_id}">
		            <span class="accusation_word">삭제</span>
		            <i class="fa-solid fa-trash-can"></i>
		        </a>
	        </c:when>
	        <c:otherwise>        
		        <div class="accusation" onclick="logincheck(event)">
		            <div class="accusation_word">신고</div>
		            <i class="fa-solid fa-triangle-exclamation"></i>
		        </div>
	        </c:otherwise>
	        </c:choose>
        </div>
    </div>

    <div class="like_detail_wrapper">
        <div class="like_detail">
        	<c:forEach var="vo" items="${profiles}">
        		<div class="detail">
                	<img class="writer_profile" src="${cp}/resources/img/profile/${vo.src_name}"/>
                	<span style="margin-top: 3px;">${vo.user_id}</span>
            	</div>   
        	</c:forEach>
        </div>
    </div>

    <div class="commentBox">
        <div class="commentBox_title">댓글<span id="span_comm" style="color : #e67979; margin-left: 5px;">${postVo.comCnt}</span></div>
        <div class="commentBox_content">
        	<div id="taget_box">
        	
        		<!--  댓글 템플릿
	            <div class="comment">
	                <img class="writer_profile" src="profile/woman1-32.png">
	                <div class="comment_wrapper">
	                    <div class="content_header">
	                        <span style="margin-right: 10px"><b>${user_id}</b></span>
	                        <span style="color: darkgray">${timestamp}</span>
	                    </div>
	                    <div class="content_main">
	                        ${comment_content}
	                    </div>
	                    <div class="content_interaction">
	                        <div class="recomment">답글</div>
	                        <div class="likeButton"><i class="fas fa-heart" style="color: #e67979;margin-right: 3px;font-size: 12px;"></i><span class="like_cnt" style="font-size: 12px; margin: 0;">188</span></div>
	                    </div>
	                </div>
	            </div>
	             -->	            
            </div>
          	
          	<div class="comment">
          	    <sec:authorize access="isAuthenticated()">
          			<sec:authentication property="principal.username" var="currentUserName"/>
          			<img class="writer_profile" src="${cp}/resources/img/profile/${myProfile.src_name}">
          			<div class="comment_wrapper">
          				<textarea class="comment_inputBox" placeholder="댓글 내용을 입력해주세요."></textarea>
          				<div class="button_wrapper">
          					<button class="comment_button">등록</button>
          				</div>
          			</div>	
          		</sec:authorize>
          		
          		<sec:authorize access="isAnonymous()">
          			<i class="fas fa-user writer_profile" style="display: flex;justify-content: center;line-height: 40px;color: gray;width: 40px;height: 40px;font-size: 25px;margin-right: 10px;"></i>
          			<div class="comment_wrapper">
	          			<textarea class="comment_inputBox" placeholder="댓글등록은 로그인 후 이용 가능합니다." disabled></textarea>
	          		</div>
          		</sec:authorize>
          	</div>  
        </div>
    </div>
</div>


<div class="board_topbar">
    <div class="topbar_title">
        <div class="topbar_classification">분류: ${subcate_str[subcate]}</div>
        <i class="fas fa-angle-down toggle"></i>
    </div>
    <div class="topbar_content">
        <div class="content_wrapper">
            <a href="${cp}/board/list?category=${category}&subcate=0">전체</a>
            <a href="${cp}/board/list?category=${category}&subcate=1">공지</a>
            <a href="${cp}/board/list?category=${category}&subcate=2">파티찾기</a>
            <a href="${cp}/board/list?category=${category}&subcate=3">자유</a>
            <a href="${cp}/board/list?category=${category}&subcate=4">신고</a>
        </div>

    </div>
</div>

<div class="table_wrapper">
    <table class="board_table">
        <thead>
       		<tr style="height: 40px;">
                <th>번호</th>
                <th style="width:60px">분류</th>
                <th style="width: 50%">제목</th>
                <th class="th_writer">글쓴이</th>
                <th>날짜</th>
                <th>조회수</th>
                <th>추천수</th>
            </tr>
        	
        </thead>

		<tbody>
			<c:forEach var="vo" items="${notice}">
				<tr class="notice">
	                <td><div>${vo.post_id}</div></td>
	                <td><div>공지</div></td>
	                <td class="td_title">
	                    <div class="title">
	                        <a href="${cp}/board/detail?post_id=${vo.post_id}&category=${category}&pageNum=${pu.pageNum}&subcate=${subcate}">${vo.title}</a>
	                    </div>
	                    <div class="commentNum">${vo.comCnt}</div>
	                </td>
	                <td>
	                    <div class="writer">
	                        <img class="writer_profile" style="background-color: #817e7e36;" src="${cp}/resources/img/ott_logos/${admin_profile}">
	                        <span>admin</span>
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${vo.hit}</div></td>
	                <td><div>${vo.voCnt}</div></td>
            	</tr>
			</c:forEach>
			
			<c:forEach var="vo" items="${list}">
				<tr>
	                <td><div>${vo.post_id}</div></td>
	                <td><div>${subcate_str[vo.subcate]}</div></td>
	                <td class="td_title">
	                    <div class="title">
	                        <a href="${cp}/board/detail?post_id=${vo.post_id}&category=${category}&pageNum=${pu.pageNum}&subcate=${subcate}">${vo.title}</a>
	                    </div>
	                    <div class="commentNum">${vo.comCnt}</div>
	                </td>
	                <td>
	                    <div class="writer">
	                   		<img class="writer_profile" style="background-color: #817e7e36;" src="${cp}/resources/img/profile/${vo.post_profile}">
	                        <span>${vo.user_id}</span>
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${vo.hit}</div></td>
	                <td><div>${vo.voCnt}</div></td>
            	</tr>
			</c:forEach>
      </tbody>
    </table>
</div>

<div class="board_bottomBar">
    <form action="${cp}/board/list">
        <div class="searchBar">
            <select class="searchBar_select" name="field">
                <option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
                <option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
                <option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
                <option value="ticon" <c:if test="${field=='ticon'}">selected</c:if>>제목+내용</option>
            </select>
            <input type="text" class="searchBar_input" name="keyword" value="${keyword}">
            <input type="hidden" name="category" value="${category}">
            <input type="hidden" name="subcate" value="${subcate}">
            <button class="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
    <a class="writeButton" href="${cp}/board/insert?category=${category}"><i class="fa-solid fa-pencil"></i><span style="font-size: 12px; margin-left: 3px;">쓰기</span></a>
</div>

<div class="pagination_wrapper">	
<div class="pagination">
	<a href="${cp}/board/list?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}">이전</a>
	<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
	<c:choose>
	 	<c:when test="${i==pu.pageNum}">
	 		<a href="${cp}/board/list?pageNum=${i}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}"><span style="color:#e67979">${i}</span></a>
	 	</c:when>
		<c:otherwise>
			<a href="${cp}/board/list?pageNum=${i}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}"><span style="color:gray">${i}</span></a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<a href="${cp}/board/list?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}&category=${category}&subcate=${subcate}">다음</a>
</div>
</div>

<div id="accWrapper" class="hidden">
  <div class="emphasized_div">
   	<div class="top_bar">
   		<div style="display:flex; align-content: center;line-height: 10px">
   			<img src="${cp}/resources/img/warning_red-24.png" style="width:26px;height:26px;">
   			<h3>신고</h3>
   		</div>
   		
   		<div id="cancle" class="cancle" style="display: inline-block">
   			<img src="${pageContext.request.contextPath}/resources/img/close-24.png" style="width:12px; height: 12px">
   		</div>
   	</div>
   	
   	<form:form method="post" action="${pageContext.request.contextPath }/board/report" class="acc_form">   	
       	<div>
	       	<label for="acc_select">신고종류</label>
	       	<select id="acc_select" class="acc_select" name="why">
	            <option value="0">혐오발언</option>
	            <option value="1">음란물게시</option>
	            <option value="2">광고</option>
	            <option value="3">기타</option>
	        </select>
       	</div>

        <div>대상자 : <b>${postVo.user_id}</b></div>
        
        <div>
        	<label for="acc_title">신고글(제목)</label>
        	<input id="acc_title" type="text" name="title">
        </div>
        
        <div>
        	<label for="acc_content">내용</label>
        	<textarea id="acc_content" name="content" style="margin: 10px 0;"></textarea>
        </div>
       
        <input type="hidden" name="user_id" value="${myProfile.user_id}">
		<input type="hidden" name="target_id" value="${postVo.user_id}">
		<input type="hidden" name="post_id" value="${postVo.post_id}">
		<input type="hidden" name="pageNum" value="${pu.pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
		<input type="hidden" name="category" value="${category}">
		<input type="hidden" name="subcate" value="${subcate}">
		<button class="acc_button">신고</button>
    </form:form>
  </div>
</div>


<script>
//댓글 로딩 함수
function list(){
	$("#taget_box").empty();
	$.ajax({
		url:"${cp}/commList",
		data:{"post_id":${postVo.post_id}},
		dataType:'json',
		success:function(data){
			$(data.list).each(function(i,d){
				let comment_id=d.comment_id;
				let content=d.content;
				let deleted_str = "<span style='color:grey'><strike>삭제된 댓글입니다</strike></span>";
				let flag = true ;
				if(content == deleted_str) {flag = false;}
				let user_id=d.user_id;
				var date = new Date(d.created_day);
				let created_day = new String(date.getFullYear()).slice(-2) + "." + (date.getMonth()+1) + "." + date.getDate() 
					+ " " + ('0' + date.getHours()).slice(-2) + ":" + ('0' + date.getMinutes()).slice(-2);
				let parent_id=d.parent_id;
				let cvoCnt =d.cvoCnt;
				let profile_src = d.profile_src;
				
				let html = "";
				if(parent_id!=null){
					html+="<div class='comment' id='comm"+comment_id+"' style='border-top: none;'>";
				}else {
					html="<div class='comment' id='comm"+comment_id+"'>";
				}
				html+= "<img class='writer_profile' src='${cp}/resources/img/profile/"+ profile_src +"'>";
				html+= "<div class='comment_wrapper'><div class='content_header'>";
				if(parent_id!=null){
					html+= "<span style='margin-right: 10px'><b>@" + parent_id + "</b></span>";		
				}
				html+= "<span style='margin-right: 10px' class='comment_userid'><b>" + user_id + "</b></span>";
				html+= "<span style='color: darkgray'>" + created_day + "</span></div>";
				html+= "<div class='content_main'>" + content + "</div>";
				
				if(flag) {
					html+= "<div class='content_interaction'>";
					if(user_id == "${myProfile.user_id}") {html+= "<div class='left_wrapper'><div class='update_comment' onclick='updateForm("+ comment_id +")'>수정</div><div class='delete_comment' onclick='removeComm("+ comment_id +")'>삭제</div></div>";}
					else{html+= "<div class='recomment' onclick='replyForm(event)';>답글</div>"}
					html+= "<div class='likeButton'><i class='fas fa-heart' style='position:relative;top:2px;color: #e67979;margin-right: 3px;font-size: 12px;'></i><span class='like_cnt' style='font-size: 12px; margin: 0;'>";
					html+= cvoCnt + "</span></div></div></div></div>";
				}
				$("#taget_box").append(html);
			});
		}
	});
}
//댓글삭제
function removeComm(comment_id){
	console.log(comment_id);
	$.ajax({
		url:'${cp}/commRemove',
		data:{
			"comment_id":comment_id
		},
		success:function(data){
			list();
		}
	});
};
//댓글 업데이트
function updateForm(comment_id){
	$.ajax({
		url:'${cp}/selComm',
		type:'get',
		dataType:'json',
		data:{
			"comment_id":comment_id
		},
		success:function(data){
			$("#comm"+comment_id).children(".comment_wrapper").children(".content_main").remove();
			$("#comm"+comment_id).children(".comment_wrapper").children(".content_interaction").remove();
			let html = "<textarea class='comment_inputBox' style='margin-top:20px'>" + data.content + "</textarea>";
			$("#comm"+comment_id).children(".comment_wrapper").append(html);
			html = "<div class='button_wrapper'><button id='update_button' class='comment_button' comment_id='"+comment_id+"'>수정</button></div>";
			$("#comm"+comment_id).children(".comment_wrapper").append(html);
		}
	});
}
//대댓글 폼
function replyForm(event){
	if(${empty myProfile.user_id}) {
		alert("로그인 후 이용 가능합니다");
		return ;
	}
	$(".replyForm").remove();
	let html = "<div class='comment replyForm' style='margin: 10px'>";
	html += "<img class='writer_profile' src='${cp}/resources/img/profile/${myProfile.src_name}'>";
	html += "<div class='comment_wrapper'>";
	html += "<textarea class='comment_inputBox reply_txt' placeholder='댓글 내용을 입력해주세요.''></textarea>"
	html += "<div class='button_wrapper'><button class='recomment_confirm'>등록</button></div>";
	html += "</div>";
	$(event.target).closest(".comment_wrapper").append(html);
}
//로그인체크 
function logincheck(event){
	if(${empty myProfile.user_id}) {
		alert("로그인 후 이용 가능합니다");
		event.stopImmediatePropagation();
		return;
	}
};
//서머노트 로딩
function note_load(){
	var toolbar = [
	    // 글꼴 설정
	    ['fontname', ['fontname']],
	    // 글자 크기 설정
	    ['fontsize', ['fontsize']],
	    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	    // 글자색
	    ['color', ['forecolor','color']],
	    // 표만들기
	    ['table', ['table']],
	    // 글머리 기호, 번호매기기, 문단정렬
	    ['para', ['ul', 'ol', 'paragraph']],
	    // 줄간격
	    ['height', ['height']],
	    // 그림첨부, 링크만들기, 동영상첨부
	    ['insert',['picture','link','video']],
	    // 코드보기, 확대해서보기, 도움말
	    ['view', ['codeview','fullscreen', 'help']]
	  ];

var setting = {
           height : 300,
           minHeight : null,
           maxHeight : null,
           focus : true,
           lang : 'ko-KR',
           toolbar : toolbar,
           callbacks : { //여기 부분이 이미지를 첨부하는 부분
           onImageUpload : function(files, editor,
           welEditable) {
           for (var i = files.length - 1; i >= 0; i--) {
           uploadSummernoteImageFile(files[i],
           this);
           		}
           	}
           }
        };

       $('#summernote').summernote(setting);
       
       function uploadSummernoteImageFile(file, el) {
       	var token = $("meta[name='_csrf']").attr("content");
   		var header = $("meta[name='_csrf_header']").attr("content");
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
				xhr.setRequestHeader(header, token);
            },
			type : "POST",
			url : "${cp}/uploadSummernoteImageFile",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				console.log(data.url);
				$(el).summernote('editor.insertImage', data.url);
			}
		});
	}
}

//글수정 버튼
function postUpdate(){
	let html = '<form id="helpme" method="post" action="${pageContext.request.contextPath}/post/update">';
	html += '<input type="hidden" name="post_id" value="${postVo.post_id}">';
	html += '<input type="hidden" name="category_id" value="${postVo.category_id}">';
	html += '<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>';
	html += '<div style="width: 100%; text-align: right">';
	html += '<input type="submit" value="수정" style="border:1px solid #b8b8b8; border-radius: 5px;margin: 10px 0; cursor: pointer;font-size:12px;font-weight: 600 ">';
	html += '</div>';
	html += '</form>';
	$(".post_content").empty().append(html);
	$('<textarea id="summernote" name="content" style="margin-bottom: 20px"></textarea>').html("${postVo.content}")
	.prependTo("#helpme");
	note_load();
}

//업데이트 완료 버튼
$(document).on("click","#update_button",function(){ 
	let comment_id=$(this).attr("comment_id");
	let content=$(this).parent().siblings(".comment_inputBox").val();
	 $.ajax({
		 url:'${cp}/commupdate',
		 data:{
			 'comment_id':comment_id,
			 'content':content
		 },
		 success:function(data){
			 list();
		 }
	 });		
});	
// 댓글 좋아요 기능
$(document).on("click",".likeButton",function(){
	if(${empty myProfile.user_id}) {
		alert("로그인 후 이용 가능합니다");
		return ;
	}	
	let comment_id= new String($(this).closest(".comment").attr("id")).substr(4);
	$.ajax({
		 url:'${cp}/insertCommLike',
		 data:{
			 'comment_id':comment_id
			  },
		 success:function(data){
			 list();
		 }
	 });		
 });

//대댓글 입력확인 버튼 이벤트
$(document).on("click",".recomment_confirm",function(){
	let comment_id = new String($(this).closest(".comment").parent().closest(".comment").attr("id")).substr(4);
	let content = $(".reply_txt").val();
	let parent_id = $(this).closest(".comment").siblings(".content_header").children(".comment_userid").text();
	
	console.log($(this).closest(".comment").closest(".comment"));
	
	$.ajax({
	 url:'${cp}/commrereply',
	 data:{
		 'comment_id': comment_id,
		 'content': content,
		 'post_id': ${postVo.post_id},
		 'parent_id': parent_id	 	
	 },
	 success:function(data){
		 list();
	 }
	});		 

});	



$(function(){
	list();
	//좋아요 버튼 이벤트
	$(".likeVote").click(function(){
		if(${empty myProfile.user_id}) {
			alert("로그인 후 이용 가능합니다");
			return ;
		}
		$.ajax({
			url:'${cp}/insertPostLike',
			type:'get',
			dataType:'json',
			data:{
				post_id:${postVo.post_id},user_id:"${postVo.user_id}"
			},
			success:function(data){
				$.ajax({
					url:'${cp}/likeCount',
					type:'get',
					dataType:'json',
					data:{
						post_id: ${postVo.post_id},
						user_id: "${postVo.user_id}"
					},
					success:function(data){
						$(".likeVote").children(".like_cnt").text(data);
					}
				});
			}
		});
	});
	//댓글 입력 버튼
	$(".comment_button").click(function(){
		$.ajax({
			url:'${cp}/commInsert',
			data:{
				post_id: ${postVo.post_id},
				user_id: "${currentUserName}",
				content: $(".comment_inputBox").val()
			},
			type:'get',
			success:function(data){
				$.ajax({
					url:'${cp}/commCount',
					type:'get',
					data:{
						post_id:${postVo.post_id},
					},
					success:function(data){
						console.log(data.count);
						$("#span_comm").empty();
						$("#span_comm").text(data.count);
						list();
						$(".comment_inputBox").val("");
					}
				});
			}
		});
	});
	
})
</script>


<script src="${cp}/resources/js/emphasize_acc.js"></script>