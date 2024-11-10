<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>redirect</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #ffffff;
        }
    </style>
    <script>
        const currentUrl = new URL(window.location.href);
        const params = currentUrl.searchParams;
        const targetParam = 'state';

        const previousPage = document.referrer;

        redirect();

        function redirect() {
            if (!previousPage) {
                alert('잘못된 접근입니다 🚧');
                return location.replace('${path}/home');
            }

            if (params.has(targetParam, 'success')) {
                return location.replace(previousPage);
            }

            if (params.has(targetParam, 'denied')) {
                alert('로그인 후 이용해주세요 😀');
                return location.replace(previousPage + '?state=denied');
            }

            if (params.has(targetParam, 'failed')) {
                alert('로그인 정보가 올바르지 않습니다 😥');
                return location.replace(previousPage + '?state=failed');
            }
        }

    </script>
</head>
<body>
</body>
</html>
