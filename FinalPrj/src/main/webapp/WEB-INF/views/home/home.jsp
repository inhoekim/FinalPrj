<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
    <div class="post_section">
        <div class="section_container">
            <div class="container_title">최신 글</div>
            <div class="container_items">

                <div class="post">
                    <div class="post_num first">1</div>
                    <a class="board_category" href="#">${rList[0].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[0].post_id}" class="post_title">${rList[0].title}</a>
                    <span class="comment_cnt">${rList[0].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num second">2</div>
                    <a class="board_category" href="#">${rList[1].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[1].post_id}" class="post_title">${rList[1].title}</a>
                    <span class="comment_cnt">${rList[1].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num third">3</div>
                    <a class="board_category" href="#">${rList[2].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[2].post_id}" class="post_title">${rList[2].title}</a>
                    <span class="comment_cnt">${rList[2].comCnt}</span>
                </div>
                 <c:forEach var="cnt" begin="3" end="9">
				 <div class="post">
                    <div class="post_num">${cnt+1}</div>
                    <a class="board_category" href="#">${rList[cnt].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[cnt].post_id}" class="post_title">${rList[cnt].title}</a>
                    <span class="comment_cnt">${rList[cnt].comCnt}</span>
                </div>
				
				 </c:forEach> 
            </div>
        </div>
    
        <div class="section_container">
            <div class="container_title">인기 글</div>
            <div class="container_items">

            <div class="post">
                    <div class="post_num first">1</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[0].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[0].post_id}" class="post_title">${bList[0].title}</a>
                    <span class="comment_cnt">${bList[0].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num second">2</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[1].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[1].post_id}" class="post_title">${bList[1].title}</a>
                    <span class="comment_cnt">${bList[1].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num third">3</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[2].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[2].post_id}" class="post_title">${bList[2].title}</a>
                    <span class="comment_cnt">${bList[2].comCnt}</span>
                </div>

                <c:forEach var="cnt" begin="3" end="9">               	                     
                <div class="post">
                    <div class="post_num">${cnt+1}</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[cnt].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[cnt].post_id}" class="post_title">${bList[cnt].title}</a>
                    <span class="comment_cnt">${bList[cnt].comCnt}</span>
                </div>
  			</c:forEach>
            </div>
        </div>
    
    
    </div>   


    <div class="section_container">
        <div class="boundary">인기댓글</div>

        <div class="popular_comments">
            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">안녕하세요!!asdasadsa안녕하세요안녕하세요asdasdaasdasdass안녕하asdda세요안녕하세요안녕하세요안녕하세요</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">188</span></i>
                            <span class="date">방금전</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                    <img class="user_profile_img" src="${pageContext.request.contextPath}/resources/img/undraw_profile_1.svg"/>
                    <span>김인회</span>
                </div>
            </div>

            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">안녕하세요!!</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">188</span></i>
                            <span class="date">5분전</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                    <img class="user_profile_img" src="${pageContext.request.contextPath}/resources/img/undraw_profile_3.svg"/>
                    <span>아메리카남나임</span>
                </div>
            </div>

            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">안녕하세요!!</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">188</span></i>
                            <span class="date">2022.01.24</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                    <i class="fas fa-user user_profile_img"></i>
                    <span>개똥이</span>
                </div>
            </div>
        </div>

        <div class="pagenation"> < 3 / 3 ></div>
    </div>

    <div class="section_container">
        영화,드라마 추천
    </div>

    <div class="section_container">
        작성글
        댓글
        추천수
    </div>