<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    // For Test
    <%--const data = JSON.parse('${data}');--%>
</script>

<div id="view-map" class="course-map">
    <div class="zoom-button-area">
        <button class="zoom-in" type="button">
            <img src="${path}/resources/static/images/plus-small.svg" alt="확대">
        </button>
        <button class="zoom-out" type="button" disabled>
            <img src="${path}/resources/static/images/minus-small.svg" alt="축소">
        </button>
    </div>

    <div class="menu-area">
        <div class="menu-window">
            <h1>커스텀 등산로 모드</h1>
            <form action="submit-url" method="POST">
                <ul class="menu-list">
                    <li class="menu-item">
                        <p class="menu-title">시작점/종점</p>
                        <div class="menu-option">
                            <div class="radio-wrap">
                                <input id="same" name="option" value="same" type="radio" checked>
                                <label for="same" class="radio-btn"></label>
                                <span class="radio-label">동일</span>
                            </div>
                            <div class="radio-wrap">
                                <input id="diff" name="option" value="diff" type="radio">
                                <label for="diff" class="radio-btn"></label>
                                <span class="radio-label">다름</span>
                            </div>
                        </div>
                    </li>
                    <li class="menu-item">
                        <p class="menu-title">요약</p>
                        <div class="menu-option">
                        </div>
                    </li>
                </ul>

                <button class="save" type="submit">등산로 저장하기</button>
            </form>
        </div>

        <button class="switch-mode" type="button">등산로 추천 모드</button>
    </div>
</div>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8de9ed5ee23a0becf5c950f18bbddf4"></script>