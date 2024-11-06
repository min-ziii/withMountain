<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<div id="view-map" class="course-map">
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
