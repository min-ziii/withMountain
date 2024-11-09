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

//----------삭제 알림창 띄우기
function confirmDelete() {
    // 알림창 띄우기
    alert("정말 삭제하시겠습니까?"); // 알림창에서 "확인" 버튼을 누르면 아래 코드 실행
    
    window.location.href = `${path}/community/del`;  // 해당 URL로 이동하여 서버에서 삭제 처리
}

    // 댓글 등록
    function submitComment() {
        var commentContent = document.getElementById("new-comment").value;
        if(commentContent.trim() === "") {
            alert("댓글을 입력해주세요.");
            return;
        }
        // Ajax 요청으로 댓글 등록 처리
        // 예시로 서버로 전달하는 코드입니다.
        $.ajax({
            url: "${path}/community/addComment",
            type: "POST",
            data: {
                content: commentContent,
                boardId: "${communityBoard.cm_board_id}"
            },
            success: function(response) {
                // 댓글 등록 후, 댓글 목록을 갱신하는 로직
                alert("댓글이 등록되었습니다.");
                location.reload(); // 새로 고침 (댓글 목록 갱신)
            },
            error: function(xhr, status, error) {
                alert("댓글 등록에 실패했습니다.");
            }
        });
    }

    // 댓글 삭제
    function deleteComment(commentId) {
        if(confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
            $.ajax({
                url: "${path}/community/deleteComment",
                type: "POST",
                data: {
                    commentId: commentId
                },
                success: function(response) {
                    alert("댓글이 삭제되었습니다.");
                    location.reload(); // 새로 고침 (댓글 목록 갱신)
                },
                error: function(xhr, status, error) {
                    alert("댓글 삭제에 실패했습니다.");
                }
            });
        }
    }

    // 댓글 수정
    function editComment(commentId) {
        var newContent = prompt("수정할 댓글을 입력하세요:");
        if(newContent != null && newContent.trim() !== "") {
            $.ajax({
                url: "${path}/community/editComment",
                type: "POST",
                data: {
                    commentId: commentId,
                    newContent: newContent
                },
                success: function(response) {
                    alert("댓글이 수정되었습니다.");
                    location.reload(); // 새로 고침 (댓글 목록 갱신)
                },
                error: function(xhr, status, error) {
                    alert("댓글 수정에 실패했습니다.");
                }
            });
        }
    }
