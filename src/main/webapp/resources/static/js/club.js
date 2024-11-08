/* 플러스버튼으로 버튼 안보이게 하기*/
function plusBtnToggle() {
  
  // 토글 할 버튼 선택 (otpbtn,addbtn)
  const otpbtn = document.getElementById('club-otp-btn');
  const addbtn = document.getElementById('club-add-btn');
  
  // otpbtn,addbtn 숨기기 (visibility: hidden)
  if(otpbtn.style.visibility !== 'hidden'
  && addbtn.style.visibility !== 'hidden') {
    otpbtn.style.visibility = 'hidden';
    addbtn.style.visibility = 'hidden';
  }
  // otpbtn,addbtn 보이기 (visibility: visible)
  else {
    otpbtn.style.visibility = 'visible';
    addbtn.style.visibility = 'visible';
  }
  
}


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






