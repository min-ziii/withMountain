<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	<style>
		#map {
			width: 770px;
			height: 400px;
		}
	</style>
	
</head>
<body>
	<!-- map.jsp -->
	<h1>Kakao Map <small>GPX 데이터 출력하기</small></h1>
	
	<div>
		<div id="map"></div>
	</div>
	
	<div>${list[0].spot_x}</div> <!-- 등산로 지점 첫번째 데이터의 x좌표 -->
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.14.0/proj4.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8de9ed5ee23a0becf5c950f18bbddf4"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script>
		
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.659086, 126.978270), //지도의 중심좌표.
			level: 8 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 각 좌표계 정의
		const EPSG4326 = 'EPSG:4326'; // proj4js에 기본적으로 등록되어 있다.
		const ITRF2000TM = '+proj=tmerc +lat_0=38.0 +lon_0=127.0 +x_0=200000.0 +y_0=600000.0 +k=1.0 +ellps=GRS80 +units=m +no_defs';
		/*
			할 일
			산림청 json파일에서 좌표데이터 가져와서 지도에 그리기
			가장 먼저 할 일 : SPOT 데이터 220개를 Map API에 일단 표기.
			왜? 시작점/분기점/종료점을 사용자가 선택하게 해야 하니까.
					
			5. 가져온 좌표는 ITRF2000 기반 TM 좌표니까 KAKAO API가 사용하는 WGS84/EPSG:4326(경도lng, 위도lat) 좌표로 변환하고?
			6. KAKAO API sample '다양한 이미지 마커 생성하기'로 DETAIL_SPO가 "시종점"인지 "분기점"인지 구분해서 마커를 박고?
			
			7. SQL Developer에서 등산로 저장용 SQL을 만들어서 DB 생성하고
			8. 등산로 296개 데이터가 담긴 JSON 파일을 임의로 정제해서 넣고(수작업)
			9. MyBatis Framework를 사용한 SELECT로
			10. 등산로명(PMNTN_NM), 등산로길이(PMNTN_LT), 등산로난이도(PMNTN_DFFL),
			    등산로상행시간(PMNTN_UPPL), 등산로하행시간(PMNTN_GODN)을 가져와서?
			-문제1: 등산로명이 없는 등산로도 있음-
			11. 당연히 proj4js를 써서 ITRF2000 -> WGS84/EPSG:4326로 좌표계 변환해주고?
			12. KAKAO API sample '원, 선, 사각형, 다각형 표시하기'의 polyline 그리기로 등산로 다 그려주고?
			-문제2: 그려진 등산로 선(말그대로 그냥 지도 위에 그림임)을 사용자가 클릭하면
			해당 등산로가 선택된 상태가 되도록 구현한다-를 어떻게?-
			kakaoAPI.event.addListener(polyline, 'mouseover', function(mouseEvent) {})로 마우스 hover 되면 선택되는 것처럼 보여주고?
			kakaoAPI.event.addListener(polyline, 'mouseout', function(mouseEvent) {})로 hover 사라지면 다시 원래 선두께로 바꿔주고?
			kakaoAPI.event.addListener(polyline, 'click', function(mouseEvent) {})로 클릭이벤트 넣어서 해당 구간의 시작/종료 좌표를 따고?
			13. 사용자가 SPOT 마커를 클릭하면 미리 준비해놓은 input type="text" readonly에 마커의 좌표or이름을 넣어주고?
			-문제3: 클릭된 마커 정보가 시종점인지 경유점인지 종료점인지 프로그램이 알아서 설정을 어떻게?-
			14. 사용자가 커스텀한 등산로의 정보를 어떤 방법으로 저장해서 커스텀등산로DB에 업로드?하고? 사용자DB와 연계하고?
			15. ...
			
			
		*/
		
		let coord = [];
		
		
		/*
		for (var i = 0; i < list.length; i++) {
			coord.push(proj4(ITRF2000TM, EPSG4326, [list[i].spot_x, list[i].spot_y]));
		}
		console.log(coord);
		
		// 등산로 지점 SPOT들을 Marker로 표시할 좌표들이 들어갈 객체 배열
		var spotPositions = [];
		
		for (var i = 0; i < list.length; i++) {
			spotPositions.push({latlng: new kakao.maps.LatLng(list[i].spot_x, list[i].spot_y)});
		}
		
		var imageSrc = '/resources/static/images/spot-startend.svg';
		
		for (var i = 0; i < spotPositions.length; i++) {
			
			// Marker 이미지의 size 설정
			var imageSize = new kakao.maps.size(32, 32);
			
			// Marker 이미지 생성
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
			
			// Marker 생성

		}
		*/
		
		/* 
		let temp = [];
  		
  		for (var i = 0; i < coords4326.length; i++) {
  			temp.push(new kakao.maps.LatLng(coords4326[i][1], coords4326[i][0]));
  		}
  		
  		
		let polyline = new kakao.maps.Polyline({
			map: map,
			path: temp,
			strokeWeight: 15,
			strokeColor: '#FF2400',
			strokeStyle: 'solid'
		});
  		
		let polylinein = new kakao.maps.Polyline({
			map: map,
			path: temp,
			strokeWeight: 3,
			strokeColor: 'white',
			strokeStyle: 'dash',
			endArrow: 'true'
		});
		
		polyline.setMap(map);
		polylinein.setMap(map);
		polyline.getMap();
		*/
		
	</script>
</body>
</html>