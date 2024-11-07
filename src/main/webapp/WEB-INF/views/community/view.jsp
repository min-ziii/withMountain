<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 커뮤니티 상세보기 -->

<div class="header">
	<div class="back-page">
    <img src="${path}/resources/static/images/arrow_back.svg" class="back">
    <a onclick="location.href='${path}/community'">이전 페이지</a>
	</div>
	<div class="view-btn">
    	<div class="del-container">
			<button class="del" onclick="location.href='${path}/community/del'"> 삭제하기</button>
		</div>
		<div class="edit-container">
        	<button class="edit" onclick="location.href='${path}/community/edit'">수정하기</button>
    	</div>
    </div>
</div>



<div class="total">
	
<div class="view-box">
    <div class="photo-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
       <div class="p-details">
            <span class="p-nickname">맛동산</span>
        	<div class="p-post-time">
        	<span class="location">북한산</span>
        	<span class="date">2024-11-05</span>
        	</div>
        </div>
    </div>
    	<div class="photo-picture">
    		<img src="${path}/resources/static/images/picture.svg" alt="첨부사진" class="p-photo-pic">
    		<img src="${path}/resources/static/images/picture.svg" alt="첨부사진" class="p-photo-pic">
    	</div>
    	<div class="photo-content">
    		<a href="#">경사가 있는편인데 생각보다 금방 올라가요!
						아주 멋진 북한산 ~</a>
		</div>
 
<!-- 좋아요, 댓글 -->    
    <div class="p-post-action">
    	<div class="icon-item">
        	<img src="${path}/resources/static/images/heart.svg" alt="좋아요" class="like-icon">
        	<span class="like-count">2</span> <!-- 좋아요 수 -->
    	</div>
    	<div class="icon-item">
        	<img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        	<span class="comment-count">4</span> <!-- 댓글 수 -->
    	</div>
	</div>
</div>

<!-- 댓글 -->
	<div class="comments">
        <!-- 댓글 개수 표시 -->
        <div class="comments-count">
            <span id="comment-count">댓글 총 4개</span>
        </div>
    <!-- 댓글 1 -->
    <div class="comment-item">
        <div class="comment-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="comment-nickname">김동산</span>
        </div>
        <p class="comment-text">안녕하세요! 아주 멋지네요~~~~~~ 저도 가고 싶어요~~~</p>
        <span class="comment-date">2024-11-06</span> <!-- 댓글 작성 날짜 -->
    </div>

    <!-- 댓글 2 -->
    <div class="comment-item">
        <div class="comment-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="comment-nickname">이동산</span>
        </div>
        <p class="comment-text">안녕하세요! 아주 멋지네요~~~~~~ 저도 가고 싶어요~~~</p>
        <span class="comment-date">2024-11-06</span> <!-- 댓글 작성 날짜 -->
    </div>

    <!-- 댓글 3 -->
    <div class="comment-item">
        <div class="comment-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="comment-nickname">박동산</span>
        </div>
        <p class="comment-text">안녕하세요! 아주 멋지네요~~~~~~ 저도 가고 싶어요~~~</p>
        <span class="comment-date">2024-11-06</span> <!-- 댓글 작성 날짜 -->
    </div>

    <!-- 댓글 4 -->
    <div class="comment-item">
        <div class="comment-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="comment-nickname">한동산</span>
        </div>
        <p class="comment-text">안녕하세요! 아주 멋지네요~~~~~~ 저도 가고 싶어요~~~</p>
        <span class="comment-date">2024-11-06</span> <!-- 댓글 작성 날짜 -->
    
</div>

    <!-- 댓글 입력 폼 -->
    <div class="comment-form">
        <textarea id="new-comment" placeholder="댓글을 남겨보세요!" rows="4"></textarea>
        <button id="submit-comment">등록</button>
    </div>
    </div>

</div>

















	