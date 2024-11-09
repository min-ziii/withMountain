<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jsp작업 -->
<input type="hidden" name="club_id" value="${clubDTO.club_id}">
<div id="club-profile-background"></div>

<!-- 모임 프로필 -->
<div id="club-profile">
	
	<div id="profile-info">
		<div class="club-profile-image">
			<img src="${path}/resources/static/images/club-image.jpg" alt="모임 프로필 사진">
		</div>
		<div class="clubInfo">

			<div class="club-title">
				<h1 class="clubName">${clubDTO.name}</h1>
				<button type="button" onclick="location.href='${path}/club/edit'">
					<img class="club-setting" src="${path}/resources/static/images/settings.svg" alt="모임 관리">
				</button>
			</div>
				<h2 class="clubCreateDate">개설 일자: ${clubDTO.create_date}</h2>

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
			<li class="selected"><a href="${path}/club/view?club_id=${clubDTO.club_id}">정보</a></li>
			<li><a href="${path}/club/scheduler?club_id=${clubDTO.club_id}" id="club-schedule">일정</a></li>
			<li><a href="${path}/club/hike?club_id=${clubDTO.club_id}" id="club-hike">등산 기록</a></li>
			<li><a href="${path}/club/gallery?club_id=${clubDTO.club_id}" id="club-gallery">사진첩</a></li>
		</ul>
    </nav>
</header>

<%-- 모임 정보 --%>
<div id="intro">
	<div class="intro-title">소개</div>
	<div class="intro-content"><pre>${clubDTO.intro}</pre></div>
</div>

<!-- 모임원 -->
<div id="club-member">
	<div class="club-member-management">
		가입 멤버 (6 / ${clubDTO.max_member})
		<img class="club-member-setting" src="${path}/resources/static/images/member-management.svg" alt="모임 멤버 관리">
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



















































