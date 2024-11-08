document.addEventListener('DOMContentLoaded', function() {
    // 모든 산 버튼을 선택
    const contextPath = '${path}';
    const buttons = document.querySelectorAll('.mtnbtn');
    const mountainImage = document.getElementById('mountainImage');
    const imagePath = '/hike/resources/static/images/mtn/'; // JSP 경로 변수 사용
    
    // 각 버튼에 마우스 오버 이벤트 리스너 추가
    buttons.forEach(button => {
        button.addEventListener('mouseenter', function() {
            const mountainName = this.textContent;
            mountainImage.src = imagePath + mountainName + '.jpg';
        });
    });
    
    buttons.addEventListener('click', function() {
    const mountainName = this.textContent;
    const url = `http://localhost:8090/hike/course/view?mt_id=113050202&name=%EB%B6%81%ED%95%9C%EC%82%B0&lat=37.6594&lng=126.9822`;
    window.location.href = url;
});
    
    
});
    
const mountains = document.querySelectorAll('.img-rad');

mountains.forEach(mountain => {
    mountain.addEventListener('click', function() {
        // data-mountain 속성에서 산 이름을 가져옵니다.
        const mountainName = mountain.getAttribute('data-mountain');
        // 산 이름에 맞는 URL로 이동합니다.
        const url = `http://localhost:8090/hike/course/view?mt_id=113050202&name=%EB%B6%81%ED%95%9C%EC%82%B0&lat=37.6594&lng=126.9822`;
        window.location.href = url;
    });
});
        



