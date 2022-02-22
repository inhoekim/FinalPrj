<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="board_title">
    <h4>신고 게시판</h4>
</div>

<div class="table_wrapper">
    <table class="board_table">
        <thead>
       		<tr style="height: 40px;">
                <th>번호</th>
                <th style="width:80px">사유</th>
                <th style="width: 50%">제목</th>
                <th class="th_writer">글쓴이</th>
                <th class="th_writer">신고대상</th>
                <th style="width:60px">날짜</th>
                <th style="width:80px">처리내역</th>
            </tr>
        	
        </thead>

		<tbody>			
			<c:forEach var="vo" items="${list}">
				<tr>
	                <td><div class="acc_id">${vo.accusate_id}</div></td>
	                <td><div>${acc_str[vo.why]}</div></td>
	                <td class="td_title">
	                    <div class="title" onclick="accAjax(event)">
	                        <span>${vo.title}</span>
	                    </div>
	                </td>
	                <td>
	                    <div class="writer">
	                    	<img class="writer_profile" style="background-color: #817e7e36;" src="${pageContext.request.contextPath}/resources/img/profile/${vo.my_profile}">
	                        ${vo.user_id}
	                    </div>
	                </td>
	                <td>
	                    <div class="writer">
	                    	<img class="writer_profile" style="background-color: #817e7e36;" src="${pageContext.request.contextPath}/resources/img/profile/${vo.target_profile}">
	                        ${vo.target_id}
	                    </div>
	                </td>
	                <td><div><fmt:formatDate value="${vo.created_day}" pattern="yy.MM.dd"/></div></td>
	                <td><div>${result_str[vo.result]}</div></td>
            	</tr>
			</c:forEach>
      </tbody>
    </table>
</div>

<div class="board_bottomBar">
    <form action="${pageContext.request.contextPath}/board/accusation">
        <div class="searchBar">
            <select class="searchBar_select" name="field">
                <option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
                <option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
            </select>
            <input type="text" class="searchBar_input" name="keyword" value="${keyword}">
            <button class="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
</div>

<div class="pagination_wrapper">	
<div class="pagination">
	<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${pu.startPageNum-1}&field=${field}&keyword=${keyword}">이전</a>
	<c:forEach var="i" begin="${pu.startPageNum}" end="${pu.endPageNum}">
	<c:choose>
	 	<c:when test="${i==pu.pageNum}">
	 		<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:#e67979">${i}</span></a>
	 	</c:when>
		<c:otherwise>
			<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${i}&field=${field}&keyword=${keyword}"><span style="color:gray">${i}</span></a>
		</c:otherwise>
	</c:choose>
	</c:forEach>
	<a href="${pageContext.request.contextPath}/board/accusation?pageNum=${pu.endPageNum+1}&field=${field}&keyword=${keyword}">다음</a>
</div>
</div>

<script>
function accAjax(event){
	let ACCUSATE_ID = $($(event.target).closest("tr")).find(".acc_id").text();
	$.ajax({ 
		url: getCp() + "/board/accusation/judge/" + ACCUSATE_ID,
		type: "get",
		dataType: "json",
		success: function(data){

			$(".judgeBox_Wrapper").remove();
			$("<form class='judgeBox_Wrapper' method='post' action='${pageContext.request.contextPath}/enrollBlack'>" + 
			"<div class='judgeBox'></div><input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/></form>")
			.appendTo("body").css({
				"top": event.pageY + 5,
				"left": event.pageX + 5,
				"position": "absolute"
			});
			
			$("<div>제목: " + data.title + "</div>").appendTo(".judgeBox");
			$("<div>내용: " + data.content + "</div>").appendTo(".judgeBox");
			$("<div>대상자: @<b>" + data.target_id + "</b></div>").appendTo(".judgeBox");
			$("<div>링크주소: <a target='_blank' style='color: blue' href='${pageContext.request.contextPath}/board/detail?post_id=" + data.post_id +"' >@link</a></div>").appendTo(".judgeBox");
			if(data.result == 0) {
				$("<div style='color:gray; margin-top:20px'>-처분-</div>").appendTo(".judgeBox");
				$('<label id="result_label" for="result">정지여부<input type="checkbox" id="judgeCheck"/></label>').appendTo(".judgeBox");
				$("<div class='black' style='margin-top:6px'>정지일: <input type='number' value='1' min='1' max='9999' name='n' style='height: 20px;padding:3px'/></div>").appendTo(".judgeBox");
				$("<div class='black'>사유: <input type='text' name='content' style='height: 20px;'/></div>").appendTo(".judgeBox");
				$("<input type='hidden' name='user_id' value='"+ data.target_id +"'/>").appendTo(".judgeBox");
				$("<input type='hidden' name='accusate_id' value='"+ data.accusate_id +"'/>").appendTo(".judgeBox");
				$("<input type='hidden' id='result' name='result' value='2'/>").appendTo(".judgeBox");
				$("<div style='text-align:right'><input id='submitButton' type='submit' value='처리' style='width:50px;height:25px;text-align:center'/></div>").appendTo(".judgeBox");
			}
		}
	});
}

//profile_box창 이외 영역 클릭시 되돌아오기
$(document).mouseup(function(event){       
    if($(".judgeBox_Wrapper").has(event.target).length === 0){
        $(".judgeBox_Wrapper").remove();
    };
}) 

$(document).on("click", "#submitButton", function(event){       
    if($("#judgeCheck").is(":checked") == true) {
    	$("#result").val("1");		
    }
}) 

$(document).on("click", "#judgeCheck", function(event){       
    if($("#judgeCheck").is(":checked") == true) {
    	$(".black").show();
    }else {
    	$(".black").hide();
    }
}) 

</script>