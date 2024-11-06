import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 7;
const MAX_ZOOM_LEVEL = 1;

$(document).ready(function () {
    const map = initMap(
        '#view-map',
        37.6594,
        126.9822,
        minZoomLevel,
        maxZoomLevel);
});
