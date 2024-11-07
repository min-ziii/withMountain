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
            <li class="selected"><a href="${path}/club/view">정보</a></li>
            <li><a href="${path}/club/scheduler">일정</a></li>
            <li><a href="${path}/club/hike">등산 기록</a></li>
            <li><a href="${path}/club/gallery">사진첩</a></li>
        </ul>
    </nav>
</header>

<%-- 모임 정보 --%>
<div id="intro">
	<div class="intro-title">소개</div>
	<div class="intro-content"><pre>안녕하십니까? ○○○산악회 회원 여러분.
우리 산악인들의 마음을 한껏 부풀어오르게 만드는 아름다운 단풍이 곱게 피어나는 11월입니다.
이 좋은 가을날, 또 한번의 멋진 산행을 위해서 이렇게 올해의 ○○번째 모임을 갖게 되었습니다. 저희 모임에 오셔서 즐거운 산행 이어 갑시다 </pre></div>
</div>

<!-- 모임원 -->
<div id="club-member">
	<div class="memeber-toggle">
		<img class="toggle-icon" src="${path}/resources/static/images/arrow-down.svg" alt="토글 아이콘">가입 멤버 (6)
	</div>
	
	<div class="club-member-profile">
	
		<div class="member-profile">
			<img src="${path}/resources/static/images/club/memberProfie.jpg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		<div class="member-profile">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		<div class="member-profile">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		<div class="member-profile">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		<div class="member-profile">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		<div class="member-profile">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>
		
	</div>
</div>






















































