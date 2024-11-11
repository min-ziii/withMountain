//resources/static/js/community.js

// community.js

//----------글쓰기 툴 라이브러리
// MutationObserver를 이용한 DOM 변화 감지 예시
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

    // MutationObserver 예시 (DOM 변경을 감지하고 실행)
    const observer = new MutationObserver(function(mutationsList, observer) {
        for (let mutation of mutationsList) {
            if (mutation.type === 'childList') {
                console.log('DOM 변경 발생:', mutation);
                // 여기서 DOM 변화가 있을 때 할 작업을 넣어줍니다.
            }
        }
    });

    // 감시할 대상 (예: #content-container)
    const contentContainer = document.getElementById('content-container');
    if (contentContainer) {
        observer.observe(contentContainer, { childList: true, subtree: true });
    }

    // 폼 제출 시 Quill 에디터 내용 textarea로 복사
    const form = document.querySelector('form');
    const contentTextarea = document.querySelector('#content');
    
    if (form && contentTextarea) {
        // 폼 제출 시 이벤트 리스너
        form.addEventListener('submit', function(event) {
            // Quill 에디터의 내용을 textarea에 복사
            contentTextarea.value = quill.root.innerHTML;
        });
    } else {
        console.error("폼 또는 텍스트 영역(#content)가 존재하지 않습니다.");
    }
});



// confirmDelete 삭제 함수
document.addEventListener('DOMContentLoaded', function () {
    const deleteButton = document.getElementById('deleteBtn');
    
    deleteButton.addEventListener('click', confirmDelete); // click 이벤트를 JavaScript로 처리
});

function confirmDelete() {
    if (confirm("정말 삭제하시겠습니까?")) {
        console.log("삭제되었습니다.");
    } else {
        console.log("삭제 취소됨");
    }
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
    
document.querySelector('.edit-post').addEventListener('click', function() {
    // content-container 안의 내용을 textarea에 복사
    var contentText = document.getElementById('content-container').innerHTML;
    document.getElementById('content').value = contentText;
    
    // value가 올바르게 설정됐는지 확인
    console.log(document.getElementById('content').value);
});
    