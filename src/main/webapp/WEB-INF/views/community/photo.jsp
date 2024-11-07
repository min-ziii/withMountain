<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 상단 메뉴 -->

<header id="sub-menu">
	<nav>
        <ul>
            <li class="selected"><a href="${path}/community">사진 게시판</a></li>
            <li><a href="${path}/community/free">자유 게시판</a></li>
            <li><a href="${path}/community/qna">QnA</a></li>
        </ul>
    </nav>
</header>

<!-- 커뮤니티 사진 게시판 -->

<!-- 글 분류 셀렉트 박스 -->
<div class="header">
	<div class="sort-container">
		<select id="sort" class="sort-select">
			<option value="latest">최신 순</option>
			<option value="comments">댓글 많은 순</option>
			<option value="likes">좋아요 많은 순</option>
		</select>
	</div>
	
<!-- 작성하기 버튼 -->	
	<div class="add-container">
		<button class="add" onclick="location.href='${path}/community/add'"> + 작성하기</button>
	</div>
</div>


<div class="total">
<!-- 사진 게시판 view -->
<div class="photo-post">
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
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    	</div>
    	<div class="photo-content">
    		<a href="${path}/community/view">경사가 있는편인데 생각보다 금방 올라가요!
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

<!-- 사진 게시판 view -->
<div class="photo-post">
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
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    	</div>
    	<div class="photo-content">
    		<a href="${path}/community/view">경사가 있는편인데 생각보다 금방 올라가요!
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




<!-- 사진 게시판 view -->
<div class="photo-post">
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
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    		<img src="${path}/resources/static/images/club-image.jpg" alt="첨부사진" class="p-photo-pic">
    	</div>
    	<div class="photo-content">
    		<a href="${path}/community/view">경사가 있는편인데 생각보다 금방 올라가요!
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
</div>




















 



