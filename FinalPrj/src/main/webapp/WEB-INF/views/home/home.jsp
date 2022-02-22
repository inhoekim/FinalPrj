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
                    <a class="board_category" href="${cp}/board/list?category=${rList[0].category_id}">${rList[0].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[0].post_id}&category=${rList[0].category_id}" class="post_title">${rList[0].title}</a>
                    <span class="comment_cnt">${rList[0].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num second">2</div>
                    <a class="board_category" href="${cp}/board/list?category=${rList[1].category_id}">${rList[1].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[1].post_id}&category=${rList[1].category_id}" class="post_title">${rList[1].title}</a>
                    <span class="comment_cnt">${rList[1].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num third">3</div>
                    <a class="board_category" href="${cp}/board/list?category=${rList[2].category_id}">${rList[2].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[2].post_id}&category=${rList[2].category_id}" class="post_title">${rList[2].title}</a>
                    <span class="comment_cnt">${rList[2].comCnt}</span>
                </div>
                 <c:forEach var="cnt" begin="3" end="9">
				 <div class="post">
                    <div class="post_num">${cnt+1}</div>
                    <a class="board_category" href="${cp}/board/list?category=${rList[cnt].category_id}">${rList[cnt].cname}</a>
                    <a href="${cp}/board/detail?post_id=${rList[cnt].post_id}&category=${rList[cnt].category_id}" class="post_title">${rList[cnt].title}</a>
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
                    <a href="${cp}/board/detail?post_id=${bList[0].post_id}&category=${bList[0].category_id}" class="post_title">${bList[0].title}</a>
                    <span class="comment_cnt">${bList[0].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num second">2</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[1].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[1].post_id}&category=${bList[1].category_id}" class="post_title">${bList[1].title}</a>
                    <span class="comment_cnt">${bList[1].comCnt}</span>
                </div>

                <div class="post">
                    <div class="post_num third">3</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[2].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[2].post_id}&category=${bList[2].category_id}" class="post_title">${bList[2].title}</a>
                    <span class="comment_cnt">${bList[2].comCnt}</span>
                </div>

                <c:forEach var="cnt" begin="3" end="9">               	                     
                <div class="post">
                    <div class="post_num">${cnt+1}</div>
                    <i class="fas fa-heart like"><span class="like_cnt">${bList[cnt].voCnt}</span></i>
                    <a href="${cp}/board/detail?post_id=${bList[cnt].post_id}&category=${bList[cnt].category_id}" class="post_title">${bList[cnt].title}</a>
                    <span class="comment_cnt">${bList[cnt].comCnt}</span>
                </div>
  			</c:forEach>
            </div>
        </div>
    
    
    </div>   


    <div class="section_container popular_comment">
        <div class="boundary">인기댓글</div>

            <div class="popular_comments">
            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">${cBList[0].content}</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">${cBList[0].cvoCnt}</span></i>
                            <span class="date">${cBList[0].created_day}</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                    <img class="user_profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cBList[0].profile_src}"/>
                    <span>${cBList[0].user_id}</span>
                </div>
            </div>

            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">${cBList[1].content}</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">${cBList[1].cvoCnt}</span></i>
                            <span class="date">${cBList[1].created_day}</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                    <img class="user_profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cBList[1].profile_src}"/>
                    <span>${cBList[1].user_id}</span>
                </div>
            </div>

            <div class="comment">
                <div class="user_speech">
                    <a href="#" class="speech_bubble">
                        <p class="content">${cBList[2].content}</p>
                        <div class="info">
                            <i class="fas fa-heart like"><span class="like_cnt">${cBList[2].cvoCnt}</span></i>
                            <span class="date">${cBList[2].created_day}</span>
                        </div>
                    </a>
                </div>
                <div class="user_profile">
                     <img class="user_profile_img" src="${pageContext.request.contextPath}/resources/img/profile/${cBList[2].profile_src}"/>
                    <span>${cBList[2].user_id}</span>
                </div>
            </div>
        </div>
    </div>