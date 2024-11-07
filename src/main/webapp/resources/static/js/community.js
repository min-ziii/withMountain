/resources/static/js/community.js

//좋아요 누르면 색 변경
document.addEventListener('DOMContentLoaded', function() {
    const likeIcon = document.querySelector('.like-icon');  // 좋아요 아이콘을 선택
    const likeCount = document.querySelector('.like-count');  // 좋아요 수를 표시하는 span

    let count = parseInt(likeCount.textContent);  // 현재 좋아요 수 (숫자)

    // 좋아요 아이콘 클릭 이벤트
    likeIcon.addEventListener('click', function() {
        const basePath = window.location.origin;  // 현재 페이지의 기본 URL (예: http://localhost:8080)

        // 좋아요 아이콘의 src 속성 변경 (기본과 채워진 하트 이미지 변경)
        if (likeIcon.src.includes('heart.svg')) {
            likeIcon.src = `${path}/resources/static/images/heart-fill.svg`;  // 클릭 시 채워진 하트로 변경
            count += 1;  // 좋아요 증가
        } else {
            likeIcon.src = `${path}/resources/static/images/heart.svg`;  // 클릭 시 빈 하트로 변경
            count -= 1;  // 좋아요 감소
        }

        // 좋아요 수 텍스트 업데이트
        likeCount.textContent = count;
    });
});
