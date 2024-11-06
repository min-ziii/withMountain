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
        <button type="submit" class="register-btn" name="register-btn">가입하기</button>
    </div>

</div>

<%-- 서브 메뉴 --%>
<header id="sub-menu">
    <nav>
        <ul>
            <li><a href="${path}/club/view">정보</a></li>
            <li><a href="${path}/club/scheduler">일정</a></li>
            <li class="selected"><a href="${path}/club/hike">등산 기록</a></li>
            <li><a href="${path}/club/gallery">사진첩</a></li>
        </ul>
    </nav>
</header>

<%-- 등산 기록 --%>
<div class="club-hike">

    <div class="club-hike-list">
        <img class="course-image" src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
        <div class="hike-main-content">

            <div class="hike-title">북한산 등산</div>
            <hr>
            <div class="hike-content">
                <div class="hike-sub-content">
                    <div>
                        <span><img class="title-logo" src="${path}/resources/static/images/title.svg" alt="등산 일정"></span>
                        <span>열정 가득한 가을 북한산 등산!!</span>
                    </div>
                </div>
                <div class="hike-sub-content">
                    <div>
                        <span><img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="출발 시간"></span>
                        <span>2024-11-21 (일)</span>
                    </div>
                </div>
                <div class="hike-sub-content">
                    <div>
                        <span><img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="출발 시간"></span>
                        <span>10:00 출발</span>
                    </div>
                </div>
                <div class="hike-sub-content">
                    <div>
                        <span><img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="출발 시간"></span>
                        <span>15:00 도착</span>
                    </div>
                </div>
            </div>

            <div class="hike-total-record">
                <div class="hike-total-time">
                    <span>소요 시간</span>
                    <span>3시간 12분</span>
                </div>
                <div class="hike-total-distance">
                    <span>등산 거리</span>
                    <span>8.4KM</span>
                </div>
            </div>

        </div>
    </div>

</div>