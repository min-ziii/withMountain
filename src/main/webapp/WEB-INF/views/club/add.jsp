<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>


<h1>모임 생성 하기</h1>


<form method="POST" action="" enctype="multipart/form-data"
	id="club-add-form">
	<div class="form-group">
		<div>
			<label>공개 여부</label>
		</div>
		<div class="radio-private">
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
			<label>대표사진</label>
		</div>
		<div>
			<input id="image" type="file" name="image" accept="image/*"
				style="display: none;"> <img class="picture-logo"
				src="${path}/resources/static/images/picture.svg" alt="파일첨부">
			<p>
				<span class="color-green">0</span>/1
			</p>
		</div>
	</div>
	<div class="form-group">
		<div>
			<label>모임명</label>
		</div>
		<div class="addon_input">
			<input type="text" name="name" id="name" placeholder="모임명을 입력해 주세요."
				required>
		</div>
		<span class="error-message" id="name-error"></span>
	</div>

	<div class="form-group">
		<div>
			<label>활동지역</label>
		</div>
		<div class="addon_input">
			<select name="location_id" id="location_id" required>
				<option value="">활동지역을 선택해주세요</option>
				<c:forEach items="${locations}" var="location">
					<option value="${location.locationId}">${location.locationName}</option>
				</c:forEach>
			</select>
		</div>
	</div>

	<div class="form-group">
		<div>
			<label>최대 인원수</label>
		</div>
		<div class="addon_input">
			<input type="number" name="max_people" id="max_people" placeholder="모임 최대 인원수를 선택해주세."
				required>
		</div>
	</div>

	<div class="form-group">
		<div>
			<label>모임 소개</label>
		</div>
		<div class="addon_textarea">
			<textarea name="intro" maxlength="600"
				placeholder="내가 만드는 모임의 소개를 간단하게 작성해 주세요 !"></textarea>
		</div>
	</div>

	<div class="form-group">
		<div>
			<label>해시 태그</label>
		</div>
		<div class="addon_input">
			<input type="number" name="" id=""
				placeholder="해시태그 입력(15자), (스페이스 바)를 눌러주세요." required>
		</div>
	</div>

	<div class="form-group">
		<div>
			<label>해시 태그</label>
		</div>
		<div class="addon_input">
			<input type="text" name="code" id="code" placeholder="초대코드는 자동으로 생성됩니다."
				required>
		</div>
	</div>




</form>


