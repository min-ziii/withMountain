import {PATHS} from "./constants.js";

setActiveNavFromUrl();
$('#main-menu .log-in').click(showLoginModal);
$('#emailsignup-btn').click(loginToSignUp);

function setActiveNavFromUrl() {
    const urlPath = window.location.pathname;

    const secondPathIdx = urlPath.indexOf('/', urlPath.indexOf('/') + 1);
    const thirdPathIdx = urlPath.indexOf('/', secondPathIdx + 1);

    let result;

    if (thirdPathIdx !== -1) {
        result = urlPath.substring(secondPathIdx + 1, thirdPathIdx);
    } else {
        result = urlPath.substring(secondPathIdx + 1);
    }

    result = result.toLowerCase();

    const selectedPath = PATHS[result];

    if (selectedPath) {
        $(document).ready(function () {
            $("#nav-" + selectedPath).addClass("selected");
        })
    }
}

// 로그인 팝업창 띄우기
function showLoginModal() {
    $('#login-overlay').css('display', 'flex');
    lockScroll();
}

// 로그인 팝업창 닫기
function closeLoginModal() {
    $('#login-overlay').css('display', 'none');
    unlockScroll();
}

// 회원가입 팝업창 띄우기
function showSignUpModal() {
    $('#signup-overlay').css('display', 'flex');
    lockScroll();
}

// 회원가입 팝업창 닫기
function closeSignUpModal() {
    $('#signup-overlay').css('display', 'none');
    unlockScroll();
}

// X 이미지 클릭 이벤트 추가
$('#login-container .exitImage').click(closeLoginModal);
$('#signup-container .exitImage').click(closeSignUpModal);

function lockScroll() {
    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
}

function unlockScroll() {
    $('html, body').css({
        overflow: 'auto',	//'hidden'에서 'auto'로 수정
        height: 'auto'		//'100%'에서 'auto'로 수정
    });
}

// 로그인에서 회원가입 버튼 클릭 시 팝업 표시 함수
function loginToSignUp() {
    closeLoginModal();
    showSignUpModal();

}


// 비밀번호 보기/숨기기 토글
    document.querySelectorAll('.eye-button').forEach(button => {
        button.addEventListener('click', function () {
            const input = this.closest('.addon_input').querySelector('input');
            if (input.type === 'password') {
                input.type = 'text';
            } else {
                input.type = 'password';
                this.querySelector('img').src = '${path}/resources/static/images/icon/eye.svg';
            }
        });
    });

// 폼 제출 전 유효성 검사
    document.querySelector('form').addEventListener('submit', function (e) {
        const password = document.querySelector('#password').value;
        const passwordConfirm = document.querySelector('#password-confirm').value;

        if (password !== passwordConfirm) {
            e.preventDefault();
            document.querySelector('#password-confirm-error').textContent = '비밀번호가 일치하지 않습니다.';
            return;
        }
    });

    
// 프로필 이미지 첨부
    document.getElementById('profileImage').addEventListener('change', function (e) {
        const file = e.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = function (e) {
                // 기본 프로필 이미지의 src를 새로운 이미지로 변경
                document.querySelector('.defaultprofile').src = e.target.result;
            }
            reader.readAsDataURL(file);
        }
    });
    
// 로그아웃 버튼 클릭 이벤트 추가
$('#main-menu .log-out').click(function() {
    // 로그아웃 처리
    location.href = '${path}/logout';
});

// 로그인 버튼 클릭 이벤트는 이미 있음
$('#main-menu .log-in').click(showLoginModal);    

//이거 일단 넣어봤는데 수정할꺼야!

// 로그인
$.ajax({
    url: '/login',
    type: 'POST',
    data: {
        email: email,
        password: password
    },
    success: function(response) {
        if (response === 'success') {
            window.location.href = '/home';
        } else {
            alert(response);
        }
    }
});

// 회원가입
var formData = new FormData();
formData.append('email', email);
formData.append('password', password);
// ... 다른 필드들 추가
formData.append('profileImage', profileImageFile);

$.ajax({
    url: '/signup',
    type: 'POST',
    data: formData,
    processData: false,
    contentType: false,
    success: function(response) {
        if (response === 'success') {
            window.location.href = '/login';
        } else {
            alert(response);
        }
    }
});


