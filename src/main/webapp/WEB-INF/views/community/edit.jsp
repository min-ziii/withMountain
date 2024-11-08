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
<div class="content-box">
    <div class="content-form">
        <input type="text" id="title" name="title" class="content-control" placeholder="글의 제목을 입력해주세요." required>
        
        <div>
         <div id="content-container" class="content-control"></div>
            <textarea id="content" name="content" style="display:none;" placeholder="내용을 작성해주세요." required></textarea>
        </div>
        
        <input type="text" id="hashtags" name="hashtags" class="content-control" placeholder="#해시태그">
    </div>
</div>

    <div class="post-container">
        <button type="submit" class="edit-post">수정하기</button>
    </div>





















	