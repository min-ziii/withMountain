<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 홈페이지 -->
<!-- 1. 헤더문구 & 검색창 -->
<div id="home-header">
	<div class="header-title">이번주엔 어느 산을 올라볼까요?</div>
	<div id="search-box">
		<input type="text" value="관심있는 산 이름을 검색해보세요!" id="search-text" size="15">
		<button type="submit" id="search-btn">
			<img class="search-logo" src="${path}/resources/static/images/search.svg" alt="검색">
		</button>
	</div>
</div>

<!-- 2. 산 이름과 원형 이미지 -->
<div id="circle-mtlist">
	<div class="circle-mtlist-item">
		<img>
	</div>
	<p>북한산</p>
</div>

<!-- 3. 산 이름 목록과 큰 이미지 -->
<div id="mini-mtlist-header">
	<div class="header-title">지금 인기 있는 산</div>
	<div class="header-content">유저들이 가장 좋아하는 산들을 모아봤어요!</div>
</div>

<!-- 4. 등산 예정 모임 -->
<div id="hike-plan-club-header">
	<div class="header-title"><span class="color-green">북한산</span> 등산 예정 모임</div>
	<div class="header-content">유저들이 가장 좋아하는 산들을 모아봤어요!</div>
</div>

<!-- 5. 커뮤니티 인기글 모음 -->
<div id="community-best-header">
	<div class="header-title">커뮤니티 인기글 모음</div>
	<div class="header-content">등산에 대한 다양한 정보와 재미있는 이야기를 즐겨봐요!</div>
</div>

