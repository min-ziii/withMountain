import {initMap} from './common.js';

const MIN_ZOOM_LEVEL = 7;
const MAX_ZOOM_LEVEL = 1;

$(document).ready(async function () {
    const data = await loadJSON(); // For Test

    //console.log(data);

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

    // JSON형 데이터 data의 좌표값에 접근
    //console.log(data);
    //console.log(data["roadList"].length); // = 등산로 구간, 296
    //console.log(data["roadList"][0].coordList.length); // 구간 하나의 xy 좌표 수
    //console.log(data["roadList"][0].coordList[0].roadY);
    //console.log(data["roadList"][0].roadKm);
    //console.log(spotListJson[0].spotId); // 지점 데이터의 spotId
    //console.log(spotListJson);

    // 지점(Marker) 그리기
    let pointStartEnd = [];
    let pointJunction = [];
    function dividePointsBySpotType() {

        for (var i = 0; i < spotListJson.length; i++) {
            if (spotListJson[i].spotType == '시종점') {
                pointStartEnd.push(new kakao.maps.LatLng(spotListJson[i].spotY, spotListJson[i].spotX));
            } else if (spotListJson[i].spotType == '분기점') {
                pointJunction.push(new kakao.maps.LatLng(spotListJson[i].spotY, spotListJson[i].spotX));
            }
        }
    }
    dividePointsBySpotType();
    
    // 지점(시종점) 그리기
    for (var i = 0; i < pointStartEnd.length; i++) {
        var imgSrcSE = '/hike/resources/static/images/spot-startend.svg';
        var imgSizeSE = new kakao.maps.Size(16, 16);
        var markerImg = new kakao.maps.MarkerImage(imgSrcSE, imgSizeSE);
        var marker = new kakao.maps.Marker({
            map: map,
            position: pointStartEnd[i],
            image: markerImg
        });
    }
    // 지점(분기점) 그리기
    for (var i = 0; i < pointJunction.length; i++) {
        var imgSrcJ = '/hike/resources/static/images/point.svg';
        var imgSizeJ = new kakao.maps.Size(8, 8);
        var markerImg = new kakao.maps.MarkerImage(imgSrcJ, imgSizeJ);
        var marker = new kakao.maps.Marker({
            map: map,
            position: pointJunction[i],
            image: markerImg
        });
    }

    // 구간 그리기
    let lineNo = 27058; // data의 북한산 구간 번호가 27058부터 시작
    let lines = 0; // 선택된 구간의 개수
    let hikeTime = 0; // 구간 소요 시간: (상행시간 + 하행시간) / 2
    let hikeDistance = 0; // 구간 거리
    let road = [];

    for (var i = 0; i < data["roadList"].length; i++) { // 296
        road.push([]); // 2차원 배열을 만듦
        for (var j = 0; j < data["roadList"][i].coordList.length; j++) { // 구간별 길이
            road[i].push(new kakao.maps.LatLng(data["roadList"][i].coordList[j].roadY, data["roadList"][i].coordList[j].roadX));
        }
        var polyline = new kakao.maps.Polyline({
            map: map,
            path: road[i],
            strokeWeight: 5,
            strokeColor: '#ADB5BD',
            strokeOpacity: 1,
            strokeStyle: 'solid',
            lineNum: lineNo,
            hikeDistance: hikeDistance,
            hikeTime: hikeTime
        });

        polyline.setMap(map);

        let isClicked = false;

        kakao.maps.event.addListener(polyline, 'mouseover', function(mouseEvent) {
            if (!isClicked) {
                this.setOptions({
                    'strokeColor': '#343A40'
                });
            }

        });

        kakao.maps.event.addListener(polyline, 'mouseout', function(mouseEvent) {
            if (!isClicked) {
                this.setOptions({
                    'strokeColor': '#ADB5BD'
                });
            }
        });

        kakao.maps.event.addListener(polyline, 'click', (function(lineNo, i) {
            return function(mouseEvent) {
                if (isClicked) {
                    this.setOptions({
                        'strokeColor': '#343A40' // 클릭 후 다시 원래 색으로 변경
                    });

                    console.log('구간 선택이 해제되었습니다: ' + lineNo + '번 구간');

                    lines--;
                    console.log('현재 선택된 구간 수는 ' + lines + ' 개 입니다.');

                    hikeDistance -= data["roadList"][i].roadKm;
                    if (lines == 0) { hikeDistance = 0; }
                    console.log('구간 예상 거리: ' + hikeDistance + ' km');

                    hikeTime -= ((data["roadList"][i].roadTimeUp + data["roadList"][i].roadTimeDown) / 2);
                    console.log('구간 예상 소요시간: ' + hikeTime + ' 분');
                    roadData();
                } else {
                    this.setOptions({
                        'strokeColor': 'forestgreen', // 클릭하면 색 변경
                        'hikeDistance': data["roadList"][i].roadKm,
                        'hikeTime': (data["roadList"][i].roadTimeUp + data["roadList"][i].roadTimeDown) / 2
                    });
                    console.log('구간이 선택되었습니다: ' + lineNo + '번 구간');

                    lines++;
                    console.log('현재 선택된 구간 수는 ' + lines + ' 개 입니다.');

                    hikeDistance += data["roadList"][i].roadKm;
                    console.log('구간 예상 거리: ' + hikeDistance + ' km');

                    hikeTime += ((data["roadList"][i].roadTimeUp + data["roadList"][i].roadTimeDown) / 2);
                    console.log('구간 예상 소요시간: ' + hikeTime + ' 분');
                    roadData();
                }
                isClicked = !isClicked; // 토글
            };
        })(lineNo, i));  // i, polyline의 lineNo를 전달
        lineNo++;
    }

    function roadData() {
        $.ajax({
            url: 'course/view',
            type: 'POST',
            data: {
                lines: lines,
                hikeTime: hikeTime,
                hikeDistance: hikeDistance
            },
            success: function (response) {
                console.log('서버로 roadData 전송 성공', response);
            },
            error: function (error) {
                console.error('서버로 roadData 전송 실패', error);
            }
        });
    }
});
