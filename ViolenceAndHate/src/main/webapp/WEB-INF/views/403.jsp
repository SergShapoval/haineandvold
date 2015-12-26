<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE HTML>
<html>
<head>
<title>403 | Violence and Hate</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
</head>
<body>
	
		<img class="img-responsive center-block" src="<c:url value="/resources/logo/logo.png"/>" />
<h2 class="text-center">Access Denied for User : <span style="color: black;">${username}</span></h2>
 <div class="textCenter">
 <a href="/app/user"><button class="btn btn-warning">Вернуться</button></a>
</div>


</body>
</html>