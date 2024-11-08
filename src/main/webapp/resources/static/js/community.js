//resources/static/js/community.js

// community.js

//----------글쓰기 툴 라이브러리
document.addEventListener("DOMContentLoaded", function() {
    // Quill 에디터 초기화
    var quill = new Quill('#content-container', {
        theme: 'snow', // 기본 테마 'snow' 사용
        modules: {
            toolbar: [
                [{ 'header': '1' }, { 'header': '2' }, 'bold', 'italic', 'underline', 'strike'],
                [{ 'list': 'ordered'}, { 'list': 'bullet' }],
                ['link', 'image']
            ]
        },
        placeholder: '내용을 작성해주세요.' // Quill 에디터의 placeholder 설정
    });

    // 폼 제출 시 Quill 에디터 내용 textarea로 복사
    const form = document.querySelector('form');
    const contentTextarea = document.querySelector('#content');
    
    if (form && contentTextarea) {
        form.onsubmit = function() {
            // Quill 에디터의 내용을 textarea에 복사
            contentTextarea.value = quill.root.innerHTML;
        };
    } else {
        console.error("폼 또는 텍스트 영역(#content)가 존재하지 않습니다.");
    }
});


// ----------좋아요 기능
/*document.addEventListener('DOMContentLoaded', function() {
    const likeIcons = document.querySelectorAll('.like-icon');
    
    likeIcons.forEach(icon => {
        icon.addEventListener('click', function() {
            const postId = this.closest('.p-post-action').dataset.postId;
            const path = '/hike';  // path를 각 클릭 이벤트 내에서 정의
            handleLike(postId, this, path);
        });
    });
});

async function handleLike(postId, iconElement, path) {
    try {
        let likes = parseInt(localStorage.getItem(`likes_${postId}`) || 0);
        const isLiked = localStorage.getItem(`liked_${postId}`) === 'true';

        if (!isLiked) {
            likes++;
            localStorage.setItem(`liked_${postId}`, 'true');
            iconElement.src = `${path}/resources/static/images/heart-filled.svg`;
        } else {
            likes--;
            localStorage.setItem(`liked_${postId}`, 'false');
            iconElement.src = `${path}/resources/static/images/heart.svg`;
        }
        
        localStorage.setItem(`likes_${postId}`, likes);
        updateLikeUI(postId, likes);
    } catch (error) {
        console.error('좋아요 처리 중 오류 발생:', error);
    }
}*/
