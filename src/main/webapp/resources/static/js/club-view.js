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
                start: '2024-11-12'
            },
            {
                title: '설악산 등반',
                start: '2024-11-07'
            },
            {
                title: '한라산 등반',
                start: '2024-11-02'
            },
            {
                title: '수리산 등반',
                start: '2024-12-07'
            },
            {
                title: '광교산 등반',
                start: '2024-12-14'
            },            {
                title: '아차산 등반',
                start: '2024-10-27'
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


//사진첩 추가 팝업창 띄우기 ---------------------------------------------------------------

//팝업창 띄우기
function showModalAddGallery() {
    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
    $('#popupAddGallery').css('display', 'flex');
}

//팝업창 닫기
function popupCloseAddGallery() {
    $('html, body').css({
        overflow: 'visible',
        height: '100%'
    });
    $('#popupAddGallery').css('display', 'none');
}


// 사진첩 > 사진 클릭시 팝업창 ------------------------------------------------
function showModalImage(imageSrc, galleryDate, galleryId) {
    document.querySelector('.club-image').src = imageSrc;
    document.querySelector('.club-image-date').innerText = galleryDate;
    document.querySelector('.gallery-id').innerText = galleryId;

    $('html, body').css({
        overflow: 'hidden',
        height: '100%'
    });
    $('#popupImage').css('display', 'flex');
}

//팝업창 닫기
function ModalImageClose() {
    $('html, body').css({
        overflow: 'visible',
        height: '100%'
    });
    $('#popupImage').css('display', 'none');
}


