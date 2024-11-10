document.addEventListener('DOMContentLoaded', function () {
    // 환경설정 팝업 관련 코드
    initializePreferencePopup();
    
    // 프로필 및 비밀번호 관련 기능 초기화
    initializeProfileAndPassword();
    
    // 탭 관련 기능 초기화
    initializeTabs();
    
    // 캘린더가 있을 때만 초기화 > 이건 지움
    initializeCalendar();
});

// 환경설정 팝업 초기화
function initializePreferencePopup() {
    if (document.querySelector('.pref-btn')) {
        $('.pref-btn').on('click', function () {
            console.log('환경설정 버튼 클릭됨');
            
            $.ajax({
                url: path + '/mypage/infoedit',
                type: 'GET',
                dataType: 'html',
                success: function (response) {
                    console.log('AJAX 응답 받음');
                    
                    if (response && response.trim().length > 0) {
                        // 전체 응답을 jQuery 객체로 변환
                        const parsedHtml = $(response);
                        // infoedit-container를 직접 찾기
                        const container = parsedHtml.filter('#infoedit-container');
                        
                        if (container.length > 0) {
                            // 컨테이너를 찾았을 경우
                            $('#popup-content').empty().append(container);
                            $('#popup').css('display', 'flex');
                            
                            // 초기화 함수 호출
                            initializeProfileAndPassword();
                            loadLocationOptions();
                        } else {
                            // 응답에서 직접 infoedit-container를 문자열로 찾기
                            const htmlString = response.toString();
                            const startIndex = htmlString.indexOf('<div id="infoedit-container">');
                            const endIndex = htmlString.indexOf('</div>    <script>') + 6;
                            
                            if (startIndex !== -1 && endIndex !== -1) {
                                const containerHtml = htmlString.substring(startIndex, endIndex);
                                $('#popup-content').empty().html(containerHtml);
                                $('#popup').css('display', 'flex');
                                
                                // 초기화 함수 호출
                                initializeProfileAndPassword();
                                loadLocationOptions();
                            } else {
                                console.error('컨테이너를 찾을 수 없습니다.');
                                alert('설정을 불러오는데 실패했습니다.');
                            }
                        }
                    } else {
                        console.error('빈 응답을 받았습니다.');
                        alert('설정을 불러오는데 실패했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    console.error('AJAX 에러:', error);
                    console.error('상태:', xhr.status);
                    console.error('응답:', xhr.responseText);
                    alert('설정을 불러오는데 실패했습니다.');
                }
            });
        });

        // 팝업 닫기 이벤트
        $(document).on('click', '.popup-close, #exit', function() {
            $('#popup').css('display', 'none');
        });

        $('#popup').on('click', function(e) {
            if (e.target === this) {
                $(this).css('display', 'none');
            }
        });
    }
}



// 프로필 이미지와 비밀번호 관련 기능 초기화
function initializeProfileAndPassword() {
    // 프로필 이미지 미리보기
    const profileImage = document.getElementById('profileImage');
    const defaultProfile = document.querySelector('.defaultprofile');

    if (profileImage) {
        profileImage.addEventListener('change', function (e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    defaultProfile.src = e.target.result;
                }
                reader.readAsDataURL(file);
            }
        });
    }

    // 비밀번호 토글 기능
    const eyeButtons = document.querySelectorAll('.eye-button');
    eyeButtons.forEach(button => {
        button.addEventListener('click', function () {
            const input = this.closest('.addon_input').querySelector('input');
            const type = input.getAttribute('type');
            input.setAttribute('type', type === 'password' ? 'text' : 'password');
        });
    });

    // 비밀번호 유효성 검사
    const password = document.getElementById('edit-password');
    const passwordConfirm = document.getElementById('password-confirm');
    if (password && passwordConfirm) {
        initializePasswordValidation(password, passwordConfirm);
    }
}

