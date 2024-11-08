<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" href="${path}/resources/static/css/inc/signup.css">
</head>
<body>

 	<div id="signup-container">
    <form method="POST" action="${path}/signup" enctype="multipart/form-data">
        <div class="header">
            <h4>로그인</h4>
            <div class="exitButton">
                <input type="button" name="exit" id="exit" accept="image/*" style="display: none;">
                <label for="exit">
                    <img class="exitImage" src="${path}/resources/static/images/close.svg" alt="종료버튼">
                </label>
            </div>
        </div>
	
	<div id="signup-containerSon">
	    <div class="form-group">
	        <div><label>이메일</label></div>
	        <div class="addon_input">
	            <input type="email" name="email" id="email" placeholder="이메일을 입력해주세요" required>
	        </div>
	    </div>
	    <div class="form-group">
	        <div><label>비밀번호</label></div>
	        <div class="addon_input">
	            <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요." required>
	            <div class="addon">
	                <button type="button" class="eye-button">
	                    <img alt="보기" loading="lazy" width="20" height="15" decoding="async" src="${path}/resources/static/images/eye.svg" style="color: transparent;">
	                </button>
	            </div>
	        </div>
	        <div class="error-message-box">
	        	<span class="error-message" id="emailorpassword-confirm-error"></span>
	        </div>
	    </div>
	</div>
	
	
	<button type="submit" id="login-btn">로그인</button>
	<button type="submit" id="emailsignup-btn">✉️ 이메일 회원가입</button>
	
	<div class="divider">
    	<span> sns 계정으로 간편 로그인 </span>
	</div>
	
	<div class="logo">
		<button type="button" class="google-button">
		<img alt="구글" loading="lazy" width="20" height="15" decoding="async" src="${path}/resources/static/images/icon_google.svg" style="color: transparent;">
		</button>
		<button type="button" class="kakao-button">
		<img alt="카톡" loading="lazy" width="20" height="15" decoding="async" src="${path}/resources/static/images/icon_kakao.svg" style="color: transparent;">
		</button>
		<button type="button" class="naver-button">
		<img alt="네이버" loading="lazy" width="20" height="15" decoding="async" src="${path}/resources/static/images/icon_naver.svg" style="color: transparent;">
		</button>
	</div>
	
	</form>
	</div>


<%-- 	
	수업 내용 참고하기
	<h2>로그인</h2>
	
	<form method="POST" action="/spring/login">
	<table class="vertical">
		<tr>
			<th>아이디</th>
			<td><input type="text" name="username" required class="short"></td>
		</tr>
		<tr>
			<th>암호</th>
			<td><input type="password" name="password" required class="short"></td>
		</tr>
	</table>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div>
		<button class="in">로그인</button>
	</div>	
	</form>
 --%>	

	<script>
	// 비밀번호 보기/숨기기 토글
    document.querySelectorAll('.eye-button').forEach(button => {
        button.addEventListener('click', function() {
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

    // 프로필 이미지 미리보기
    // document.querySelector('input[name="profileImage"]').addEventListener('change', function (e) {
    //     if (e.target.files && e.target.files[0]) {
    //         const reader = new FileReader();
    //         reader.onload = function (e) {
    //             document.querySelector('.preview-image').innerHTML = '<img src="' + e.target.result + '" width="200">';
    //         }
    //         reader.readAsDataURL(e.target.files[0]);
    //     }
    // });

    // 폼 제출 전 유효성 검사
    document.querySelector('form').addEventListener('submit', function(e) {
        const password = document.querySelector('#password').value;
        const passwordConfirm = document.querySelector('#password-confirm').value;
        
        if (password !== passwordConfirm) {
            e.preventDefault();
            document.querySelector('#emailorpassword-confirm-error').textContent = '이메일 또는 비밀번호가 올바르지 않습니다.';
            return;
        }
    });
	</script>
</body>
</html>