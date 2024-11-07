<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jsp작업 -->
<div id="club-profile-background"></div>

<!-- 모임 프로필 -->
<div id="club-profile">

    <div id="profile-info">
        <div class="profile-image">
            <img src="${path}/resources/static/images/club-image.jpg" alt="모임 프로필 사진">
        </div>
        <div class="clubInfo">
            <h1 class="clubName">한사랑 산악회</h1>
            <h2 class="clubCreateDate">개설 일자: 2024년 11월 01일</h2>
        </div>
    </div>

    <div id="info-btn">
        <button type="button" class="chat-btn">
            <img class="chat-logo" src="${path}/resources/static/images/chat-dark.svg" alt="채팅 로고">
        </button>
        <button type="submit" class="register-btn" name="register-btn" onclick="location.href='${path}/club/view'">가입하기</button>
    </div>

</div>

<%-- 서브 메뉴 --%>
<header id="sub-menu">
    <nav>
        <ul>
            <li><a href="${path}/club/view">정보</a></li>
            <li><a href="${path}/club/scheduler">일정</a></li>
            <li><a href="${path}/club/hike">등산 기록</a></li>
            <li class="selected"><a href="${path}/club/gallery">사진첩</a></li>
        </ul>
    </nav>
</header>

<%-- 사진 --%>
<div id="gallery-sub-head">
    <div class="gallery-title">사진첩</div>
    <button type="button" class="image-add-btn" onclick="location.href=''">
        <img class="plus-logo" src="${path}/resources/static/images/plus.svg" alt="플러스 로고">
        <span>추가하기</span>
    </button>
</div>

<div id="club-gallery-list">
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
    <div class="club-gallery"><img src="${path}/resources/static/images/club/club-gallery-image.jpg" alt="모임 사진첩 사진"> </div>
</div>
