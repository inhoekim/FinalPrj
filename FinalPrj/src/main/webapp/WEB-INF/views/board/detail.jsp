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
						var date = new Date(created_day);
					
						let html="<div id='comm"+comment_id+"'>";
						html+= user_id+"<br>";
						html+= content+"<br>";
						html+= date.getFullYear()+
				          "/"+(date.getMonth()+1)+
				          "/"+date.getDate()+
				          " "+date.getHours()+
				          ":"+date.getMinutes()+
				          ":"+date.getSeconds()+"<br>";
						html+="<input type='button' value='삭제' onclick='removeComm("+ comment_id +")'>";
						html+="<input type='button' value='수정'  onclick='updateForm("+ comment_id +")'>";
						html+="<input type='button' value='답글'  onclick='replyForm("+ comment_id +")'>";
						html+="<div>";
						html+="<div id='rereply_write"+comment_id+"' style='display:none;'>";
						html+="<input type='text' id='input_rereply"+comment_id+"' placeholder='댓글입력'><br>";
						html+="<button type='button' id='rereplyBtn' comment_id='"+comment_id+"' post_id='"+post_id+"'>답글달기</button>";
						html+="</div>";
						$("#commList").append(html);
					});
				}
			});
	 });
	function list(){
		$("#commList").empty();
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
					var date = new Date(created_day);
				
					let html="<div id='comm"+comment_id+"'>";
					html+= user_id+"<br>";
					html+= content+"<br>";
					html+= date.getFullYear()+
			          "/"+(date.getMonth()+1)+
			          "/"+date.getDate()+
			          " "+date.getHours()+
			          ":"+date.getMinutes()+
			          ":"+date.getSeconds()+"<br>";
					html+= "<input type='button' value='삭제' onclick='removeComm("+ comment_id +")'>";
					html+="<input type='button' value='수정'  onclick='updateForm("+ comment_id +")'>";
					html+="<input type='button' value='답글'  onclick='replyForm("+ comment_id +")'>";
					html+="<div>";
					html+="<div id='rereply_write"+comment_id+"' style='display:none;'>";
					html+="<input type='text' id='input_rereply"+comment_id+"' placeholder='댓글입력'>";
					html+="<button type='button' id='rereplyBtn' comment_id='"+comment_id+"' post_id='"+post_id+"'>답글달기</button>";
					html+="</div>";
					$("#commList").append(html);
				});
			}
		});
	}
	 $(document).on("click","#rereplyBtn",function(){ 
		 let comment_id=$(this).attr("comment_id");
		 let content=$("#input_rereply"+comment_id).val();
		 $.ajax({
			 url:'${cp}/commrereply',
			 data:{
				 'comment_id':comment_id,
				 'content':content,
				 'post_id':${vo.post_id}
			 },
			 success:function(data){
				 list();
			 }
		 });		 
	
	 });	
	function replyForm(comment_id){
		var rere = document.getElementById("rereply_write"+comment_id);
		rere.style.display='block';
	}
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
	function updateForm(comment_id){
		$.ajax({
			url:'${cp}/selComm',
			type:'get',
			dataType:'json',
			data:{
				"comment_id":comment_id
			},
			success:function(data){
				$("#comm"+comment_id).empty();
				let html="<input type='text' id='input_update"+comment_id+"' value='"+data.content+"'>";
				html+="<button type='button' id='updateBtn' comment_id='"+comment_id+"' post_id='"+post_id+"'>수정완료</button>";
				$("#comm"+comment_id).append(html);
			}
		});
		
	}		
	$(document).on("click","#updateBtn",function(){ 
		let comment_id=$(this).attr("comment_id");
		let content=$("#input_update"+comment_id).val();
		 console.log(content);
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
	$("#replyBtn").click(function(){
		$.ajax({
			url:'${cp}/commInsert',
			data:{
				post_id:${vo.post_id},user_id:"${vo.user_id}",content:$("#input_reply").val()
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
						console.log(data.count);
						$("#comCnt").empty();
						$("#comCnt").html("&nbsp;&nbsp;"+data.count);
						list();
						$("#input_reply").val("");
					}
				});
			}
		});
	
	});
	
	

</script>
</body>
</html>