<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<title>글쓰기</title>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
</head>
<body>

<div class="board_title">
    <h4>${category_str} 게시판</h4>
</div>

<div class="post_detail" style="padding: 20px">
	<form:form method="post" action="${pageContext.request.contextPath}/board/insert">
		<select name="subcate">
			<option value="2">파티찾기</option>
			<option value="3">자유</option>
		</select>
		<input type="hidden" name="user_id" value="${user_id}"/><br>
		<input type="hidden" name="category_id" value="${category}"/><br>
		<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<textarea id="summernote" name="content" style="margin-bottom: 20px"></textarea>
		<div style="width: 100%; text-align: right">
			<input id="subBtn" type="button" value="작성" style="border:1px solid #b8b8b8; border-radius: 5px;margin: 10px 0; cursor: pointer;font-size:12px;font-weight: 600 " onclick="goWrite(this.form)"/>
		</div>
		
	</form:form>
</div>

<script>

$(document).ready(function() {

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
        });

</script>

<script type="text/javascript">

function goWrite(frm) {
	var title = frm.title.value;
	var user_id = frm.user_id.value;
	var content = frm.content.value;
	var category = frm.category_id.value;
	var subcate = frm.subcate.value;
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
</body>
</html>