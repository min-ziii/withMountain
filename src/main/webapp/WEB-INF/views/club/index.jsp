<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 모임 메인페이지 -->
<!-- 1. 헤더문구 & 검색창 -->
<div id="clublist-header">
	<div class="clublist-title">함께라면 산행이 더 즐거워요</div>
	<div id="search-box">
		<input type="text" value="모임 이름이나 활동 지역을 검색해보세요!" id="search-text" size="15">
		<button type="submit" id="search-btn">
			<img class="search-logo" src="${path}/resources/static/images/search.svg" alt="검색">
		</button>
	</div>
</div>

<!-- 2. 가입한 모임 리스트 -->
<div id="joinlist-header">
	<div class="clublist-title">가입한 모임</div>
	<div class="clublist-content">이번주엔 어떤 산행이 기다리고 있을까요?</div>
</div>
<div id="clublist-joinlist">

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
	
</div>



<!-- 3. 추천하는 모임 리스트 -->
<div id="recommendlist-header">
	<div class="clublist-title">추천하는 모임</div>
	<div class="clublist-content">000님 지역에 가까운 모임으로 찾아보았어요!</div>
</div>
<div id="clublist-recommendlist">

	<div class="recommendclub">
		<img class="joinclub-image"
			src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
		<div class="recommendclub-content">
			<div class="recommendclub-header">
				<div>한사랑 산악회</div>
				<img class="usercheck-logo"
					src="${path}/resources/static/images/user-check.svg" alt="가입한모임">
			</div>
			<div class="recommendclub-intro">안녕하십니까? ○○○산악회 회원 여러분. 우리
				산악인들의 마음을 한껏 부풀어오르게 만드는 아름다운 단풍이 곱게 피어나는 10월입니다. 이 좋은 가을날, 또 한번의 멋진
				산행을 위해서 이렇게 올해의 ○○번째 모임을 갖게 되었습니다. 저희 모임에 오셔서 즐거운 산행 이어 갑시다</div>
			<div class="recommendclub-tag">
				<span class="recommendclub-tag-item"># 백숙</span> <span
					class="recommendclub-tag-item"># 가을산</span> <span
					class="recommendclub-tag-item"># 단풍명소</span>
			</div>
			<div class="recommendclub-footer">
				<div>
					<span><img class="clock-logo"
						src="${path}/resources/static/images/clock.svg" alt="가입날짜"></span>
					<span>2024-11-05</span>
				</div>
				<div>
					<span><img class="users-logo"
						src="${path}/resources/static/images/users.svg" alt="멤버"></span> <span>6/50</span>
				</div>
			</div>
		</div>
	</div>

	<div class="recommendclub">
		<img class="joinclub-image"
			src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
		<div class="recommendclub-content">
			<div class="recommendclub-header">
				<div>한사랑 산악회</div>
				<img class="useradd-logo"
					src="${path}/resources/static/images/user-add.svg" alt="가입하기">
			</div>
			<div class="recommendclub-intro">안녕하십니까? ○○○산악회 회원 여러분. 우리
				산악인들의 마음을 한껏 부풀어오르게 만드는 아름다운 단풍이 곱게 피어나는 10월입니다. 이 좋은 가을날, 또 한번의 멋진
				산행을 위해서 이렇게 올해의 ○○번째 모임을 갖게 되었습니다. 저희 모임에 오셔서 즐거운 산행 이어 갑시다</div>
			<div class="recommendclub-tag">
				<span class="recommendclub-tag-item"># 백숙</span> <span
					class="recommendclub-tag-item"># 가을산</span> <span
					class="recommendclub-tag-item"># 단풍명소</span>
			</div>
			<div class="recommendclub-footer">
				<div>
					<span><img class="clock-logo"
						src="${path}/resources/static/images/clock.svg" alt="가입날짜"></span>
					<span>2024-11-05</span>
				</div>
				<div>
					<span><img class="users-logo"
						src="${path}/resources/static/images/users.svg" alt="멤버"></span> <span>6/50</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="recommendclub">
		<img class="joinclub-image"
			src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
		<div class="recommendclub-content">
			<div class="recommendclub-header">
				<div>한사랑 산악회</div>
				<img class="useradd-logo"
					src="${path}/resources/static/images/user-add.svg" alt="가입하기">
			</div>
			<div class="recommendclub-intro">안녕하십니까? ○○○산악회 회원 여러분. 우리
				산악인들의 마음을 한껏 부풀어오르게 만드는 아름다운 단풍이 곱게 피어나는 10월입니다. 이 좋은 가을날, 또 한번의 멋진
				산행을 위해서 이렇게 올해의 ○○번째 모임을 갖게 되었습니다. 저희 모임에 오셔서 즐거운 산행 이어 갑시다</div>
			<div class="recommendclub-tag">
				<span class="recommendclub-tag-item"># 백숙</span> <span
					class="recommendclub-tag-item"># 가을산</span> <span
					class="recommendclub-tag-item"># 단풍명소</span>
			</div>
			<div class="recommendclub-footer">
				<div>
					<span><img class="clock-logo"
						src="${path}/resources/static/images/clock.svg" alt="가입날짜"></span>
					<span>2024-11-05</span>
				</div>
				<div>
					<span><img class="users-logo"
						src="${path}/resources/static/images/users.svg" alt="멤버"></span> <span>6/50</span>
				</div>
			</div>
		</div>
	</div>
	
	<div class="recommendclub">
		<img class="joinclub-image" src="${path}/resources/static/images/club-image.jpg" alt="산악회 대표사진">
		<div class="recommendclub-content">
			<div class="recommendclub-header">
				<div>한사랑 산악회</div>
				<img class="useradd-logo"
					src="${path}/resources/static/images/user-add.svg" alt="가입하기">
			</div>
			<div class="recommendclub-intro">안녕하십니까? ○○○산악회 회원 여러분. 우리 산악인들의 마음을 한껏 부풀어오르게 만드는 아름다운 단풍이
				곱게 피어나는 10월입니다. 이 좋은 가을날, 또 한번의 멋진 산행을 위해서 이렇게 올해의 ○○번째 모임을 갖게 되었습니다.
				저희 모임에 오셔서 즐거운 산행 이어 갑시다</div>
			<div class="recommendclub-tag">
				<span class="recommendclub-tag-item"># 백숙</span> 
				<span class="recommendclub-tag-item"># 가을산</span> 
				<span class="recommendclub-tag-item"># 단풍명소</span>
			</div>
			<div class="recommendclub-footer">
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
	
</div>

<!-- 4. 모임 플러스 버튼 -->
<!-- 모임 생성 & 초대코드 입력 버튼 -->
<button type="button" id="club-plus-btn">
	<img class="plus-logo" src="${path}/resources/static/images/plus.svg" alt="모임플러스버튼">
</button>
<button type="button" id="club-close-btn">
	<img class="close-main-color-logo" src="${path}/resources/static/images/close-main-color.svg" alt="닫기버튼">
</button>
<button type="button" id="club-otp-btn">
	<img class="otp-logo" src="${path}/resources/static/images/otp.svg" alt="초대코드버튼">
</button>
<button type="button" id="club-add-btn" onclick="location.href='http://localhost:8090/hike/club/add';">
	<img class="users-medical-logo" src="${path}/resources/static/images/users-medical.svg" alt="모임생성버튼">
</button>

