<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>hike-project</title>
	<tiles:insertAttribute name="asset" />
	<style>
		
	</style>
</head>
<body>
	<tiles:insertAttribute name="main-menu" />

	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="main-footer" />
</body>
</html>





