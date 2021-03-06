<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="rightside">
    <div class="rightside_container">
        <div class="cotainer_title">최근 파티매칭 모집글</div>
		
        <div class="cotainer_items">
                <div class="post">
                    <a class="board_category" href="${pageContext.request.contextPath}/board/list?category=${rPList[0].category_id}">${rPList[0].cname }</a>
                    <a href="${pageContext.request.contextPath}/board/detail?post_id=${rPList[0].post_id}&category=${rPList[0].category_id}" class="post_title">${rPList[0].title }</a>
                </div>

                <div class="post">
                    <a class="board_category" href="${pageContext.request.contextPath}/board/list?category=${rPList[1].category_id}">${rPList[1].cname }</a>
                    <a href="${pageContext.request.contextPath}/board/detail?post_id=${rPList[1].post_id}&category=${rPList[1].category_id}" class="post_title">${rPList[1].title }</a>
                </div>

                <div class="post">
                    <a class="board_category" href="${pageContext.request.contextPath}/board/list?category=${rPList[2].category_id}">${rPList[2].cname }</a>
                    <a href="${pageContext.request.contextPath}/board/detail?post_id=${rPList[2].post_id}&category=${rPList[2].category_id}" class="post_title">${rPList[2].title }</a>
                </div>

                <div class="post">
                    <a class="board_category" href="${pageContext.request.contextPath}/board/list?category=${rPList[3].category_id}">${rPList[3].cname }</a>
                    <a href="${pageContext.request.contextPath}/board/detail?post_id=${rPList[3].post_id}&category=${rPList[3].category_id}" class="post_title">${rPList[3].title }</a>
                </div>
        </div>   
    </div>
    
    <div class="rightside_container" onclick="location.href='${pageContext.request.contextPath}/autoMatch'">
    <div class="banner">
        <div class="banner_content">
            <div>더 <span>빠르고</span>, 더 <span>간편하게</span></div>
            <div>당신의 파티를<br></div>
            <div style="position: relative; top:-5px">찾아보세요<img src="${pageContext.request.contextPath}/resources/img/sparkling-32.png" style="height: 25px;position: relative; top:4px"><br></div>
        </div>

        <div class="banner_img">
            <img class="search_chick" src="${pageContext.request.contextPath}/resources/img/searching/search2-64.png">
            <div class="speech_bubble2">
                <span style="position: relative; top:-3px; left:3px;display: flex;font-family: neo;">
                    찾아줘 <img class="chick" src="${pageContext.request.contextPath}/resources/img/chick-24.png">
                </span>
            </div>
        </div>

        <div class="banner_service">
            <div style="margin-bottom: 5px;">자동매칭 서비스</div> 
            <div>이용해보기</div>
        </div>
    </div>
</div>
</aside>