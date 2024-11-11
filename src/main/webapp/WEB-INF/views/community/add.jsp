<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- 커뮤니티 작성하기 -->

<!-- 이전 페이지 버튼 -->
<div class="header">
    <div class="back-page">
        <img src="${path}/resources/static/images/arrow_back.svg" class="back">
        <a onclick="location.href='${path}/community'">이전 페이지</a>
    </div>

<!-- 글 작성 카테고리 -->
    <div class="category">
        <div class="category-container"><span>카테고리</span>
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
            
            <div>
                <div id="content-container" class="content-control">
                    <!-- contenteditable로 textarea 대신 사용 -->
                    <div id="content" name="content" placeholder="내용을 작성해주세요." required contenteditable="true"></div>
                </div>
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
    // addPost 함수 정의
    function addPost() {
        // class 'ql-editor'를 가진 첫 번째 div 요소 찾기
        var contentElement = document.querySelector('.ql-editor');
        
        if (!contentElement) {
            console.error('.ql-editor 요소를 찾을 수 없습니다.');
            return;  // 요소가 없으면 함수 종료
        }

        // #content 요소가 정상적으로 로드되었는지 확인 (디버깅 로그 추가)
        console.log('contentElement:', contentElement);

        // contenteditable 영역의 내용을 텍스트로 가져와서 contentText textarea에 설정
        var contentText = contentElement.textContent; // textContent를 사용

        // hidden textarea에 복사
        $('#contentText').val(contentText);

        var hashtagsString = $('#hashtags').val();
        var hashtagsArray = hashtagsString.split(',').map(function(tag) {
            return tag.trim();  // 공백 제거
        });

        var dataToSend = {
            title: $('#title').val(),
            content: $('#contentText').val(),
            hashtags: hashtagsArray
        };

        // AJAX 요청
        $.ajax({
            url: '/hike/community/addok',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(dataToSend),
            success: function(response) {
                console.log('서버 응답:', response);
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
