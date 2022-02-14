<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="board_title">
    <h4>OTT 게시판</h4>
</div>

<div class="board_topbar">
    <div class="topbar_classification">분류</div>
    <i class="fas fa-angle-down toggle"></i>
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
                        <img class="writer_profile" src="profile/woman2-32.png">
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
                        <img class="writer_profile" src="profile/woman2-32.png">
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
    <div class="searchBar">검색</div>
    <div class="writeButton">쓰기</div>

</div>