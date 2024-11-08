import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 13;
const MAX_ZOOM_LEVEL = 12;

$(document).ready(function () {
    const map = initMap(
        '#search-map',
        36.359086,
        127.778270,
        MIN_ZOOM_LEVEL,
        MAX_ZOOM_LEVEL);

    loadMarker(map);
    toggleAutoComplete();
});

function toggleAutoComplete() {
    const list = $('.auto-list');
    const input = $('.input-wrap');

    const resetInput = () => {
        list.hide();
        input.css('border-top-right-radius', '30px').css('border-top-left-radius', '30px');
        input.css('border-bottom-right-radius', '30px').css('border-bottom-left-radius', '30px');
    };

    const showList = () => {
        input.css('border-top-right-radius', '24px').css('border-top-left-radius', '24px');
        input.css('border-bottom-right-radius', '0px').css('border-bottom-left-radius', '0px');
        list.show();
    };

    $('.mt-search-input').on('keyup', function (event) {
        list.empty();

        if (event.target.value.length > 0) {
            const filtered = mountains.filter(({
<<<<<<< HEAD
                                                    mtmtName, mtAddress: mtmtAddress
                                                }) => mtmtName.includes(event.target.value) || mtmtAddress.includes(event.target.value));
=======
                                                    mtName, mtAddress: mtAddress
                                                }) => mtName.includes(event.target.value) || mtAddress.includes(event.target.value));
>>>>>>> 7206289000a0cf5d94e69b440c3ad7e867c25e4a


            filtered.forEach(({mtName, mtAddress, mtY, mtX, mtId: mtId}) => {
                if (list.children().length >= 5) {
                    return;
                }

                const listItem = $(`
                    <li class="list-item">
                        <h2>${mtName}</h2>
                        <p>${mtAddress}</p>
                    </li>
                `);

                listItem.on('click', () => navigateToView(mtId, mtName, mtY, mtX));

                list.append(listItem);
            });

            if (filtered.length > 0) {
                showList();
            } else {
                resetInput();
            }
        } else {
            resetInput();
        }
    })

    $(document).on('click', function (event) {
        if (!$(event.target).closest('.input-wrap').length) {
            resetInput();
            list.empty();
            $('.mt-search-input').val('');
        }
    });
}

function loadMarker(map) {
    const src = 'resources/static/images/point.svg';
    const size = new kakao.maps.Size(14, 14);
    const option = {offset: new kakao.maps.Point(0, 0)};
    const image = new kakao.maps.MarkerImage(src, size, option);
    const xAnchor = 0.3;
    const yAnchor = -1.2;

    for (let {mtId, mtY, mtX, mtName, mtAddress} of mountains) {
        const position = new kakao.maps.LatLng(mtY, mtX);
        const marker = new kakao.maps.Marker({position, image});
        const content = `<div class ="label">${mtName}</div>`;
        const customOverlay = new kakao.maps.CustomOverlay({position, content, xAnchor, yAnchor});

        kakao.maps.event.addListener(marker, 'click', () => navigateToView(mtId, mtName, mtY, mtX));

        marker.setMap(map);
        customOverlay.setMap(map);
    }
}

function navigateToView(mtId, mtName, mtY, mtX) {
    location.href = `course/view?mtId=${mtId}&mtName=${mtName}&mtY=${mtY}&mtX=${mtX}`;
<<<<<<< HEAD
}
=======
}


