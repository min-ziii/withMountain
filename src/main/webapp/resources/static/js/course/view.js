import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 7;
const MAX_ZOOM_LEVEL = 1;

$(document).ready(async function () {
    const data = await loadJSON(); // For Test

    console.log(data);

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

    async function loadJSON() {
        try {
            const jsonPath = new URL('resources/static/data/mountain.json', 'http://localhost:8090/hike/');
            const response = await fetch(jsonPath); // JSON 파일 경로
            if (!response.ok) {
                throw new Error('JSON 불러오기 결과 실패');
            }
            return await response.json();
        } catch (error) {
            console.error('JSON: 불러오는 도중 실패', error);
        }
    }
});
