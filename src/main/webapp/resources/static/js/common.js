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

function lockScroll() {
    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
}

function unlockScroll() {
    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
}

// 로그인에서 회원가입 버튼 클릭 시 팝업 표시 함수
function loginToSignUp() {
    closeLoginModal();
    showSignUpModal();

    // $.ajax({
    //     url: '${path}/signup',  // 회원가입 페이지 URL
    //     type: 'GET',
    //     success: function (response) {
    //         // 팝업 표시
    //         $('html, body').css({
    //             overflow: 'hidden',
    //             height: '100%'
    //         });
    //         $('#popup').css('display', 'flex');
    //     },
    //     error: function (xhr, status, error) {
    //         console.error('Error:', error);
    //     }
    // });
}
