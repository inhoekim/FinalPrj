<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-lite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/summernote/summernote-lite.css">
<!-- include summernote-ko-KR -->
<script src="${pageContext.request.contextPath}/resources/summernote/summernote-ko-KR.js"></script>
<title>글쓰기</title>

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
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile",
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
</head>
<body>
<h2 style="text-align: center;">글 작성</h2><br><br><br>

<div style="width: 60%; margin: auto;">
	<form method="post" action="${pageContext.request.contextPath}/board/insert">
		<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
		<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
		<br><br> 
		<textarea id="summernote" name="content"></textarea>
		<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite(this.form)"/>
	</form>
</div>
<script type="text/javascript">

function goWrite(frm) {
	var title = frm.title.value;
	var writer = frm.writer.value;
	var content = frm.content.value;
	
	if (title.trim() == ''){
		alert("제목을 입력해주세요");
		return false;
	}
	if (writer.trim() == ''){
		alert("작성자를 입력해주세요");
		return false;
	}
	if (content.trim() == ''){
		alert("내용을 입력해주세요");
		return false;
	}
	frm.submit();
}
</script>
<a href="${pageContext.request.contextPath}/board/list">글조회</a>
</body>
</html>