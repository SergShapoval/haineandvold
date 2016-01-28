<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML>
<html>
<head>
<title>403 | Haine and Vold</title>
<link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">s
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
</head>
<body>
<div class="container">
	<!-- <h1>Haine and Vold</h1> -->
	<img class="img-responsive logo" src="resources/logo.jpg">
</div>
	<h2 class="text-center">
		<spring:message code="label.accessdenied"/> : <span style="color: black;">${username}</span>
	</h2>
	<br>
	<div class="text-center">
		<a href="/app/user"><button class="btn btn-warning"><spring:message code="label.back"/></button></a>
	</div>


</body>
</html>