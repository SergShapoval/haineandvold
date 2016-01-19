<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<title>Войти в систему | Haine and Vold</title>
 <link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>

</head>
<style>
@font-face {
	font-family: Runic; /* Имя шрифта */
	src: url(resources/font/runic.ttf); /* Путь к файлу со шрифтом */
}

h1 {

	font-family: Runic;
	text-align: center;
	font-size: 500%;
	margin:0 auto;
	padding-left:80px;
}
</style>
<body>

<span class="text-center">
		<span class="rusLogo"><a href="?locale=ru"><img
				src="<c:url value="/resources/languageicons/rus.png"/>"
				alt="Russian Language" title="Сменить язык интерфейса на русский"></a>
				<a href="?locale=en"><img
		src="<c:url value="/resources/languageicons/usa.png"/>"
				alt="USA Language" title="Change interface language to american"></a>
				</span>
	
</span>
<h1>Haine and Vold</h1>
	<br>
	<div class="centerBlock text-center loginForm">
		<form:form method="post" action="j_spring_security_check"
			modelAttribute="users" ng-app="myApp" ng-controller="validateCtrl"
			name="myForm" novalidation="true">

			<div class="form-group">
				<div class="alert alert-error">${message}</div>
				<label class="control-label" for="username"><spring:message
						code="label.login" /></label>
				<form:input class="form-control input-sm" path="username"
					id="username" type="text" name="username" ng-model="username"
					required="true" />
				<div style="color: black"
					ng-show="myForm.username.$dirty && myForm.username.$invalid">
					<span ng-show="myForm.username.$error.required"><label><spring:message
								code="label.enterlogin" /></label></span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="password"><spring:message
						code="label.password" /></label>
				<form:input class="form-control input-sm" path="password"
					type="password" name="password" ng-model="password" id="password"
					required="true" />

				<div style="color: black"
					ng-show="myForm.password.$dirty && myForm.password.$invalid">
					<span ng-show="myForm.password.$error.required"><label><spring:message
								code="label.enterpassword" /></label></span>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-success btn-sm btn-block"
					ng-disabled="myForm.username.$dirty && myForm.username.$invalid ||
  myForm.password.$dirty && myForm.password.$invalid">
					<spring:message code="label.loginbutton" />
				</button>
			</div>

		</form:form>
	</div>
	<div class="text-center centerBlock loginForm">
		<a href="registration"><button
				class="btn btn-primary btn-sm btn-block marginbuttons">
				<spring:message code="label.regbutton" />
			</button></a>
		<a href="restorepass"><button
				class="btn btn-primary btn-sm btn-block">
				<spring:message code="label.restorepassbutton" />
			</button></a>
	</div>
	<br>



	<script>
		var app = angular.module('myApp', []);
		app.controller('validateCtrl', function($scope) {
			$scope.username = '';
			$scope.password = '';
		});
	</script>
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>