const DUMMY_DATA = [
    {
        mt_id: "491300504",
        name: "한라산",
        address: "제주특별자치도 서귀포시 토평동 산15-1",
        lng: 126.5322,
        lat: 33.3622
    },
    {
        mt_id: "482202301",
        name: "지리산",
        address: "경상남도 산청군 시천면 중산리 산1",
        lng: 127.7306,
        lat: 35.3337
    },
    {
        mt_id: "428302602",
        name: "설악산",
        address: "강원도 속초시 설악동 산1",
        lng: 128.4653,
        lat: 38.1197
    },
    {
        mt_id: "457300702",
        name: "덕유산",
        address: "전라북도 무주군 설천면 삼공리 산1",
        lng: 127.7747,
        lat: 35.8597
    },
    {
        mt_id: "421902201",
        name: "태백산",
        address: "강원도 태백시 소도동 산1",
        lng: 128.9167,
        lat: 37.1
    },
    {
        mt_id: "447102201",
        name: "오대산",
        address: "강원도 평창군 진부면 동산리 산1",
        lng: 128.5639,
        lat: 37.7989
    },
    {
        mt_id: "438001301",
        name: "소백산",
        address: "경상북도 영주시 풍기읍 삼가리 산1",
        lng: 128.4736,
        lat: 36.9514
    },
    {
        mt_id: "1200003",
        name: "가야산",
        address: "경상남도 합천군 가야면 치인리 산1",
        lng: 128.1167,
        lat: 35.8167
    },
    {
        mt_id: "1500001",
        name: "무등산",
        address: "광주광역시 동구 용연동 산36-1",
        lng: 126.9886,
        lat: 35.1344
    },
    {
        mt_id: "1400002",
        name: "월악산",
        address: "충청북도 제천시 한수면 송계리 산1",
        lng: 128.0833,
        lat: 36.9167
    },
    {
        mt_id: "1400003",
        name: "속리산",
        address: "충청북도 보은군 속리산면 사내리 산1",
        lng: 127.8667,
        lat: 36.5333
    },
    {
        mt_id: "1600001",
        name: "계룡산",
        address: "충청남도 공주시 반포면 학봉리 산1",
        lng: 127.2183,
        lat: 36.3464
    },
    {
        mt_id: "13",
        name: "북한산",
        address: "서울특별시 강북구 우이동 산1",
        lng: 126.9822,
        lat: 37.6594
    },
    {
        mt_id: "1500002",
        name: "내장산",
        address: "전라북도 정읍시 내장동 산97",
        lng: 126.8833,
        lat: 35.4833
    },
    {
        mt_id: "1400004",
        name: "주왕산",
        address: "경상북도 청송군 부동면 상의리 산1",
        lng: 129.1667,
        lat: 36.3833
    },
    {
        mt_id: "1300004",
        name: "치악산",
        address: "강원도 원주시 소초면 학곡리 산1",
        lng: 128.0667,
        lat: 37.3
    },
    {
        mt_id: "1300005",
        name: "가리왕산",
        address: "강원도 정선군 정선읍 회동리 산1",
        lng: 128.5644,
        lat: 37.4567
    },
    {
        mt_id: "1300006",
        name: "대암산",
        address: "강원도 인제군 서화면 서화리 산1",
        lng: 128.1167,
        lat: 38.1167
    },
    {
        mt_id: "1300007",
        name: "점봉산",
        address: "강원도 양양군 서면 오색리 산1",
        lng: 128.4667,
        lat: 38.05
    },
    {
        mt_id: "1300008",
        name: "향로봉",
        address: "강원도 고성군 간성읍 산1",
        lng: 128.35,
        lat: 38.2667
    },
    {
        mt_id: "1300009",
        name: "황병산",
        address: "강원도 태백시 창죽동 산1",
        lng: 128.9,
        lat: 37.1333
    },
    {
        mt_id: "1300010",
        name: "두타산",
        address: "강원도 삼척시 미로면 내미로리 산1",
        lng: 129.0333,
        lat: 37.1833
    },
    {
        mt_id: "1300011",
        name: "청옥산",
        address: "강원도 태백시 원동 산1",
        lng: 128.85,
        lat: 37.2833
    },
    {
        mt_id: "1400005",
        name: "도락산",
        address: "경상북도 봉화군 물야면 오전리 산1",
        lng: 128.8667,
        lat: 36.9833
    },
    {
        mt_id: "1400006",
        name: "문수산",
        address: "경상북도 영덕군 창수면 인량리 산1",
        lng: 129.2333,
        lat: 36.7333
    },
    {
        mt_id: "1400007",
        name: "황악산",
        address: "경상북도 김천시 대항면 운수리 산1",
        lng: 128.0833,
        lat: 36.1167
    },
    {
        mt_id: "1400008",
        name: "팔공산",
        address: "경상북도 칠곡군 동명면 남원리 산1",
        lng: 128.6833,
        lat: 35.9833
    },
    {
        mt_id: "1400009",
        name: "비슬산",
        address: "대구광역시 달성군 유가면 용리 산1",
        lng: 128.5167,
        lat: 35.7
    },
    {
        mt_id: "1200004",
        name: "고헌산",
        address: "경상남도 양산시 원동면 산1",
        lng: 128.9667,
        lat: 35.4333
    },
    {
        mt_id: "1200005",
        name: "신불산",
        address: "울산광역시 울주군 상북면 등억리 산1",
        lng: 129.0333,
        lat: 35.5667
    },
    {
        mt_id: "1200006",
        name: "천황산",
        address: "경상남도 산청군 시천면 덕산리 산1",
        lng: 127.6333,
        lat: 35.3833
    },
    {
        mt_id: "1500003",
        name: "백운산",
        address: "전라남도 광양시 옥룡면 동곡리 산1",
        lng: 127.6333,
        lat: 35.1
    },
    {
        mt_id: "1500004",
        name: "조계산",
        address: "전라남도 순천시 승주읍 죽학리 산1",
        lng: 127.3167,
        lat: 35
    },
    {
        mt_id: "1500005",
        name: "월출산",
        address: "전라남도 영암군 영암읍 천황사로 280-45",
        lng: 126.7,
        lat: 34.7833
    },
    {
        mt_id: "1500006",
        name: "천관산",
        address: "전라남도 장흥군 관산읍 농안리 산1",
        lng: 126.9167,
        lat: 34.5444
    },
    {
        mt_id: "1500007",
        name: "모악산",
        address: "전라북도 김제시 금산면 금산리 산1",
        lng: 127.0833,
        lat: 35.7167
    },
    {
        mt_id: "1500008",
        name: "장안산",
        address: "전라북도 장수군 장수읍 덕산리 산1",
        lng: 127.6167,
        lat: 35.65
    },
    {
        mt_id: "1500009",
        name: "운장산",
        address: "전라북도 진안군 주천면 주천리 산1",
        lng: 127.5167,
        lat: 35.7333
    },
    {
        mt_id: "1500010",
        name: "마이산",
        address: "전라북도 진안군 진안읍 단양리 산1",
        lng: 127.4167,
        lat: 35.7333
    },
    {
        mt_id: "1400010",
        name: "보석산",
        address: "충청북도 옥천군 군서면 상중리 산1",
        lng: 127.5833,
        lat: 36.2333
    },
    {
        mt_id: "1400011",
        name: "천태산",
        address: "충청북도 단양군 영춘면 상리 산1",
        lng: 127.8833,
        lat: 36.8667
    },
    {
        mt_id: "1400012",
        name: "구봉산",
        address: "충청북도 괴산군 칠성면 산1",
        lng: 127.7333,
        lat: 36.7167
    },
    {
        mt_id: "1700002",
        name: "광덕산",
        address: "경기도 평택시 진위면 동천리 산1",
        lng: 127.3167,
        lat: 37.1667
    },
    {
        mt_id: "1700003",
        name: "운악산",
        address: "경기도 포천시 화현면 산1",
        lng: 127.3333,
        lat: 37.85
    },
    {
        mt_id: "1700004",
        name: "명지산",
        address: "경기도 가평군 북면 적목리 산1",
        lng: 127.4333,
        lat: 37.95
    },
    {
        mt_id: "1700005",
        name: "화악산",
        address: "경기도 가평군 북면 화악리 산1",
        lng: 127.5167,
        lat: 37.9
    },
    {
        mt_id: "1700009",
        name: "축령산",
        address: "경기도 남양주시 수동면 외방리 산1",
        lng: 127.3167,
        lat: 37.75
    }
];

>>>>>>> 7206289000a0cf5d94e69b440c3ad7e867c25e4a
