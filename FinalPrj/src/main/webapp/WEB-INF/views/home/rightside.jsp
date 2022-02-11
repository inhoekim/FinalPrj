<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside class="rightside">
    <div class="rightside_container">
        <div class="cotainer_title">최근 파티매칭 모집글</div>

        <div class="cotainer_items">
                <div class="post">
                    <a class="board_category" href="#">넷플릭스</a>
                    <a href="#" class="post_title">파티원 찾아요 넷플릭스 2/3 어쩌구저쩌구</a>
                </div>

                <div class="post">
                    <a class="board_category" href="#">왓챠</a>
                    <a href="#" class="post_title">님만 오면 고</a>
                </div>

                <div class="post">
                    <a class="board_category" href="#">디즈니</a>
                    <a href="#" class="post_title">2/4 2명 급구합니당</a>
                </div>

                <div class="post">
                    <a class="board_category" href="#">넷플릭스</a>
                    <a href="#" class="post_title">어쩌구쩌쩌구</a>
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

        <div style="display: flex; justify-content: center; margin: 30px 0">
            <img src="${pageContext.request.contextPath}/resources/img/searching/search2-64.png" style="height: 110px; width: 110px;">
            <div class="speech_bubble2">
                <span style="position: relative; top:-3px; left:3px;display: flex;font-family: neo;">
                    찾아줘 <img src="${pageContext.request.contextPath}/resources/img/chick-24.png" style="position:relative;width: 24px; height: 24px; top:-2px;left:4px;">
                </span>
            </div>
        </div>

        <div style="background-color: white; border-radius: 7px; padding: 15px; font-family: neo; display: flex; flex-direction: column; align-items: center;">
            <div style="margin-bottom: 5px;">자동매칭 서비스</div> 
            <div>이용해보기</div>
        </div>
    </div>
</div>
</aside>