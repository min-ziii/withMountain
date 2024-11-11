<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 커뮤니티 작성하기 -->

<!-- 커뮤니티 작성하기 페이지 -->
<div class="community-header">
    <div class="back-page">
        <img src="${path}/resources/static/images/arrow_back.svg" class="back">
        <a onclick="location.href='${path}/community'">이전 페이지</a>
    </div>

    <!-- 글 작성 카테고리 -->
    <div class="category">
        <div class="category-container">
            <span>카테고리</span>
            <select id="category-box" class="category-select">
                <option value="photo">사진 게시판</option>
                <option value="free">자유 게시판</option>
                <option value="qna">QnA</option>
            </select>
        </div>
    </div>
</div>

<!-- 글 작성 박스 -->
<div class="content-box">
    <div class="content-form">
        <input type="text" id="title" name="title" class="content-control" placeholder="글의 제목을 입력해주세요." required>
        
        <div id="content-container" class="content-control">
            <div id="content" name="content" placeholder="내용을 작성해주세요." required contenteditable="true"></div>
        </div>
        
        <input type="text" id="hashtags" name="hashtags" class="content-control" placeholder="#해시태그">
    </div>
</div>

<!-- 실제로 전송될 textarea (숨겨짐) -->
<textarea id="contentText" name="content" style="display:none;"></textarea>

<!-- 등록 버튼 -->
<div class="post-container">
    <button type="button" class="add-post">등록하기</button>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    function addPost() {
        // 선택된 게시판 종류 값 가져오기
        var category = document.querySelector('#category-box').value;

        // contenteditable 영역의 내용을 텍스트로 가져와서 contentText textarea에 설정
        var contentElement = document.querySelector('#content');
        var contentText = contentElement.textContent;
        
        

        // 해시태그 처리
        var hashtagsString = document.querySelector('#hashtags').value;
        var hashtagsArray = hashtagsString.split(',').map(function(tag) {
            return tag.trim();
        });

        // 서버로 보낼 데이터 객체
        var dataToSend = {
            title: document.querySelector('#title').value,
            content: contentText,
            hashtags: hashtagsArray,
            type: category  // 게시판 종류 추가
        };

        // AJAX 요청
        $.ajax({
            url: '${path}/community/addok',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(dataToSend),
            success: function(response) {
                console.log('서버 응답:', response);
                // 성공 시 처리 (리디렉션 또는 알림 등)
                window.location.href = '/hike/community';
            },
            error: function(a, b, c) {
                console.log(a, b, c);
            }
        });
    }

    // "등록하기" 버튼 클릭 시 addPost 호출
    document.querySelector('button.add-post').addEventListener('click', addPost);
});
</script>
