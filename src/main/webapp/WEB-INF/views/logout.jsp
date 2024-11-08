<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
    <link rel="stylesheet" href="${path}/resources/static/css/inc/signup.css">
    <link rel="stylesheet" href="${path}/resources/static/css/routes/login.css">
</head>
<body>

	<!-- <h2>Member <small>logout</small></h2> -->
	
	<form method="POST" action="/hike/logout.do">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	<div>
		<button class="out">로그아웃</button> <!-- 이건 상단 바 눌렀을 떄 해야함 -->
	</div>	
	</form>


	<script>
		
	</script>
</body>
</html>