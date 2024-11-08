//resources/static/js/community.js

// community.js

//----------좋아요 기능
document.addEventListener('DOMContentLoaded', function() {
    // 모든 like-icon 요소 선택
    const likeIcons = document.querySelectorAll('.like-icon');
    const likeCounts = document.querySelectorAll('.like-count');

    // 각 like-icon에 클릭 이벤트 추가
    likeIcons.forEach((likeIcon, index) => {
        let count = parseInt(likeCounts[index].textContent);  // 해당 게시글의 좋아요 수 (index로 매칭)
        
        // 좋아요 아이콘 클릭 이벤트
        likeIcon.addEventListener('click', function() {
            const basePath = window.location.origin;  // 현재 페이지의 기본 URL

            // 좋아요 아이콘 색 유무
            if (likeIcon.src.includes('heart.svg')) {
                likeIcon.src = `${path}/resources/static/images/heart-fill.svg`; 
                count += 1; 
            } else {
                likeIcon.src = `${path}/resources/static/images/heart.svg`; 
                count -= 1; 
            }

            // 좋아요 수 텍스트 숫자 업데이트
            likeCounts[index].textContent = count;  
        });
    });
});


//----------삭제 알림창 띄우기
function confirmDelete() {
    // 알림창 띄우기
    alert("정말 삭제하시겠습니까?"); // 알림창에서 "확인" 버튼을 누르면 아래 코드 실행
    
    window.location.href = `${path}/community/del`;  // 해당 URL로 이동하여 서버에서 삭제 처리
}

