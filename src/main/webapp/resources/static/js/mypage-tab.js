// mypage-tab.js
document.addEventListener('DOMContentLoaded', function() {
    initTabs();
});

function initTabs() {
    const tabs = document.querySelectorAll('.tab-button');
    
    tabs.forEach(tab => {
        tab.addEventListener('click', handleTabClick);
    });
}

function handleTabClick() {
    // 모든 탭 비활성화
    const tabs = document.querySelectorAll('.tab-button');
    tabs.forEach(t => t.classList.remove('active'));
    
    // 모든 콘텐츠 숨기기
    document.querySelectorAll('.tab-pane').forEach(content => {
        content.classList.remove('active');
    });
    
    // 클릭한 탭 활성화
    this.classList.add('active');
    
    // 해당 콘텐츠 표시
    const tabId = this.getAttribute('data-tab');
    document.getElementById(tabId).classList.add('active');
    
    // 필요한 경우 콘텐츠 로드
    loadTabContent(tabId);
}

function loadTabContent(tabId) {
    // 각 탭에 따른 컨텐츠 로드 로직
    switch(tabId) {
        case 'free':
            loadFreeBoard();
            break;
        case 'photo':
            loadPhotoBoard();
            break;
        case 'qna':
            loadQnA();
            break;
        case 'club-photo':
            loadClubPhotos();
            break;
    }
}

// 사진게시판 내용 로드
//function loadPhotoBoard() {
//    const photoContent = document.getElementById('photo');
//    let photosHTML = '<div class="photo-grid">';  // 시작 태그
//    
//    for(let i = 1; i <= 12; i++) {
//        photosHTML += `
//            <div class="myphoto-pic">
//                <img src="./resources/static/images/club-image.jpg" alt="사진${i}" class="p-photo-pic">
//            </div>
//        `;
//    }
    
//    photosHTML += '</div>';  // 닫는 태그
//    photoContent.innerHTML = photosHTML;  // 모든 HTML을 한 번에 설정
//}

//구분선------------------------------------------------------
//사진게시판

