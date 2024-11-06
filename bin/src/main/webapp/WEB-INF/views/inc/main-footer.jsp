<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<footer id="main-footer">
    <div class="main-footer-wrap">
        <div class="logo-wrap">
            <img class="footer-logo" src="${path}/resources/static/images/logo-dark.svg" alt="푸터 로고">
            <a href="https://github.com/Gwan-Woo-Jeong/hike-project" target="_blank">
                <img class="github-logo" src="${path}/resources/static/images/github-dark.svg" alt="깃헙 로고">
            </a>
        </div>
        <ul class="footer-content">
            <h2>쌍용 스프링 1조</h2>
            <li>주소:
                <address>서울 강남구 테헤란로 132 8층 쌍용교육센터 1강의실</address>
            </li>
            <li>대표자: <strong>정관우</strong></li>
            <li>문의 / 제안: <a href="mailto:sist1985@naver.com">sist1985@naver.com</a></li>
            <li >멤버:
                <ul class="member-list">
                    <li>김영진</li>
                    <li>손민지</li>
                    <li>이혜미</li>
                    <li>김유리</li>
                    <li>김유진</li>
                    <li>황도일</li>
                </ul>
            </li>
        </ul>
    </div>
</footer>