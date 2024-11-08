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
                                                    mtName, mtAddress: mtAddress
                                                }) => mtName.includes(event.target.value) || mtAddress.includes(event.target.value));


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
}
