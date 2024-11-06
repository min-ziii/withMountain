<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<header id="sub-menu">
	<nav>
        <ul>
            <li class="selected"><a href="${path}/community">사진 게시판</a></li>
            <li><a href="${path}/community/free">자유 게시판</a></li>
            <li><a href="${path}/community/qna">QnA</a></li>
        </ul>
    </nav>
</header>
    


