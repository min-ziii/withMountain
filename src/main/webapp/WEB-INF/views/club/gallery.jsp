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
        <div class="window-title">사진 추가하기</div>

        <form method="" action="">
        <table class="window-content">
            <tr>
                <th>산 이름: </th>
                <td><input class="mt-name-input" type="text" name="title" id="mt-name-input" placeholder="산 이름을 입력해주세요." required></td>
            </tr>
            <tr>
                <th>파일명: </th>
                <td>
                    <input type="file" name="image" id="gallery-image" class="gallery-image" accept="image/*">
                </td>
            </tr>
        </table>

        <div class="form-club-img">
            <div class="form-group">

                <div class="club-img-upload">
                    <!-- <div class="inner"> -->
                    <label for="gallery-image">
                        <img class="club-default-image" src="${path}/resources/static/images/club-image.jpg" alt="모임기본이미지">
                    </label>
                </div>

                <div class="preview-image"></div>

            </div>
        </div>

        <%-- 취소 + 등록 버튼 --%>
        <div class="window-btn">
            <button type="button" class="close-btn" onclick="location.href='${path}/club/gallery'">취소</button>
            <button type="submit" class="plus-btn" onclick="location.href='${path}/club/gallery'">등록</button>
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
            <li><a href="${path}/club/scheduler">일정</a></li>
            <li><a href="${path}/club/hike">등산 기록</a></li>
            <li class="selected"><a href="${path}/club/gallery">사진첩</a></li>
        </ul>
    </nav>
</header>

<%-- 사진 --%>
<div id="gallery-sub-head">
    <div class="gallery-title">사진첩</div>
    <button type="button" class="image-add-btn" onclick="//location.href=''">
        <img class="plus-logo" src="${path}/resources/static/images/plus.svg" alt="플러스 로고">
        <span onclick="showModal();">추가하기</span>
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

// 모임 사진첩 사진 첨부 & 사진 미리보기
    <script>
    document.getElementById('gallery-image').addEventListener('change', function(e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function(e) {
            // 기본 프로필 이미지의 src를 새로운 이미지로 변경
            document.querySelector('.club-default-image').src = e.target.result;
        }
        reader.readAsDataURL(file);
        }
    });
</script>