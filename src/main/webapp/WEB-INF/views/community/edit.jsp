<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 커뮤니티 수정하기 -->

<div class="header">
<div class="back-page">
    <img src="${path}/resources/static/images/arrow_back.svg" class="back">
    <a onclick="location.href='${path}/community'">이전 페이지</a>
</div>
</div>
	
<!-- 글 작성 박스 -->
<form action="${path}/community/update" method="POST" enctype="multipart/form-data">
    <!-- 게시글 ID를 hidden input으로 전달 -->
    <input type="hidden" name="cm_board_id" value="${communityBoardDTO.cm_board_id}"> 

    <div class="content-box">
        <div class="content-form">
            <!-- 제목 입력 (기존 제목으로 초기화) -->
            <input type="text" id="title" name="title" class="content-control" value="${communityBoardDTO.title}" placeholder="글의 제목을 입력해주세요." required>

            <div>
                <!-- 내용 입력 (기존 내용으로 초기화) -->
                <div id="content-container" class="content-control">${communityBoardDTO.content}</div>
                <textarea id="content" name="content" style="display:none;" placeholder="내용을 작성해주세요." required></textarea>
            </div>
            
            <!-- 해시태그 입력 (기존 해시태그로 초기화) -->
            <input type="text" id="hashtags" name="hashtags" class="content-control" value="${communityBoardDTO.hashtags}" placeholder="#해시태그">
        </div>
    </div>
    <!-- 수정 버튼 -->
    <div class="post-container">
        <button type="submit" class="edit-post">수정하기</button>
    </div>
</form>




















	