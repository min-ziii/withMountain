<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<script>
    const mountains = [
        <c:forEach var="mountain" items="${mountains}" varStatus="status">
        {
            "mtId": "${mountain.mtId}",
            "mtName": "${mountain.mtName}",
            "mtAddress": "${mountain.mtAddress}",
            "mtX": ${mountain.mtX},
            "mtY": ${mountain.mtY}
        }<c:if test="${!status.last}">,</c:if>
        </c:forEach>
    ];
</script>

<div id="search-map" class="course-map">
    <div class="input-area">
        <div class="input-wrap">
            <input class="mt-search-input" type="text" placeholder="산 이름 또는 행정구역으로 검색">
            <img class="search-icon" src="${path}/resources/static/images/search.svg" alt="검색 아이콘">
        </div>
        <ul class="auto-list"></ul>
    </div>

    <div class="zoom-button-area">
        <button class="zoom-in" type="button">
            <img src="${path}/resources/static/images/plus-small.svg" alt="확대">
        </button>
        <button class="zoom-out" type="button" disabled>
            <img src="${path}/resources/static/images/minus-small.svg" alt="축소">
        </button>
    </div>
</div>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8de9ed5ee23a0becf5c950f18bbddf4"></script>
