<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<%-- 팝업창 띄우기 --%>
<div id="popup">
    <div class="window">

        <div class="popup-close">
            <button type="button" id="popup-close-btn" onclick='popupClose();'>
                <img class="close-logo" src="${path}/resources/static/images/close.svg" alt="닫기">
            </button>
        </div>

        <%-- 팝업 내용 여기 안에서 작업--%>
        <div class="window-title">등산 일정 생성</div>

        <form method="" action="">
        <table class="window-content">
            <tr>
                <th>제목: </th>
                <td><input class="content-input" type="text" name="title" id="title" placeholder="일정 제목을 입력해주세요." required></td>
            </tr>
            <tr>
                <th>일자: </th>
                <td><input class="content-input" type="month" name="hike-date" id="hike-date" placeholder="일정 일자를 선택해주세요." required></td>
            </tr>
            <tr>
                <th>일시: </th>
                <td><input class="content-input" type="time" name="hike-time" id="hike-time" placeholder="일정 일시를 선택해주세요." required></td>
            </tr>
        </table>

        <div class="course-add">
            <button type="button" class="course-add-btn">즐겨찾기 불러오기</button>
            <button type="button" class="course-add-btn">커스텀 코스 생성하기</button>
        </div>

        <%-- 추후 지도로 코스 보여줄 예정 --%>
        <div class="course-map"></div>

        <div class="window-btn">
            <button type="button" class="close-btn" onclick="location.href='${path}/club/scheduler'">취소</button>
            <button type="submit" class="plus-btn" onclick="location.href='${path}/club/scheduler'">등록</button>
        </div>

        </form>

    </div>
</div>

<!-- jsp작업 -->
<div id="club-profile-background"></div>

<!-- 모임 프로필 -->
<div id="club-profile">

    <div id="profile-info">
        <div class="profile-image">
            <img src="${path}/resources/static/images/club-image.jpg" alt="모임 프로필 사진">
        </div>
        <div class="clubInfo">

            <div class="club-title">
                <h1 class="clubName">한사랑 산악회</h1>
                <button type="button" onclick="location.href='${path}/club/edit'">
                    <img class="club-setting" src="${path}/resources/static/images/settings.svg" alt="모임 관리">
                </button>
            </div>

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
            <li class="selected"><a href="${path}/club/scheduler">일정</a></li>
            <li><a href="${path}/club/hike">등산 기록</a></li>
            <li><a href="${path}/club/gallery">사진첩</a></li>
        </ul>
    </nav>
</header>

<div id="scheduler-sub-head">
    <div class="scheduler-title">일정</div>
    <button type="button" class="scheduler-add-btn" onclick="showModal();">
        <img class="plus-logo" src="${path}/resources/static/images/plus.svg" alt="플러스 로고">
        <span>추가하기</span>
    </button>
</div>

<div id="calendar"></div>

