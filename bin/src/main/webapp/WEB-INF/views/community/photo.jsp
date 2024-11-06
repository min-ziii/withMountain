<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- <h1>커뮤니티 메인 페이지</h1> -->

<!-- <P>views/community/index.jsp</P> -->

<div class="header">
	<div class="sort-container">
		<select id="sort" class="sort-select">
			<option value="latest">최신 순</option>
			<option value="comments">댓글 많은 순</option>
			<option value="likes">좋아요 많은 순</option>
		</select>
	</div>
	
	<div class="write-container">
		<button class="write" onclick="location.href='${path}/write'"> + 작성하기</button>
	</div>
</div>

	




















 



