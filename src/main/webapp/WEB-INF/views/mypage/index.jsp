<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>

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
			<h1 class="clubName">이택조</h1>
			<h2 class="clubCreateDate">가입 일자: 2024년 11월 01일</h2>
		</div>
	</div>

	<div id="info-btn">
		<button type="submit" class="pref-btn" name="pref-btn">
			<img class="set-logo" src="${path}/resources/static/images/settings.svg" alt="채팅 로고">
		</button>
	</div>
	
</div>

<header id="sub-menu">
	<nav>
        <ul>
            <li class="selected"><a href="${path}/club/view">정보</a></li>
            <li><a href="${path}/club/schedule">일정</a></li>
            <li><a href="${path}/club/hike">등산 기록</a></li>
            <li><a href="${path}/club/gallery">활동기록</a></li>
        </ul>
    </nav>
</header>

<!---------------------------------------- 나의등산 내용 --------------------------------------------->
<div class="mypage-content">

<div class="mypagetitle">소개</div>
<div id="intro">
	<div class="intro-content">
		<pre>중년은 죽지 않아 다 같이 열정 열정 열정!!!!!</pre>
	</div>
</div>

<!-- -----------------가입한 모임 부분--------------------- -->
<div class="mypagetitle">가입한 모임</div>
<div id="mypage-list">

	<!-- 가입한 모임 리스트 > index.jsp에서 가져옴 -->
	<div id="clublist-joinlist">
	
	<c:forEach begin="1" end="6">
	    <div class="joinclub">
	        <img class="joinclub-image" src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
	        <div class="joinclub-content">
	            <div class="joinclub-header">
	                <div>한사랑 산악회</div>
	                <div>열정 가득한 가을 북한산 등반</div>
	            </div>
	            <div class="joinclub-footer">
	                <div>
	                    <span><img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="가입날짜"></span>
	                    <span>2024-11-05</span>
	                </div>
	                <div>
	                    <span><img class="users-logo" src="${path}/resources/static/images/users.svg" alt="멤버"></span>
	                    <span>6/50</span>
	                </div>
	            </div>
	        </div>
	    </div>
	</c:forEach>
	<%-- 
	<c:forEach items="${clubs}" var="club">
    <div class="joinclub">
        <img class="joinclub-image" src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
        <div class="joinclub-content">
            <div class="joinclub-header">
                <div>${club.name}</div>
                <div>${club.title}</div>
            </div>
            <div class="joinclub-footer">
                <div>
                    <span><img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="가입날짜"></span>
                    <span>${club.joinDate}</span>
                </div>
                <div>
                    <span><img class="users-logo" src="${path}/resources/static/images/users.svg" alt="멤버"></span>
                    <span>${club.currentMembers}/${club.maxMembers}</span>
                </div>
            </div>
        </div>
    </div>
	</c:forEach> 
	--%>
	
	</div> <!-- clublist-joinlist -->
	
</div>


<!-- -----------------일정--------------------- -->

<div class="myscheduler">
<div id="scheduler-sub-head">
<div class="mypagetitle">일정</div>
    <button type="button" class="scheduler-add-btn" onclick="location.href=''">
        <img class="plus-logo" src="${path}/resources/static/images/plus.svg" alt="플러스 로고">
        <span>추가하기</span>
    </button>
</div>

<div id="calendar"></div>
</div>
<!-- -----------------등산 기록--------------------- -->
<div class="mypagetitle">등산 기록</div>
<div id="club-hike-list">
	
	
	<c:forEach begin="1" end="2">
    <div class="club-hike">
        <div class="course-image">
            <img src="${path}/resources/static/images/map-test.jpg" alt="코스 사진">
        </div>

        <div class="hike-main-content">
            <div class="hike-title"><span style="color: var(--main)">북한산</span> 등반</div>
            <div class="hike-content">
                <div class="hike-sub-content">
                    <img class="title-logo" src="${path}/resources/static/images/title.svg" alt="등산 타이틀">
                    <span>열정 가득한 가을 북한산 등반!!</span>
                </div>
                <div class="hike-sub-content">
                    <img class="calendar-logo" src="${path}/resources/static/images/calendar.svg" alt="등산 일정">
                    <span>2024-11-21 (일)</span>
                </div>
                <div class="hike-sub-content">
                    <img class="clock-logo" src="${path}/resources/static/images/clock.svg" alt="출발 시간">
                    <span>10:00 출발</span>
                </div>
                <div class="hike-sub-content">
                    <img class="clock-logo" src="${path}/resources/static/images/clock-dark.svg" alt="도착 시간">
                    <span>15:00 도착</span>
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
    </c:forEach>

</div>


<!-- -----------------활동 기록--------------------- -->
<div class="mypagetitle">활동 기록</div>

<div class="myactivities"> <!-- 나의 활동기록 내용 -->

<div class="tab-container">
    <button class="tab-button" data-tab="free">자유 게시판</button>
    <button class="tab-button" data-tab="photo">사진 게시판</button>
    <button class="tab-button" data-tab="qna">QnA</button>
</div>

<div class="tab-content">
    <div class="tab-pane" id="free"></div>
    <div class="tab-pane" id="photo"></div>
    <div class="tab-pane" id="qna"></div>
</div>


</div> <!-- 활동기록 내용 끝~ -->

<!-- 여기가 진짜 끝입니다.ㅎㅎㅎㅎ -->


</div> <!-- 나의 등산 끝~ -->
<script>
	/* mypage-tab.js 에서 확인하세요~ */
</script>


</body>
</html>













