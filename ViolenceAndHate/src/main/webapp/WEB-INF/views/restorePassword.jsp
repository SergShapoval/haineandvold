<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Восстановление пароль | VandH</title>
<link
	href="<c:url value="/resources/restorePassword/css/restorePassword.css"/>"
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
<body class="backgRestPass">
	<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>
	<h2>Для восстановления пароля, введите свой E-mail</h2>
	<h5>(e-mail должен быть зарегистрирован на сайте)</h5>
	<div id="blockCenter">
		<form:form method="POST" modelAttribute="users" action="restorepass"
			ng-app="vandh" ng-controller="validateCtrlRestorePass" name="restorePassForm"
			novalidation="true">
			<table>
				<tr>
					<td><span class="input input--manami"> <form:input
								path="email" class="input__field input__field--manami"
								type="email" id="input-32" name="email" ng-model="email"
									required="true" /> <label
							class="input__label input__label--manami" for="input-32">
								<span class="input__label-content input__label-content--manami">E-mail</span>
						</label>
					</span>
					<div style="color: black"
							ng-show="restorePassForm.email.$dirty && restorePassForm.email.$invalid">
								<span ng-show="restorePassForm.email.$error.required">Введите
									e-mail</span> <span ng-show="restorePassForm.email.$error.email">Некорректный
									e-mail</span>
						</div>
					</td>
					
				</tr>
				<tr>
					<td><button class="slide_from_left" type="submit" ng-disabled="restorePassForm.email.$dirty && restorePassForm.email.$invalid">Получить
							пароль</button>
							</td>
				</tr>
			</table>
		</form:form>
	</div>
	<div id="buttCenter">
		<a href="login"><button class="slide_from_left">Назад</button></a>
	</div>
	
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrlRestorePass', function($scope) {
			$scope.email = '';
		});
	</script>
	
</body>
</html>