import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 7;
const MAX_ZOOM_LEVEL = 1;

$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const mtY = urlParams.get('mtY');
    const mtX = urlParams.get('mtX');

    const map = initMap(
        '#view-map',
        parseFloat(mtY),
        parseFloat(mtX),
        MIN_ZOOM_LEVEL,
        MAX_ZOOM_LEVEL);
});
