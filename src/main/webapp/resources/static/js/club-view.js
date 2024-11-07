// 달력 띄우기
document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar: {
            right: 'prev,today,next',
            left: 'title'
        },

        locale: "ko",
        //initialDate: '2024-11-07', //달력 처음 로드될때 표시되는 날짜, default는 현재 날짜
        //navLinks: true,     //요일이랑 날짜 클릭시 일이나 주 단위 보여주는 화면으로 넘어가는 기능
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
        ]
    });

    calendar.render();
})

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

// 모임 사진첩 사진 첨부
    // 프로필 이미지 첨부
    document.getElementById('gallery-image').addEventListener('change', function(e) {
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