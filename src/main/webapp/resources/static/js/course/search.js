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
            const filtered = DUMMY_DATA.filter(({
                                                    name, address
                                                }) => name.includes(event.target.value) || address.includes(event.target.value));


            filtered.forEach(({name, address, lat, lng, mt_id}) => {
                if (list.children().length >= 5) {
                    return;
                }

                const listItem = $(`
                    <li class="list-item">
                        <h2>${name}</h2>
                        <p>${address}</p>
                    </li>
                `);

                listItem.on('click', () => navigateToView(mt_id, name, lat, lng));

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

    for (let {mt_id, lat, lng, name, address} of DUMMY_DATA) {
        const position = new kakao.maps.LatLng(lat, lng);
        const marker = new kakao.maps.Marker({position, image});
        const content = `<div class ="label">${name}</div>`;
        const customOverlay = new kakao.maps.CustomOverlay({position, content, xAnchor, yAnchor});

        kakao.maps.event.addListener(marker, 'click', () => navigateToView(mt_id, name, lat, lng));

        marker.setMap(map);
        customOverlay.setMap(map);
    }
}

function navigateToView(mt_id, name, lat, lng) {
    location.href = `course/view?mt_id=${mt_id}&name=${name}&lat=${lat}&lng=${lng}`;
}

const DUMMY_DATA = [
    {lat: 35.1587, lng: 126.9159, name: "무등산", address: "광주광역시 북구 무등산로 1", mt_id: "000000001"},
    {lat: 35.5421, lng: 126.9862, name: "지리산", address: "전라남도 구례군 지리산로 100", mt_id: "000000002"},
    {lat: 37.5100, lng: 126.9883, name: "한라산", address: "제주특별자치도 제주시 한라산로 2070", mt_id: "000000003"},
    {lat: 35.4821, lng: 128.7459, name: "팔공산", address: "대구광역시 동구 팔공산로 100", mt_id: "000000004"},
    {lat: 37.6358, lng: 127.4048, name: "설악산", address: "강원도 속초시 설악산로 173", mt_id: "000000005"},
    {lat: 35.7982, lng: 128.7451, name: "소백산", address: "충청북도 영주시 소백산로 885", mt_id: "000000006"},
    {lat: 35.3375, lng: 128.6772, name: "내장산", address: "전라북도 정읍시 내장산로 80", mt_id: "000000007"},
    {lat: 35.8475, lng: 128.6893, name: "가야산", address: "경상남도 합천군 가야산로 100", mt_id: "000000008"},
    {lat: 37.2720, lng: 128.7333, name: "오대산", address: "강원도 평창군 오대산로 100", mt_id: "000000009"},
    {lat: 38.1313, lng: 128.5923, name: "한계령", address: "강원도 인제군 한계령로 100", mt_id: "000000010"},
    {lat: 37.4881, lng: 127.0119, name: "북한산", address: "경기도 고양시 북한산로 100", mt_id: "000000011"},
    {lat: 36.6090, lng: 128.0301, name: "영남알프스", address: "경상북도 청도군 영남알프스길 100", mt_id: "000000012"},
    {lat: 36.7906, lng: 127.7754, name: "계룡산", address: "충청남도 계룡시 계룡산로 100", mt_id: "000000013"},
    {lat: 35.3722, lng: 126.5985, name: "무등산", address: "광주광역시 북구 무등산로 1", mt_id: "000000014"},
    {lat: 37.1453, lng: 127.6391, name: "소백산", address: "충청북도 단양군 소백산로 100", mt_id: "000000015"},
    {lat: 35.4310, lng: 128.6181, name: "상주곶감산", address: "경상북도 상주시 상주곶감로 100", mt_id: "000000016"},
    {lat: 35.5568, lng: 126.9350, name: "전라북도 덕유산", address: "전라북도 무주군 덕유산로 100", mt_id: "000000017"},
    {lat: 35.0442, lng: 126.4655, name: "마이산", address: "전라북도 진안군 마이산로 100", mt_id: "000000018"},
    {lat: 37.4247, lng: 128.6768, name: "치악산", address: "강원도 원주시 치악산로 100", mt_id: "000000019"},
    {lat: 35.8910, lng: 128.4512, name: "무주구천동", address: "전라북도 무주군 구천동로 100", mt_id: "000000020"},
    {lat: 36.2920, lng: 127.8420, name: "월악산", address: "충청북도 제천시 월악산로 100", mt_id: "000000021"},
    {lat: 36.5575, lng: 127.1904, name: "대둔산", address: "충청남도 논산시 대둔산로 100", mt_id: "000000022"},
    {lat: 35.3633, lng: 128.0443, name: "금오산", address: "경상북도 구미시 금오산로 100", mt_id: "000000023"},
    {lat: 36.3933, lng: 127.3825, name: "덕유산", address: "전라북도 무주군 덕유산로 100", mt_id: "000000024"},
    {lat: 37.6374, lng: 128.1201, name: "설악산", address: "강원도 속초시 설악산로 100", mt_id: "000000025"},
    {lat: 35.5914, lng: 128.5691, name: "산청", address: "경상남도 산청군 산청로 100", mt_id: "000000026"},
    {lat: 36.0731, lng: 128.6048, name: "구룡산", address: "경상북도 포항시 구룡포로 100", mt_id: "000000027"},
    {lat: 37.5015, lng: 127.0220, name: "관악산", address: "서울특별시 관악구 관악로 100", mt_id: "000000028"},
    {lat: 35.6635, lng: 128.4265, name: "하동", address: "경상남도 하동군 하동로 100", mt_id: "000000029"},
    {lat: 36.0209, lng: 129.3440, name: "포항 영일대", address: "경상북도 포항시 영일대해수욕장로 100", mt_id: "000000030"},
    {lat: 35.8316, lng: 128.6335, name: "합천 가야산", address: "경상남도 합천군 가야산로 100", mt_id: "000000031"},
    {lat: 35.6377, lng: 128.0290, name: "진주", address: "경상남도 진주시 진주로 100", mt_id: "000000032"},
    {lat: 37.2075, lng: 127.3644, name: "양평", address: "경기도 양평군 양평로 100", mt_id: "000000033"},
    {lat: 35.1183, lng: 126.6872, name: "무장산", address: "전라남도 담양군 무장산로 100", mt_id: "000000034"},
    {lat: 36.6254, lng: 127.5350, name: "금강산", address: "강원도 고성군 금강산로 100", mt_id: "000000035"},
    {lat: 35.5782, lng: 128.5220, name: "남해", address: "경상남도 남해군 남해로 100", mt_id: "000000036"},
    {lat: 36.6540, lng: 127.3130, name: "대전 계룡산", address: "대전광역시 대덕구 계룡로 100", mt_id: "000000037"},
    {lat: 35.4908, lng: 128.1209, name: "창녕", address: "경상남도 창녕군 창녕읍 창녕로 100", mt_id: "000000038"},
    {lat: 37.6594, lng: 126.9822, name: "북한산", address: "경기도 고양시 덕양구 북한동", mt_id: "000000039"},
    {lat: 35.2024, lng: 126.9366, name: "전라북도 모악산", address: "전라북도 익산시 모악산로 100", mt_id: "000000040"},
    {lat: 35.6827, lng: 128.6527, name: "영천", address: "경상북도 영천시 영천로 100", mt_id: "000000041"},
    {lat: 35.7252, lng: 128.6558, name: "경주", address: "경상북도 경주 안강읍 경주로 100", mt_id: "000000042"},
    {lat: 37.2792, lng: 128.5805, name: "설악산국립공원", address: "강원도 속초시 설악산로 100", mt_id: "000000043"},
    {lat: 35.5634, lng: 128.7096, name: "하동 대봉산", address: "경상남도 하동군 대봉산로 100", mt_id: "000000044"},
    {lat: 35.9594, lng: 128.0215, name: "경북 울릉도", address: "경상북도 울릉군 울릉읍 울릉로 100", mt_id: "000000045"},
    {lat: 36.0209, lng: 129.3440, name: "포항 영일대", address: "경상북도 포항시 영일대해수욕장로 100", mt_id: "000000046"},
    {lat: 35.8316, lng: 128.6335, name: "합천 가야산", address: "경상남도 합천군 가야산로 100", mt_id: "000000047"},
    {lat: 35.6377, lng: 128.0290, name: "진주", address: "경상남도 진주시 진주로 100", mt_id: "000000048"},
    {lat: 37.2075, lng: 127.3644, name: "양평", address: "경기도 양평군 양평로 100", mt_id: "000000049"},
    {lat: 35.1183, lng: 126.6872, name: "무장산", address: "전라남도 담양군 무장산로 100", mt_id: "000000050"}
];
