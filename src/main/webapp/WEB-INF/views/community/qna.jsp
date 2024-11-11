<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 상단 메뉴 -->

<header id="sub-menu">
	<nav>
        <ul>
            <li><a href="${path}/community">사진 게시판</a></li>
            <li><a href="${path}/community/free">자유 게시판</a></li>
            <li class="selected"><a href="${path}/community/qna">QnA</a></li>
        </ul>
    </nav>
</header>

<!-- 커뮤니티 질문 게시판 -->
	
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

<!-- 댓글 수 어떻게 -->
<div class="total">
<!-- qna 게시판 view -->
<!-- 게시물 목록을 반복문으로 출력 -->
    <c:forEach var="board" items="${boardList}">
        <div class="qna-post">
            <div class="qna-title">
                <!-- 게시물 제목 -->
                <a href="${path}/community/view?cm_board_id=${board.cm_board_id}">
                    <span class="q">Q</span> ${board.title}
                </a>
            </div>
                <!-- 게시물 내용 -->
            <div class="qna-content">
                ${board.content}
            </div>
            <div class="qna-profile">
                <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
                <span class="nickname">${board.user_id}</span> <!-- 작성자 ID -->
                <div class="post-time">${board.create_time}</div> <!-- 게시물 작성일 -->
            </div>
            
            <!-- 댓글 수 -->
            <div class="post-action">
                <div class="icon-item">
                    <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
                    <span class="comment-count">${comments.size()}</span> <!-- 댓글 수 -->
                </div>
            </div>
        </div>
    </c:forEach>
    
<!-- qna 게시판 view -->
<div class="qna-post">
    <div class="qna-title">
        <a href="${path}/community/view"><span class="q">Q</span> 등산복 추천해주세요!!!</a>
    </div>
    <div class="qna-content">
        얼마전 등산을 시작한 등린이입니다!
		적당한 가격의 입문용 등산복 뭐가 괜찮을까요??
    </div>
    <div class="qna-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="nickname">맛동산</span>
        	<div class="post-time">2024-11-05</div>
    </div>
  
<!-- 댓글 -->  
    <div class="post-action">
    <div class="icon-item">
        <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        <span class="comment-count">4</span> <!-- 댓글 수 -->
    </div>
	</div>
	
</div>




<!-- qna 게시판 view -->
<div class="qna-post">
    <div class="qna-title">
        <a href="${path}/community/view"><span class="q">Q</span> 등산복 추천해주세요!!!</a>
    </div>
    <div class="qna-content">
        얼마전 등산을 시작한 등린이입니다!
		적당한 가격의 입문용 등산복 뭐가 괜찮을까요??
    </div>
    <div class="qna-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="nickname">맛동산</span>
        	<div class="post-time">2024-11-05</div>
    </div>
  
<!-- 댓글 -->  
    <div class="post-action">
    <div class="icon-item">
        <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        <span class="comment-count">4</span> <!-- 댓글 수 -->
    </div>
	</div>
	
</div>




<!-- qna 게시판 view -->
<div class="qna-post">
    <div class="qna-title">
        <a href="${path}/community/view"><span class="q">Q</span> 등산복 추천해주세요!!!</a>
    </div>
    <div class="qna-content">
        얼마전 등산을 시작한 등린이입니다!
		적당한 가격의 입문용 등산복 뭐가 괜찮을까요??
    </div>
    <div class="qna-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="nickname">맛동산</span>
        	<div class="post-time">2024-11-05</div>
    </div>
  
<!-- 댓글 -->  
    <div class="post-action">
    <div class="icon-item">
        <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        <span class="comment-count">4</span> <!-- 댓글 수 -->
    </div>
	</div>
	
</div>




<!-- qna 게시판 view -->
<div class="qna-post">
    <div class="qna-title">
        <a href="${path}/community/view"><span class="q">Q</span> 등산복 추천해주세요!!!</a>
    </div>
    <div class="qna-content">
        얼마전 등산을 시작한 등린이입니다!
		적당한 가격의 입문용 등산복 뭐가 괜찮을까요??
    </div>
    <div class="qna-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="nickname">맛동산</span>
        	<div class="post-time">2024-11-05</div>
    </div>
  
<!-- 댓글 -->  
    <div class="post-action">
    <div class="icon-item">
        <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        <span class="comment-count">4</span> <!-- 댓글 수 -->
    </div>
	</div>
	
</div>




<!-- qna 게시판 view -->
<div class="qna-post">
    <div class="qna-title">
        <a href="${path}/community/view"><span class="q">Q</span> 등산복 추천해주세요!!!</a>
    </div>
    <div class="qna-content">
        얼마전 등산을 시작한 등린이입니다!
		적당한 가격의 입문용 등산복 뭐가 괜찮을까요??
    </div>
    <div class="qna-profile">
            <img src="${path}/resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
            <span class="nickname">맛동산</span>
        	<div class="post-time">2024-11-05</div>
    </div>
  
<!-- 댓글 -->  
    <div class="post-action">
    <div class="icon-item">
        <img src="${path}/resources/static/images/comment.svg" alt="댓글" class="comment-icon">
        <span class="comment-count">4</span> <!-- 댓글 수 -->
    </div>
	</div>
	
</div>
</div>



















 























 



