import {initMap} from './common.js';

const minZoomLevel = 6;
const maxZoomLevel = 1;

$(document).ready(function () {
    const map = initMap(
        '#view-map',
        36.359086,
        127.778270,
        minZoomLevel,
        maxZoomLevel);
});
