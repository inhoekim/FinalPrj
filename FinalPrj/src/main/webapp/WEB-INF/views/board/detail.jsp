<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

</head>
<body>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<h1>${vo.title}</h1>
<span>${vo.user_id}&nbsp;&nbsp;${vo.created_day}</span><span>&nbsp;&nbsp;${vo.hit}&nbsp;&nbsp;</span><span id="voCnt">${vo.voCnt}&nbsp;&nbsp;</span><span id="comCnt">${vo.comCnt}</span>
<div>
${vo.content}
</div>
<div id="vote">
	<button type="button" id="like">추천&nbsp;${vo.voCnt}</button>
</div>
<div id="comments">
	<div id="commList">
	
	</div>
	<div id="commInsert">
		<input type="text" id="input_reply" placeholder="댓글입력">
		<button type="button" id="replyBtn">댓글달기</button>
	</div>
</div>
<div id="delAndupd">
	<a href="${cp}/post/update?post_id=${vo.post_id}">글수정</a>
	<a href="${cp}/post/delete?post_id=${vo.post_id}">글삭제</a>
</div>
<script type="text/javascript">
	let post_id=${vo.post_id};
	$(document).ready(function () {
		$.ajax({
				url:"${cp}/commList",
				data:{"post_id":post_id},
				dataType:'json',
				success:function(data){
					$(data.list).each(function(i,d){
						let comment_id=d.comment_id;
						let content=d.content;
						let user_id=d.user_id;
						let created_day=d.created_day;
						let html="<div class='comm'>";
						html+= user_id+"<br>";
						html+= content+"<br>";
						html+= created_day+"<br>";
						html+= "<input type='button' value='삭제' onclick='removeComm("+ comment_id +")'>";
						html+="<input type='button' value='수정'  onclick='updateForm("+ comment_id +")'>";
						html+="<div>";	
						$("#commList").append(html);
					});
				}
			});
		
	  });
	function removeComm(comment_id){
		console.log(comment_id);
		$.ajax({
			url:'${cp}/commremove?comment_id='+comment_id,
			dataType:'json',
			success:function(data){
				console.log(data.code);
				list(1);
			}
		})
	}
	
	
	$("#like").click(function(){	
		$.ajax({
			url:'${cp}/insertLike',
			type:'get',
			dataType:'json',
			data:{
				post_id:${vo.post_id},user_id:"${vo.user_id}"
			},
			success:function(data){
				$.ajax({
					url:'${cp}/likeCount',
					type:'get',
					dataType:'json',
					data:{
						post_id:${vo.post_id},user_id:"${vo.user_id}"
					},
					success:function(data){
						$("#like").empty();
						$("#voCnt").empty();
						$("#like").html("추천&nbsp;"+data);
						$("#voCnt").html(data+"&nbsp;&nbsp;");
					}
				});
			}
		});
	});
	$("#cmtBtn").click(function(){
		$.ajax({
			url:'${cp}/commInsert',
			data:{
				post_id:${vo.post_id},user_id:"${vo.user_id}",content:$("#cmtTxt").val()
			},
			type:'get',
			success:function(data){
				$.ajax({
					url:'${cp}/commCount',
					type:'get',
					data:{
						post_id:${vo.post_id}
					},
					success:function(data){
						$("#comCnt").empty();
						$("#comCnt").html("&nbsp;&nbsp;"+data);
					}
				});
			}
		});
	});
	 $(document).on("click","#reply${com.comment_id}",function(){ 
		 let comment_id=$(this).attr("comment_id");
		 console.log(comment_id);
		 
	
	 });

</script>
</body>
</html>