function loadPhotoBoard() {
   const photoContent = document.getElementById('photo');
   
   // 가상의 사진 데이터 (실제로는 서버에서 받아올 데이터)
   const photoList = [
       {
           id: 1,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '등산 풍경',
           date: '2024-11-05'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       {
           id: 2,
           imageUrl: './resources/static/images/club-image.jpg',
           title: '산 정상',
           date: '2024-11-06'
       },
       // 더 많은 사진 데이터...
   ];

   const photosHTML = `
       <div class="photo-grid">
           ${photoList.map(photo => `
               <div class="myphoto-pic">
                   <img 
                       src="${photo.imageUrl}" 
                       alt="${photo.title}" 
                       class="p-photo-pic"
                       data-id="${photo.id}"
                       title="등록일: ${photo.date}"
                   >
               </div>
           `).join('')}
       </div>
   `;
   
   photoContent.innerHTML = photosHTML;

   // 선택적: 이미지 클릭 이벤트 핸들러
   photoContent.addEventListener('click', (e) => {
       if (e.target.classList.contains('p-photo-pic')) {
           const photoId = e.target.dataset.id;
           // 클릭한 사진의 상세 정보를 보여주는 함수 호출
           showPhotoDetail(photoId);
       }
   });
}

// 사진 상세 정보를 보여주는 함수 (예시)
function showPhotoDetail(photoId) {
   // 서버에서 해당 photoId의 상세 정보를 가져와서 보여주는 로직
   console.log(`사진 ID ${photoId}의 상세 정보를 보여줍니다.`);
}

// 서버로부터 데이터를 가져오는 함수 (실제 구현 시 사용)
async function fetchPhotoData() {
   try {
       // 실제 API 엔드포인트로 변경 필요
       const response = await fetch('/api/photos');
       const data = await response.json();
       
       // 데이터를 받아와서 화면에 표시
       displayPhotos(data);
   } catch (error) {
       console.error('사진 데이터를 불러오는 중 오류 발생:', error);
       // 에러 처리 로직 (예: 에러 메시지 표시)
   }
}

// 받아온 데이터를 화면에 표시하는 함수
function displayPhotos(photos) {
   const photoContent = document.getElementById('photo');
   
   const photosHTML = `
       <div class="photo-grid">
           ${photos.map(photo => `
               <div class="myphoto-pic">
                   <img 
                       src="${photo.imageUrl}" 
                       alt="${photo.title}" 
                       class="p-photo-pic"
                       data-id="${photo.id}"
                       title="등록일: ${photo.date}"
                   >
               </div>
           `).join('')}
       </div>
   `;
   
   photoContent.innerHTML = photosHTML;
}

// 페이지 로드 시 실행
document.addEventListener('DOMContentLoaded', () => {
   // 데이터 로드 함수 호출
   fetchPhotoData();
   // 또는 테스트용 더미 데이터를 사용할 경우
   // loadPhotoBoard();
});


//구분선------------------------------------------------------


// 각 탭의 콘텐츠를 로드하는 함수들	// 자유게시판 내용 로드
function loadFreeBoard() {
    const freeContent = document.getElementById('free');
    
    // 가상의 게시글 데이터 (실제로는 서버에서 받아올 수 있음)
    const posts = [
        {
            title: '안녕하세요! 방금 가입했습니다~',
            content: '등산 좋아하는 등산러입니다.\n새롭게 가입했어요~ 잘부탁 드려요',
            nickname: '맛동산',
            date: '2024-11-05',
            likes: 2,
            comments: 4
        },
        {
            title: '안녕하세요! 방금 가입했습니다~',
            content: '등산 좋아하는 등산러입니다.\n새롭게 가입했어요~ 잘부탁 드려요',
            nickname: '맛동산',
            date: '2024-11-05',
            likes: 2,
            comments: 4
        },
        {
            title: '안녕하세요! 방금 가입했습니다~',
            content: '등산 좋아하는 등산러입니다.\n새롭게 가입했어요~ 잘부탁 드려요',
            nickname: '맛동산',
            date: '2024-11-05',
            likes: 2,
            comments: 4
        },
        {
            title: '안녕하세요! 방금 가입했습니다~',
            content: '등산 좋아하는 등산러입니다.\n새롭게 가입했어요~ 잘부탁 드려요',
            nickname: '맛동산',
            date: '2024-11-05',
            likes: 2,
            comments: 4
        },
        // 더 많은 게시글 데이터...
    ];

    const boardHTML = `
    	<div class="board-grid">
        <div class="board-list">
            ${posts.map(post => `
                <div class="free-post">
                    <div class="free-title">
                        <a href="#">${post.title}</a>
                    </div>
                    <div class="free-content">${post.content}</div>
                    <div class="free-profile">
                        <img src="./resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
                        <span class="nickname">${post.nickname}</span>
                        <div class="post-time">${post.date}</div>
                    </div>
                    <div class="post-action">
                        <div class="icon-item">
                            <img src="./resources/static/images/heart.svg" alt="좋아요" class="like-icon">
                            <span class="like-count">${post.likes}</span>
                        </div>
                        <div class="icon-item">
                            <img src="./resources/static/images/comment.svg" alt="댓글" class="comment-icon">
                            <span class="comment-count">${post.comments}</span>
                        </div>
                    </div>
                </div>
            `).join('')}
        </div>
        </div>
    `;
    
    freeContent.innerHTML = boardHTML;
}



function loadQnA() {
    const qnaContent = document.getElementById('qna');
    
    // 가상의 Q&A 데이터 (실제로는 서버에서 받아올 수 있음)
    const qnaPosts = [
        {
            title: '등산복 추천해주세요!!!',
            content: '얼마전 등산을 시작한 등린이입니다!\n적당한 가격의 입문용 등산복 뭐가 괜찮을까요??',
            nickname: '맛동산',
            date: '2024-11-05',
            comments: 4
        },
        {
            title: '등산복 추천해주세요!!!',
            content: '얼마전 등산을 시작한 등린이입니다!\n적당한 가격의 입문용 등산복 뭐가 괜찮을까요??',
            nickname: '맛동산',
            date: '2024-11-05',
            comments: 4
        },
        {
            title: '등산복 추천해주세요!!!',
            content: '얼마전 등산을 시작한 등린이입니다!\n적당한 가격의 입문용 등산복 뭐가 괜찮을까요??',
            nickname: '맛동산',
            date: '2024-11-05',
            comments: 4
        },
        // 더 많은 Q&A 데이터...
    ];

    const boardHTML = `
    	<div class="board-grid">
        <div class="qna-list">
            ${qnaPosts.map(post => `
                <div class="qna-post">
                    <div class="qna-title">
                        <a href="#"><span class="q">Q</span> ${post.title}</a>
                    </div>
                    <div class="qna-content">
                        ${post.content}
                    </div>
                    <div class="qna-profile">
                        <img src="./resources/static/images/default-profile.svg" alt="프로필 사진" class="profile-pic">
                        <span class="nickname">${post.nickname}</span>
                        <div class="post-time">${post.date}</div>
                    </div>
                    <div class="post-action">
                        <div class="icon-item">
                            <img src="./resources/static/images/comment.svg" alt="댓글" class="comment-icon">
                            <span class="comment-count">${post.comments}</span>
                        </div>
                    </div>
                </div>
            `).join('')}
        </div>
        </div>
    `;
    
    qnaContent.innerHTML = boardHTML;
}


//여기는 상단바에 id줘서 해당 부분응로 이동하는 기능