// 비밀번호 유효성 검사 초기화
function initializePasswordValidation(password, passwordConfirm) {
    const passwordError = document.getElementById('password-error');
    const passwordConfirmError = document.getElementById('password-confirm-error');

    function checkPasswords() {
        if (passwordConfirm.value.length > 0) {
            if (password.value !== passwordConfirm.value) {
                passwordConfirmError.textContent = '비밀번호가 일치하지 않습니다.';
                return false;
            } else {
                passwordConfirmError.textContent = '';
                return true;
            }
        }
        return true;
    }

    password.addEventListener('input', checkPasswords);
    passwordConfirm.addEventListener('input', checkPasswords);

    const form = document.querySelector('form');
    if (form) {
        form.addEventListener('submit', function (e) {
            if (!checkPasswords()) {
                e.preventDefault();
                return;
            }

            if (password.value.trim() === '') {
                e.preventDefault();
                passwordError.textContent = '비밀번호를 입력해주세요.';
                return;
            }

            if (passwordConfirm.value.trim() === '') {
                e.preventDefault();
                passwordConfirmError.textContent = '비밀번호 확인을 입력해주세요.';
                return;
            }
        });
    }
}

// 탭 초기화
function initializeTabs() {
    const tabButtons = document.querySelectorAll('.tab-button');
    if (tabButtons.length > 0) {
        tabButtons.forEach(tab => {
            tab.addEventListener('click', function () {
                tabButtons.forEach(t => t.classList.remove('active'));
                document.querySelectorAll('.tab-pane').forEach(content => {
                    content.classList.remove('active');
                });

                this.classList.add('active');

                const tabId = this.getAttribute('data-tab');
                const content = document.getElementById(tabId);
                if (content) {
                    content.classList.add('active');
                    loadTabContent(tabId);
                }
            });
        });

        // 기본 탭 로드
        loadTabContent('free');
    }
}

// 이하 기존 함수들은 그대로 유지 (loadTabContent, loadFreeBoard, loadPhotoBoard, loadQnA 등)

// 활동지역 수정
function loadLocationOptions() {
    $.ajax({
        url: path + '/getAllLocations.do',  // 회원가입과 동일한 URL 사용
        type: 'GET',
        success: function (locations) {
            console.log('받아온 위치 데이터:', locations);
            
            const locationSelect = $('#edit_location_id');
            locationSelect.empty();
            locationSelect.append('<option value="">활동지역을 선택해주세요</option>');
            
            locations.forEach(function (location) {
                locationSelect.append(`<option value="${location.locationId}">${location.name}</option>`);
            });
        },
        error: function () {
            alert('활동지역 정보를 불러오는데 실패했습니다.');
        }
    });
}


// 탭 콘텐츠 로드 함수들
function loadTabContent(tabId) {
    switch (tabId) {
        case 'free':
            loadFreeBoard();
            break;
        case 'photo':
            loadPhotoBoard();
            break;
        case 'qna':
            loadQnA();
            break;
    }
}

