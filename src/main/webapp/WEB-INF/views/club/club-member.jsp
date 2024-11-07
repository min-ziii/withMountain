<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<h1>멤버 관리 팝업창 !</h1>
<!-- 팝업창 띄우기 -->
<div id="popup">
    <div class="window">

        <!-- 팝업 내용 여기 안에서 작업-->
        <div class="popup-close">
        <button type="button" id="popup-close-btn" onclick='popupClose();'>
			<img class="close-logo" src="${path}/resources/static/images/close.svg" alt="닫기">
		</button>
        </div>
        
        <div class="clublist-title">모임 멤버</div>
        
        <div id="search-box">
		<input type="text" value="모임 멤버 검색" id="search-text" size="15">
		<button type="submit" id="search-btn">
			<img class="search-logo" src="${path}/resources/static/images/search.svg" alt="검색">
		</button>
		</div>

        	<div class="memeber-toggle">
				<img class="toggle-icon" src="${path}/resources/static/images/arrow-down.svg" alt="토글 아이콘">가입 멤버 (6/50)
			</div>

		<div class="profile-container">
			<img src="${path}/resources/static/images/club/memberProfie.jpg" alt="모임원 프로필 사진" class="profile-image">

			<div class="profile-info">
				<span class="profile-name">이택조</span>
				<span class="profile-date">24.11.03 가입</span>
			</div>
		</div>

		<c:forEach begin="1" end="5">
		<div class="profile-container">
			<img src="${path}/resources/static/images/default-profile.svg" alt="모임원 프로필 사진" class="profile-image">
			<div class="profile-info">
				<span class="profile-name">배용길</span>
				<span class="profile-date">24.11.03 가입</span>
			</div>
			<div class="profile-buttons">
				<button class="assign-btn btn">위임</button>
				<button class="leave-btn btn">탈퇴</button>
			</div>
		</div>
		</c:forEach>

    </div>
</div>

<button type="button" id="editclub-btn" onclick="showModal();">

<script>
	//팝업창 띄우기
	function showModal() {
		$('html, body').css({
			overflow: 'hidden',
			height: '100%'
		});
		$('#popup').css('display', 'flex');
	}

	//팝업창 닫기
	function popupClose() {
		$('html, body').css({
			overflow: 'visible',
			height: '100%'
		});
		$('#popup').css('display', 'none');
	}

</script>
