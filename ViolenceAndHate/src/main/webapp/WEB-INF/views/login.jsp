<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<link href="<c:url value="/resources/login/css/login.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/demo.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/set1.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/css/buttonsReg.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/normalize.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>
</head>

<body class="bgrLogin">
	<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />

	</div>
	<div id="formLogin">
		<form:form method="post" action="j_spring_security_check"
			modelAttribute="users" ng-app="myApp" ng-controller="validateCtrl"
			name="myForm" novalidation="true">
			<tr>
				<td><span class="errorMessage">${message}</span> <span
					class="input input--manami"> <form:input path="username"
							class="input__field input__field--manami" type="text"
							id="input-32" name="username" ng-model="username" required="true" />
						<label class="input__label input__label--manami" for="input-32">
							<span class="input__label-content input__label-content--manami">Логин</span>
					</label>
					<div style="color: black"
					ng-show="myForm.username.$dirty && myForm.username.$invalid"> <span
						ng-show="myForm.username.$error.required">Введите логин</span></div>
				</span> </td>
			</tr>

			<tr>
				<td><span class="input input--manami"> <form:input
							path="password" class="input__field input__field--manami"
							type="password" id="input-33" name="password" ng-model="password"
							required="true" /> <label
						class="input__label input__label--manami" for="input-33">
							<span class="input__label-content input__label-content--manami">Пароль</span>
					</label>
						<span style="color:black" ng-show="myForm.password.$dirty && myForm.password.$invalid">
  <span ng-show="myForm.password.$error.required">Введите пароль</span></span>
				</span>
			
				</td>
				
			</tr>



			<!-- <input class="buttonLogin" type="submit" value="Войти" /> -->
			<button type="submit" class="slide_from_left buttLogin"
				ng-disabled="myForm.username.$dirty && myForm.username.$invalid ||
  myForm.password.$dirty && myForm.password.$invalid">Войти</button>
		</form:form>
	
		<a href="registration"><button class="slide_from_left">Регистрация</button></a>
		<a href="restorepass"><button class="slide_from_left">Забыли пароль?</button></a>
	</div>


		<script>
		var app = angular.module('myApp', []);
		app.controller('validateCtrl', function($scope) {
			$scope.username = '';
			$scope.password = '';
		});
	</script>
</body>
</html>