// 기존 loadFreeBoard, loadPhotoBoard, loadQnA 함수들은 그대로 유지...
// 자유게시판 로드
function loadFreeBoard() {
    const freeContent = document.getElementById('free');

    // 가상의 게시글 데이터
    const posts = [
        {
            title: '안녕하세요! 방금 가입했습니다~',
            content: '등산 좋아하는 등산러입니다.\n새롭게 가입했어요~ 잘부탁 드려요',
            nickname: '맛동산',
            date: '2024-11-05',
            likes: 2,
            comments: 4
        }
        // 필요한 만큼 데이터 추가
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


// 사진게시판 로드
function loadPhotoBoard() {
    const photoContent = document.getElementById('photo');

    // 가상의 사진 데이터
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
        }
        // 필요한 만큼 데이터 추가
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

    // 이미지 클릭 이벤트 핸들러
    photoContent.addEventListener('click', (e) => {
        if (e.target.classList.contains('p-photo-pic')) {
            const photoId = e.target.dataset.id;
            showPhotoDetail(photoId);
        }
    });
}


// Q&A 게시판 로드
function loadQnA() {
    const qnaContent = document.getElementById('qna');

    // 가상의 Q&A 데이터
    const qnaPosts = [
        {
            title: '등산복 추천해주세요!!!',
            content: '얼마전 등산을 시작한 등린이입니다!\n적당한 가격의 입문용 등산복 뭐가 괜찮을까요??',
            nickname: '맛동산',
            date: '2024-11-05',
            comments: 4
        }
        // 필요한 만큼 데이터 추가
    ];

    const boardHTML = `
        <div class="board-grid">
            <div class="qna-list">
                ${qnaPosts.map(post => `
                    <div class="qna-post">
                        <div class="qna-title">
                            <a href="#"><span class="q">Q</span> ${post.title}</a>
                        </div>
                        <div class="qna-content">${post.content}</div>
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



// 달력 띄우기 > club-view에서 다른 함수 에러나서 js연결 코드 삭제하고 가져옴
// 캘린더 초기화 함수 추가
// 달력 띄우기
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            right: 'myCustomButton, mySaveButton, prev,today,next',
            left: 'title'
        },

        locale: "ko",
        //initialDate: '2024-11-05', //달력 처음 로드될때 표시되는 날짜, default는 현재 날짜
        //editable: true,     // 드래그해서 수정 가능한지, 길게 확장도 가능
        dayMaxEvents: true, //+more 표시 전 최대 이벤트 갯수, true는 셀 높이에 의해 결정
        dayCellContent: function (arg) {
            const {date} = arg;
            return date.getDate();
        },
        events: [
            {
                title: '북한산 등반',
                start: '2024-11-07'
            }
        ],
        //일정 추가하기 작업
        customButtons: {
            myCustomButton: {
                text: "일정 추가하기",
                click: function () {
                    $('html, body').css({
                        overflow: 'hidden',
                        height: '100%'
                    });
                    $('#popupAddSchedule').css('display', 'flex');
                    $('#schedule-plus-btn').on("click", function () {
                        const eventData = {
                            title: $("#schedule-title").val(),
                            start: $("#schedule-date").val(),
                        };


                            //이벤트 추가
                            calendar.addEvent(eventData);
                            $("#popupAddSchedule").css('display', 'none');
                            $("#schedule-title").val("");
                            $("#schedule-date").val("");

                    });

                },


            },

            mySaveButton: {
                text: "일정 저장하기",
                click: async  function() {
                    if (confirm("저장하시겠습니까?")) {
                        var allEvent = calendar.getEvents();
                        const saveEvent = await axios({
                            url: "club/scheduler",
                            data: allEvent,
                        });
                    }
                },
            }

        },

        eventClick: function(calEvent, jsEvent, view) {
             console.log(calEvent);
            // console.log(typeof calEvent);
            //console.log(typeof calEvent.event.startStr);
            console.log(calEvent.event.start.constructor);
            // console.log(calEvent.event._def.title); 제목
            // console.log(calEvent.event.startStr); 날짜

            // for(let p in calEvent) {
            //     console.log(p);
            // }

            // 클릭된 일정의 데이터 가져오기
            var eventTitle = calEvent.event._def.title || '일정 제목 없음';
            var eventMonth = calEvent.event.startStr.substring(0, 10) || '날짜 정보 없음';
            var eventTime = calEvent.event.start.toLocaleTimeString() || '시간 정보 없음';

            //var time = eventDate.substring(10);
            // var time = calEvent.event.start.toLocaleTimeString();
            // console.log(time);
            //var eventTime= time.toLocaleTimeString();

            // console.log(eventDate.toLocaleString());
            // console.log(eventTime);

            // 팝업 창에 일정 정보 표시
            document.getElementById('eventTitle').innerText = eventTitle;
            document.getElementById('eventMonth').innerText = eventMonth;
            document.getElementById('eventTime').innerText = eventTime;

            // 팝업 창 띄우기
            document.getElementById('popupSchedule').style.display = 'flex';
            $('html, body').css({
                overflow: 'hidden',
                height: '100%'
            });
        }
    });

    calendar.render();

});


// --------------------------------------------------------------------------------

function detailScheduleClose() {
    document.getElementById('popupSchedule').style.display = 'none';
    $('html, body').css({
        overflow: 'visible',
        height: '100%'
    });
}

// 일정 등록 팝업창 ---------------------------------------------------------------------
function showModalSchedule() {
    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
    $('#popupAddSchedule').css('display', 'flex');
}

//팝업창 닫기
function popupCloseSchedule() {
    $('html, body').css({
        overflow: 'visible',
        height: '100%'
    });
    $('#popupAddSchedule').css('display', 'none');
}