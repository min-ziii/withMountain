<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<div id="clubadd-title">모임 정보 수정 하기</div>

<form method="POST" action="" enctype="multipart/form-data"
	id="club-add-form">
	
	<div class="form-club-header">	
	<div class="form-club-content">
	<div class="form-group">
		<div>
			<label>공개 여부</label>
		</div>
		<div id="radio-private">
			<label class="chk_round"> <input type="radio" name="private"
				value="0" required> <span class="radio-btn"></span> <span
				class="label">공개</span>
			</label> 
			<label class="chk_round"> <input type="radio" name="private"
				value="1" required> <span class="radio-btn"></span> <span
				class="label">비공개</span>
			</label>
		</div>
	</div>

	
	<div class="form-group">
		<div>
			<label>모임명</label>
		</div>
		<input class="addclub_input" type="text" name="name" id="name" placeholder="모임명을 입력해 주세요."
				required>
		<span class="error-message" id="name-error"></span>
	</div>

	<div class="form-group">
		<div>
			<label>활동지역</label>
		</div>
		<select class="addclub_input" name="location_id" id="location_id" required>
				<option value="">활동지역을 선택해주세요</option>
				<c:forEach items="${locations}" var="location">
					<option value="${location.locationId}">${location.locationName}</option>
				</c:forEach>
			</select>
	</div>

	<div class="form-group">
		<div>
			<label>최대 인원수</label>
		</div>
		<input class="addclub_input" type="number" name="max_people" id="max_people" placeholder="모임 최대 인원수를 선택해주세."
				required>
	</div>
	</div>
	
	
	<div class="form-club-img">
	<div class="form-group">
		<div>
			<label>대표사진</label>
		</div>
		<div class="club-img-upload">
			<input type="file" name="image" id="image" accept="image/*"
				style="display: none;">
			<!-- <div class="inner"> -->
			<label for="image"> <img class="club-default-image"
				src="${path}/resources/static/images/club-default-image.jpg" alt="모임기본이미지">
			</label>
			<!-- </div> -->
		</div>
		<div class="preview-image"></div>
	</div>
	</div>
	</div>
	
	
	<div class="form-club-footer">
	<div class="form-group">
		<div>
			<label>모임 소개</label>
		</div>
		<textarea id="addclub_textarea"  class="addclub_input addclub_full" name="intro" maxlength="600"
				placeholder="내가 만드는 모임의 소개를 간단하게 작성해 주세요 !"></textarea>
	</div>

	<div class="form-group">
		<div>
			<label>해시 태그</label>
		</div>
		<input class="addclub_input addclub_full" type="text" name="tag" id="tag"
				placeholder="해시태그 입력(15자), (스페이스 바)를 눌러주세요.">
		<div id="addclub-tagcontent">스페이스바를 누르면 해시태그가 완성돼요. 최대 5개</div>
	</div>

	<div class="form-group" id="addclub-code">
		<div>
			<label>초대코드</label>
		</div>
			<input class="addclub_input" type="text" name="code" id="code" placeholder="초대코드는 자동으로 생성됩니다."
				required readonly>
	</div>
	
	<div class="addclub-btn-area">
		<button type="submit" id="editclub-btn" onclick="location.href='http://localhost:8090/hike/club';">모임 수정하기</button>
		<button type="submit" id="delclub-btn" onclick="location.href='http://localhost:8090/hike/club/del';">모임 삭제하기</button>
	</div>
	</div>
	
	
</form>



<script>
// 프로필 이미지 첨부
document.getElementById('image').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
            // 기본 프로필 이미지의 src를 새로운 이미지로 변경
            document.querySelector('.club-default-image').src = e.target.result;
        }
        reader.readAsDataURL(file);
    }
});


</script>



