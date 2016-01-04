<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Войти в систему | Violence and Hate</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>
</head>

<body>

	<img class="img-responsive center-block"
		src="<c:url value="/resources/logo/logo.png"/>" />
	<h2 class="text-center">Введите логин и пароль для авторизации</h2>
<br>
	<div class="col-xs-4 centerBlock textCenter">
		<form:form method="post" action="j_spring_security_check"
			modelAttribute="users" ng-app="myApp" ng-controller="validateCtrl"
			name="myForm" novalidation="true">

			<div class="form-group">
			 <div class="alert alert-error">${message}</div>
				<label class="control-label" for="username">Логин</label>
				<form:input class="form-control input-sm" path="username" id="username" type="text"
					name="username" ng-model="username" required="true" />
				<div style="color: black"
					ng-show="myForm.username.$dirty && myForm.username.$invalid">
					<span ng-show="myForm.username.$error.required">Введите
						логин</span>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label" for="password">Пароль</label>
				<form:input class="form-control input-sm" path="password" type="password" name="password"
					ng-model="password" id="password" required="true" />

				<div style="color: black"
					ng-show="myForm.password.$dirty && myForm.password.$invalid">
					<span ng-show="myForm.password.$error.required">Введите
						пароль</span>
				</div>

			</div>

<div class="textCenter">
			<button type="submit" class="btn btn-success btn-sm btn-block"
				ng-disabled="myForm.username.$dirty && myForm.username.$invalid ||
  myForm.password.$dirty && myForm.password.$invalid">Войти</button></div>

		</form:form>
</div>
	<br>
	<div class="textCenter ">
	<a href="registration"><button class="btn btn-primary">Регистрация</button></a>
	<a href="restorepass"><button class="btn btn-primary">Забыли
			пароль?</button></a>
</div>


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