import {date as dateFn} from './util.js'

const KEY = '1a8b2302c017758bcb693811f7c547b7';
const BUKHANSAN_LOCATION = {lng: 126.9822, lat: 35.4833}; // For Test

const ICON_SUNNY = 'sunny.png';
const ICON_CLOUD = 'cloud.png';
const ICON_RAIN = 'rain.png';
const ICON_SNOW = 'snow.png';

const WEATHER_ICON_MAP = {
    '01d' : ICON_SUNNY,
    '01n' : ICON_SUNNY,
    '02d' : ICON_CLOUD,
    '02n' : ICON_CLOUD,
    '03d' : ICON_CLOUD,
    '03n' : ICON_CLOUD,
    '04d' : ICON_CLOUD,
    '04n' : ICON_CLOUD,
    '09d' : ICON_RAIN,
    '09n' : ICON_RAIN,
    '10d' : ICON_RAIN,
    '10n' : ICON_RAIN,
    '11d' : ICON_RAIN,
    '11n' : ICON_RAIN,
    '13d' : ICON_SNOW,
    '13n' : ICON_SNOW,
    '50d' : ICON_CLOUD,
    '50n' : ICON_CLOUD
}

getWeather(BUKHANSAN_LOCATION)
    .then(weatherData => {
        console.log(weatherData);
        summarizeWeather(weatherData);
    })
    .catch(error => {
        console.error(error.message);
    });

async function getWeather({lat, lng}) {
    const response = await fetch(
        `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lng}&appid=${KEY}&units=metric&lang=kr`
    );

    if (response.ok) {
        return response.json();
    } else {
        throw new Error('날씨 정보를 가져오는 데 실패했습니다.');
    }
}

// 날짜별로 날씨 정보를 축약
function summarizeWeather(data) {
    const dailySummary = {};
    const sunriseTime = new Date(data.city.sunrise * 1000).toLocaleTimeString(); // 일출 시간
    const sunsetTime = new Date(data.city.sunset * 1000).toLocaleTimeString(); // 일몰 시간

    data.list.forEach(item => {
        const date = new Date(item.dt * 1000).toLocaleDateString(); // 날짜 변환
        const tempMin = item.main.temp_min; // 최저 기온
        const tempMax = item.main.temp_max; // 최고 기온
        const windSpeed = item.wind.speed; // 풍속
        const weatherDescription = item.weather[0].description; // 날씨 설명
        const iconId = item.weather[0].icon; // 아이콘 ID

        // 강수량 처리
        let precipitation = 0; // 기본값
        if (item.rain) {
            precipitation = item.rain["3h"] || 0; // 3시간 동안의 강수량
        }

        if (!dailySummary[date]) {
            dailySummary[date] = {
                minTemp: tempMin,
                maxTemp: tempMax,
                windSpeed: windSpeed,
                precipitation: precipitation,
                description: weatherDescription,
                iconId
            };
        } else {
            dailySummary[date].minTemp = Math.min(dailySummary[date].minTemp, tempMin);
            dailySummary[date].maxTemp = Math.max(dailySummary[date].maxTemp, tempMax);
            dailySummary[date].windSpeed = Math.max(dailySummary[date].windSpeed, windSpeed);
            dailySummary[date].precipitation += precipitation; // 누적 강수량
        }
    })

    Object.keys(dailySummary).forEach(date => {
        const minTemp = dailySummary[date].minTemp.toFixed(0);
        const maxTemp = dailySummary[date].maxTemp.toFixed(0);
        const windSpeed = dailySummary[date].windSpeed.toFixed(0);
        const precipitation = dailySummary[date].precipitation.toFixed(0);
        const iconId = dailySummary[date].iconId;
        const day = dateFn(date, 'day');

        const setDayClass = () => {
            if(day === '토') {
                return "saturday";
            } else if (day === '일') {
                return "sunday";
            }
            return "";
        }

        $('.daily-weather').append(`
                    <div class="item">
                        <div class="date-wrap">
                            <span class="date">${dateFn(date, 'MM.dd')}</span>
                            <span class=${setDayClass()}>${dateFn(date, 'day')}</span>
                        </div>
                        <img class="weather-icon" src="${'resources/static/images/' + WEATHER_ICON_MAP[iconId]}"" alt="날씨">
                        <div class="min-max-temp">
                            <span class="min">${minTemp}˚</span>
                            <span class="separator">/</span>
                            <span class="max">${maxTemp}˚</span>
                        </div>
                        <div class="detail">
                            <div class="detail-wrap">
                                <span class="detail-title">풍속</span>
                                <span class="detail-data">${windSpeed}</span>
                                <span class="detail-metric">m/s</span>
                            </div>
                            ${precipitation > 0 ? `<div class="detail-wrap">
                                <span class="detail-title">강수</span>
                                <span class="detail-data">${precipitation}</span>
                                <span class="detail-metric">mm</span>
                            </div>` : ""}
                    </div>
        `)

    });

    const today = dateFn(new Date(), 'yyyy-MM-dd ');
    $('.sunrise-time').text(dateFn(today + sunriseTime, 'HH:mm'));
    $('.sunset-time').text(dateFn(today + sunsetTime, 'HH:mm'));
}


