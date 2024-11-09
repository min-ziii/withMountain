<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<div id="mountain-detail">
    <section class="image-section">
        <img class="main-image" src="${path}/resources/static/images/mtn/북한산.jpg" alt="산 사진">
        <buttons class="like-button">
            <img src="${path}/resources/static/images/heart-fill.svg" class="like-img" alt="좋아요 버튼"/>
            <span class="like-count">8</span>
        </buttons>
    </section>
    <section class="info-section">
        <div class="intro-area">
            <div class="title-wrap">
                <div class="title">
                    <h1>북한산</h1><span>서울특별시 강북구 우이동 산1</span>
                </div>
                <button class="custom-button">
                    나만의 등산로 만들기
                </button>
            </div>
            <p class="intro">
                대한민국에서 가장 많은 산쟁이들이 찾는 산<br>
                산에서 즐길 수 있는 모든 즐거움은 북한산에 있어요
            </p>
        </div>
        <div class="weather-area">
            <div class="weather-title-wrap">
                <h2>
                    <span class="mt-name">북한산</span>
                    <span> 날씨</span>
                </h2>
            </div>
            <div class="daily-weather"></div>
            <div class="sun">
                <div class="sun-container">
                    <div class="sun-item">
                        <span class="sun-title-wrap">
                            <img class="sun-icon" src="${path}/resources/static/images/icon_sunrise.png" alt="일출">
                            <span class="sun-title">일출</span>
                        </span>
                        <span class="sun-time sunrise-time"></span>
                    </div>
                    <div class="sun-separator"></div>
                    <div class="sun-item">
                        <span class="sun-title-wrap">
                            <img class="sun-icon" src="${path}/resources/static/images/icon_sunset.png" alt="일몰">
                            <span class="sun-title">일몰</span>
                        </span>
                        <span class="sun-time sunset-time"></span>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>