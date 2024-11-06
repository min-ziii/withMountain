export function initMap(selector, centerLat, centerLng, minZoomLevel, maxZoomLevel) {
    const MAIN_MENU_HEIGHT = parseInt($(':root').css('--main-menu-height'));
    const fullHeight = $(window).height();
    const container = $(selector);

    const options = {
        center: new kakao.maps.LatLng(centerLat, centerLng), level: minZoomLevel
    };

    container.css('height', (fullHeight - MAIN_MENU_HEIGHT) + 'px');

    const map = new kakao.maps.Map(container[0], options);

    $(".zoom-in").click(function () {
        const currentLevel = map.getLevel();
        const nextLevel = currentLevel - 1;

        if (currentLevel > maxZoomLevel) {
            map.setLevel(nextLevel);
        }
    });

    $(".zoom-out").click(function () {
        const currentLevel = map.getLevel();
        const nextLevel = currentLevel + 1;

        if (currentLevel < minZoomLevel) {
            map.setLevel(nextLevel);
        }
    });


    kakao.maps.event.addListener(map, 'zoom_changed', function () {
        const currentLevel = map.getLevel();

        if (currentLevel <= maxZoomLevel) {
            map.setLevel(maxZoomLevel);
            disableZoomIn();

        } else if (currentLevel >= minZoomLevel) {
            map.setLevel(minZoomLevel);
            disableZoomOut();
        }
    });

    return map;
}

function disableZoomOut() {
    $('.zoom-out').prop('disabled', true);
    $('.zoom-in').prop('disabled', false);
}

function disableZoomIn() {
    $('.zoom-in').prop('disabled', true);
    $('.zoom-out').prop('disabled', false);
}

export default {
    initMap
}
