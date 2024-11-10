<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- jsp작업 -->
<input type="hidden" name="clubId" value="${clubDTO.clubId}">
<div id="club-profile-background"></div>

<!-- 모임 프로필 -->
<div id="club-profile">

	<div id="profile-info">
		<div class="club-profile-image">
			<img src="${path}/resources/static/images/club-image.jpg" alt="모임 프로필 사진">
		</div>
		<div class="clubInfo">

			<div class="club-title">
				<h1 class="clubName">${clubDTO.clubName}</h1>
				<button type="button" onclick="location.href='${path}/club/edit'">
					<img class="club-setting" src="${path}/resources/static/images/settings.svg" alt="모임 관리">
				</button>
			</div>
			<h2 class="clubCreateDate">개설 일자: ${clubDTO.clubCreateDate}</h2>

		</div>
	</div>

	<div id="info-btn">
		<button type="button" class="chat-btn">
			<img class="chat-logo" src="${path}/resources/static/images/chat-dark.svg" alt="채팅 로고">
		</button>
		<button type="button" class="register-btn" name="register-btn"  onclick="toggleRegister()">가입하기</button>
	</div>

</div>

<%-- 서브 메뉴 --%>
<header id="sub-menu">
	<nav>
		<ul>
			<li class="selected"><a href="${path}/club/view?clubId=${clubDTO.clubId}">정보</a></li>
			<li><a href="${path}/club/scheduler?clubId=${clubDTO.clubId}" id="club-schedule">일정</a></li>
			<li><a href="${path}/club/hike?clubId=${clubDTO.clubId}" id="club-hike">등산 기록</a></li>
			<li><a href="${path}/club/gallery?clubId=${clubDTO.clubId}" id="club-gallery">사진첩</a></li>
		</ul>
	</nav>
</header>

<%-- 모임 정보 --%>
<div id="intro">
	<div class="intro-title">소개</div>
	<div class="intro-content"><pre>${clubDTO.clubIntro}</pre></div>
</div>

<!-- 모임원 -->
<div id="club-member">
	<div class="club-member-management">
		가입 멤버 (6 / ${clubDTO.clubMaxMember})
		<img class="club-member-setting" src="${path}/resources/static/images/member-management.svg" alt="모임 멤버 관리">
	</div>
	
	<div class="club-member-profile">
	
		<div class="member-profile">
			<img src="${path}/resources/static/images/club/memberProfie.jpg" alt="모임원 프로필 사진">
			<div class="member-name">
				이택조
			</div>
		</div>

	</div>
</div>


<%--가입하기 버튼 클릭시 탈퇴하기 버튼으로 변경--%>
<script>
	// 초기 상태: 가입하기
	let isRegistered = false;  // 사용자가 가입한 상태인지 아닌지를 나타내는 변수 (false: 가입 안 함, true: 가입 됨)

	function toggleRegister() {
		const button = document.querySelector('.register-btn');

		if (isRegistered) {
			// 현재 "탈퇴하기" 상태일 때는 버튼 클릭 시 탈퇴 처리
			button.textContent = "가입하기";  // 버튼 텍스트 변경
			button.onclick = function() {
				// 탈퇴하기 버튼 클릭 시 이동
				location.href = '${path}/club/view';  // 탈퇴 처리 페이지로 이동
			};
			isRegistered = false;
		} else {
			// 현재 "가입하기" 상태일 때는 버튼 클릭 시 가입 처리
			button.textContent = "탈퇴하기";  // 버튼 텍스트 변경
			button.onclick = function() {
				// 가입하기 버튼 클릭 시 이동
				location.href = '${path}/club/view?clubId=${clubDTO.clubId}';  // 가입 처리 페이지로 이동
			};
			isRegistered = false;
		}
	}
</script>
















































