import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 7;
const MAX_ZOOM_LEVEL = 1;

$(document).ready(function () {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const lat = urlParams.get('lat');
    const lng = urlParams.get('lng');

    const map = initMap(
        '#view-map',
        parseFloat(lat),
        parseFloat(lng),
        MIN_ZOOM_LEVEL,
        MAX_ZOOM_LEVEL);
});
