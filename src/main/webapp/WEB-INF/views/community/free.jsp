<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 상단 메뉴 -->

<header id="sub-menu">
	<nav>
        <ul>
            <li><a href="${path}/community">사진 게시판</a></li>
            <li class="selected"><a href="${path}/community/free">자유 게시판</a></li>
            <li><a href="${path}/community/qna">QnA</a></li>
        </ul>
    </nav>
</header>
<!-- 커뮤니티 자유 게시판 -->

<!-- 글 분류 셀렉트 박스 -->
<div class="community-header">
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

<!-- 좋아요 수, 댓글 수 -->

<div class="total">
<!-- 자유 게시판 view -->
<!-- 게시물 목록을 반복문으로 출력 -->
    <c:forEach var="board" items="${boardList}">
        <div class="free-post">
            <!-- 게시물 제목 -->
            <div class="free-title">
                <a href="${path}/community/view?cm_board_id=${board.cm_board_id}">
                    ${board.title}
                </a>
            </div>
            
            <!-- 게시물 내용 -->
            <div class="free-content">
                ${board.content}
            </div>
            
            <!-- 작성자와 작성일 -->
            <div class="free-profile">
                <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
                <span class="nickname">${board.user_id}</span> <!-- 작성자 ID -->
                <div class="post-time">${board.create_time}</div> <!-- 작성일 -->
            </div>

            <!-- 좋아요, 댓글 -->
            <div class="post-action">
                <div class="icon-item">
                    <img src="${path}/resources/static/images/heart.svg" alt="좋아요" class="like-icon">
                    <span class="like-count">${likeCount}</span> <!-- 좋아요 수 -->
                </div>
                
                <div class="icon-item">
                    <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
                    <span class="comment-count">${comments.size()}</span> <!-- 댓글 수 -->
                </div>
            </div>
        </div>
    </c:forEach>
<!-- 자유 게시판 view -->
<div class="free-post">
    <div class="free-title">
        <a href="${path}/community/view">안녕하세요! 방금 가입했습니다~</a>
    </div>
    <div class="free-content">
        등산 좋아하는 등산러입니다.
        새롭게 가입했어요~ 잘부탁 드려요
    </div>
    <div class="free-profile">
        <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
        <span class="nickname">맛동산</span>
        <div class="post-time">2024-11-05</div>
    </div>

<!-- 좋아요, 댓글 -->    
    <div class="post-action">
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



<!-- 자유 게시판 view -->
<div class="free-post">
    <div class="free-title">
        <a href="${path}/community/view">안녕하세요! 방금 가입했습니다~</a>
    </div>
    <div class="free-content">
        등산 좋아하는 등산러입니다.
        새롭게 가입했어요~ 잘부탁 드려요
    </div>
    <div class="free-profile">
        <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
        <span class="nickname">맛동산</span>
        <div class="post-time">2024-11-05</div>
    </div>

<!-- 좋아요, 댓글 -->    
    <div class="post-action">
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




<!-- 자유 게시판 view -->
<div class="free-post">
    <div class="free-title">
        <a href="${path}/community/view">안녕하세요! 방금 가입했습니다~</a>
    </div>
    <div class="free-content">
        등산 좋아하는 등산러입니다.
        새롭게 가입했어요~ 잘부탁 드려요
    </div>
    <div class="free-profile">
        <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
        <span class="nickname">맛동산</span>
        <div class="post-time">2024-11-05</div>
    </div>

<!-- 좋아요, 댓글 -->    
    <div class="post-action">
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



<!-- 자유 게시판 view -->
<div class="free-post">
    <div class="free-title">
        <a href="${path}/community/view">안녕하세요! 방금 가입했습니다~</a>
    </div>
    <div class="free-content">
        등산 좋아하는 등산러입니다.
        새롭게 가입했어요~ 잘부탁 드려요
    </div>
    <div class="free-profile">
        <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
        <span class="nickname">맛동산</span>
        <div class="post-time">2024-11-05</div>
    </div>

<!-- 좋아요, 댓글 -->    
    <div class="post-action">
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



















 



