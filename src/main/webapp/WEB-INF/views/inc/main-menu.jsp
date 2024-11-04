<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<header id="main-menu">
    <a href="${path}/home">
        <img class="menu-logo" src="${path}/resources/static/images/logo.svg" alt="로고">
    </a>
    <nav>
        <ul>
            <li class="selected"><a href="">홈</a></li>
            <li><a href="${path}/course">코스</a></li>
            <li><a href="${path}/community">커뮤니티</a></li>
            <li><a href="${path}/club">모임</a></li>
            <li><a href="${path}/mypage">나의 등산</a></li>
            <li class="log-out"><a href="">로그아웃</a></li>
            <%-- <li class="log-in"><a href="">로그인</a></li>--%>
        </ul>
    </nav>
</header>




