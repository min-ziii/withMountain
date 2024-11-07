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
	
<div class="add-box">
    <div class="add-form">
        <input type="text" id="title" name="title" class="add-control" placeholder="글의 제목을 입력해주세요." required>
        <textarea id="content" name="content" class="add-control" placeholder="내용을 작성해주세요." required></textarea>
        <input type="text" id="hashtags" name="hashtags" class="add-control" placeholder="#해시태그">
    </div>
</div>

    <div class="post-container">
        <button type="submit" class="edit-post">수정하기</button>
    </div>





















	