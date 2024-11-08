<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <link rel="stylesheet" href="${path}/resources/static/css/routes/club.css">
    <link rel="stylesheet" href="${path}/resources/static/css/inc/signup.css">
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<%-- 
    <div id="signup-container">
        <form method="POST" action="${path}/signup" enctype="multipart/form-data">
            <div class="exitButton">
                <input type="button" name="exit" id="exit" accept="image/*" style="display: none;">
                <label for="exit">
                    <img class="exitImage" src="${path}/resources/static/images/close.svg" alt="종료버튼">
                </label>
            </div>

 --%>

<!-- main.jsp나 header.jsp 등 메인메뉴가 있는 파일 -->
<button type="button" id="loginBtn" onclick="showSignupModal()">회원가입</button>

<!-- 팝업창 띄우기 -->
<div id="popup">
    <div class="window">

        <!-- 팝업 내용 여기 안에서 작업-->




    </div>
</div>


<script>
    // 비밀번호 보기/숨기기 토글
    document.querySelectorAll('.eye-button').forEach(button => {
        button.addEventListener('click', function () {
            const input = this.closest('.addon_input').querySelector('input');
            if (input.type === 'password') {
                input.type = 'text';
                this.querySelector('img').src = '${path}/resources/static/images/icon/eye-off.svg';
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

    //팝업창 띄우기
    function showModal() {
        $('html, body').css({
            overflow: 'hidden',
            height: '100%'
        });
        $('#popup').css('display', 'flex');
    }

    //팝업창 닫기
    function popupClose() {
        $('html, body').css({
            overflow: 'visible',
            height: '100%'
        });
        $('#popup').css('display', 'none');
    }

    // 로그인에서 회원가입 버튼 클릭 시 팝업 표시 함수
    function showSignupModal() {
        $.ajax({
            url: '${path}/signup',  // 회원가입 페이지 URL
            type: 'GET',
            success: function (response) {
                // 팝업 표시
                $('html, body').css({
                    overflow: 'hidden',
                    height: '100%'
                });
                $('#popup').css('display', 'flex');
            },
            error: function (xhr, status, error) {
                console.error('Error:', error);
            }
        });
    }

</script>
</body>
</html>