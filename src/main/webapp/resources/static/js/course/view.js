import {initMap} from './common.js';

const minZoomLevel = 7;
const maxZoomLevel = 1;

$(document).ready(function () {
    const map = initMap(
        '#view-map',
        37.6594,
        126.9822,
        minZoomLevel,
        maxZoomLevel);
});
