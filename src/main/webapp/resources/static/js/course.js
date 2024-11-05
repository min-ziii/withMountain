const MIN_ZOOM_LEVEL = 13;
const MAX_ZOOM_LEVEL = 12;

$(document).ready(function () {
    const map = initMap()
    loadMarker(map);
    toggleAutoComplete();
});

function initMap() {
    const MAIN_MENU_HEIGHT = parseInt($(':root').css('--main-menu-height'));
    const fullHeight = $(window).height();
    const container = $('#search-map');

    const options = {
        center: new kakao.maps.LatLng(36.359086, 127.778270), level: MIN_ZOOM_LEVEL
    };

    container.css('height', (fullHeight - MAIN_MENU_HEIGHT) + 'px');

    const map = new kakao.maps.Map(container[0], options);

    $(".zoom-in").click(function () {
        map.setLevel(MAX_ZOOM_LEVEL);
        disableZoomIn();
    });

    $(".zoom-out").click(function () {
        map.setLevel(MIN_ZOOM_LEVEL);
        disableZoomOut();
    });

    kakao.maps.event.addListener(map, 'zoom_changed', function () {
        const currentLevel = map.getLevel();

        if (currentLevel <= MAX_ZOOM_LEVEL) {
            map.setLevel(MAX_ZOOM_LEVEL);
            disableZoomIn();


        } else if (currentLevel >= MIN_ZOOM_LEVEL) {
            map.setLevel(MIN_ZOOM_LEVEL);
            disableZoomOut();
        }
    });

    return map;
}

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


            filtered.forEach(({name, address}) => {
                if (list.children().length >= 5) {
                    return;
                }

                const listItem = $(`
                    <li class="list-item">
                        <h2>${name}</h2>
                        <p>${address}</p>
                    </li>
                `);

                listItem.on('click', function () {
                    alert(name + '\n' + address);
                });

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

function disableZoomOut() {
    $('.zoom-out').prop('disabled', true);
    $('.zoom-in').prop('disabled', false);
}

function disableZoomIn() {
    $('.zoom-in').prop('disabled', true);
    $('.zoom-out').prop('disabled', false);
}

function loadMarker(map) {
    const src = 'resources/static/images/point.svg';
    const size = new kakao.maps.Size(14, 14);
    const option = {offset: new kakao.maps.Point(27, 69)};
    const image = new kakao.maps.MarkerImage(src, size, option);
    const xAnchor = 1.2;
    const yAnchor = 4.2;

    for (let {lat, lng, name, address} of DUMMY_DATA) {
        const position = new kakao.maps.LatLng(lat, lng);
        const marker = new kakao.maps.Marker({position, image});
        const content = `<div class ="label">${name}</div>`;
        const customOverlay = new kakao.maps.CustomOverlay({position, content, xAnchor, yAnchor});

        kakao.maps.event.addListener(marker, 'click', function () {
            alert(name + '\n' + address);
        });

        marker.setMap(map);
        customOverlay.setMap(map);
    }
}

const DUMMY_DATA = [
    {lat: 35.1587, lng: 126.9159, name: "무등산", address: "광주광역시 북구 무등산로 1"},
    {lat: 36.8405, lng: 127.8655, name: "지리산", address: "전라남도 구례군 지리산"},
    {lat: 36.5743, lng: 127.4415, name: "계룡산", address: "충청남도 계룡시 계룡산"},
    {lat: 36.2828, lng: 127.2630, name: "칠갑산", address: "충청남도 청양군 칠갑산"},
    {lat: 35.6895, lng: 128.5885, name: "가야산", address: "경상남도 합천군 가야산"},
    {lat: 35.5403, lng: 129.3121, name: "연화산", address: "경상남도 양산시 연화산"},
    {lat: 37.2895, lng: 127.0369, name: "연화산", address: "경기도 가평군 연화산"},
    {lat: 36.9014, lng: 127.4911, name: "명지산", address: "충청북도 단양군 명지산"},
    {lat: 33.4995, lng: 126.5185, name: "백록담", address: "제주특별자치도 제주시 한라산 백록담"},
    {lat: 35.9078, lng: 127.7669, name: "소백산", address: "충청북도 단양군 소백산"},
    {lat: 36.5482, lng: 127.2965, name: "덕유산", address: "전라북도 무주군 덕유산"},
    {lat: 37.4563, lng: 126.7052, name: "관악산", address: "서울특별시 관악구 관악산"},
    {lat: 37.3219, lng: 126.8307, name: "청계산", address: "서울특별시 강남구 청계산"},
    {lat: 37.6655, lng: 126.8453, name: "운악산", address: "경기도 포천시 운악산"},
    {lat: 33.4507, lng: 126.5707, name: "설악산", address: "강원도 속초시 설악산"},
    {lat: 36.7644, lng: 127.2871, name: "사모산", address: "충청북도"},
    {lat: 36.3849, lng: 127.4882, name: "지장산", address: "충청남도 금산군 지장산"},
    {lat: 37.0729, lng: 126.9835, name: "주왕산", address: "경상북도 청송군 주왕산"},
    {lat: 35.5107, lng: 128.9722, name: "한재", address: "경상남도"},
    {lat: 36.6454, lng: 127.2362, name: "서대산", address: "충청남도 서산시 서대산"},
    {lat: 35.6689, lng: 128.1375, name: "태백산", address: "강원도 태백시 태백산"},
    {lat: 37.8376, lng: 126.9197, name: "구룡산", address: "경기도"},
    {lat: 36.5684, lng: 127.0115, name: "가리산", address: "충청북도"},
    {lat: 37.7285, lng: 126.7063, name: "비봉산", address: "인천광역시 강화군 비봉산"},
    {lat: 35.9945, lng: 127.5152, name: "장안산", address: "경기도 장안구 장안산"},
    {lat: 37.4814, lng: 126.9477, name: "무룡산", address: "경기도"},
    {lat: 35.1663, lng: 126.9227, name: "무등산", address: "광주광역시"},
    {lat: 37.6655, lng: 126.8453, name: "운악산", address: "경기도"},
    {lat: 36.8405, lng: 127.8655, name: "지리산", address: "전라남도"},
    {lat: 35.5107, lng: 128.9722, name: "한재", address: "경상남도"},
    {lat: 37.8376, lng: 126.9197, name: "구룡산", address: "경기도"},
    {lat: 36.9014, lng: 127.4911, name: "명지산", address: "충청북도"},
    {lat: 37.2885, lng: 127.0369, name: "연화산", address: "경기도 가평군 연화산"},
    {lat: 35.6588, lng: 128.0146, name: "태백산", address: "강원도 태백시 태백산"},
    {lat: 36.9014, lng: 127.4911, name: "명지산", address: "충청북도"},
    {lat: 36.5684, lng: 127.0115, name: "계룡산", address: "충청남도"},
    {lat: 36.7644, lng: 127.2871, name: "사모산", address: "충청북도"},
    {lat: 37.6655, lng: 126.8453, name: "운악산", address: "경기도"},
    {lat: 36.9014, lng: 127.4911, name: "명지산", address: "충청북도"}
];
