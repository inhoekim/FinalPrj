<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="board_title">
    <h4>OTT 게시판</h4>
</div>

<div class="board_topbar">
    <div class="topbar_title">
        <div class="topbar_classification">분류: ${param.classification}</div>
        <i class="fas fa-angle-down toggle"></i>
    </div>
    <div class="topbar_content">
        <div class="content_wrapper">
            <a href="${cp}/board/list?classification=all">전체</a>
            <a href="${cp}/board/list?classification=announce">공지</a>
            <a href="${cp}/board/list?classification=free">자유</a>
            <a href="${cp}/board/list?classification=party">파티찾기</a>
            <a href="${cp}/board/list?classification=report">신고</a>
        </div>

    </div>
</div>

<div class="table_wrapper">
    <table class="board_table">
        <thead></thead>
            <tr style="height: 40px;">
                <th >번호</th>
                <th style="width:60px">분류</th>
                <th style="width: 50%">제목</th>
                <th class="th_writer">글쓴이</th>
                <th>날짜</th>
                <th>조회수</th>
                <th>추천수</th>
            </tr>

            <tr class="notice">
                <td><div>1</div></td>
                <td><div>공지</div></td>
                <td class="td_title">
                    <div class="title">
                        어쩌고 저쩌고 마마마암아낭낭마안안아안안아
                    </div>
                    <div class="commentNum">3</div>
                </td>
                <td>
                    <div class="writer">
                        <img class="writer_profile" src="${pageContext.request.contextPath}/resources/img/profile/woman2-32.png">
                        admin
                    </div>
                </td>
                <td><div>22.02.13</div></td>
                <td><div>0</div></td>
                <td><div>1</div></td>
            </tr>

            <tr class="notice">
                <td><div>2</div></td>
                <td><div>공지</div></td>
                <td class="td_title">
                    <div class="title">
                        test
                    </div>
                    <div class="commentNum">83</div>
                </td>
                <td>
                    <div class="writer">
                        <img class="writer_profile" src="${pageContext.request.contextPath}/resources/img/profile/woman2-32.png">
                        admin
                    </div>
                </td>
                <td><div>22.02.13</div></td>
                <td><div>0</div></td>
                <td><div>1</div></td>
            </tr>

            <tr>
                <td><div>3</div></td>
                <td><div>파티찾기</div></td>
                <td class="td_title">
                    <div class="title">
                        가마나나다바
                    </div>
                    <div class="commentNum">113</div>
                </td>
                <td>
                    <div class="writer">
                        김인회아아이이
                    </div>
                </td>
                <td><div>22.02.13</div></td>
                <td><div>0</div></td>
                <td><div>1</div></td>
            </tr>

            <tr>
                <td><div>4</div></td>
                <td><div>자유</div></td>
                <td><div class="title">Test</div></td>
                <td>
                    <div class="writer">
                        기미내
                    </div>
                </td>
                <td><div>22.02.13</div></td>
                <td><div>0</div></td>
                <td><div>1</div></td>
            </tr>

        <tbody></tbody>
    </table>
</div>

<div class="board_bottomBar">
    <form action="${cp}/board/list?classification=${param.classification}">
        <div class="searchBar">
            <select class="searchBar_select" name="field">
                <option value="title" <c:if test="${field=='title'}">selected</c:if>>제목</option>
                <option value="user_id" <c:if test="${field=='user_id'}">selected</c:if>>작성자</option>
                <option value="content" <c:if test="${field=='content'}">selected</c:if>>내용</option>
                <option value="ticon" <c:if test="${field=='ticon'}">selected</c:if>>제목+내용</option>
            </select>
            <input type="text" class="searchBar_input" name="keyword" value="${keyword}">
            <button class="search"><i class="fa-solid fa-magnifying-glass"></i></button>
        </div>
    </form>
    <a class="writeButton" href="#"><i class="fa-solid fa-pencil"></i><span style="font-size: 12px; margin-left: 3px;">쓰기</span></a>

</div>
