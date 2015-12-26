<%@page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<fmt:requestEncoding value="utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="fi">
<head>
<title>Registration Page</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
<body class="bgrReg">

	<img class="img-responsive center-block"
		src="<c:url value="/resources/logo/logo.png"/>" />

	<h2 class="text-center">Регистрация</h2>
	<h5 class="text-center">(все поля обязательны к заполнению)</h5>




	<div class="col-xs-4 centerBlock textCenter">

		<c:url var="saveUrl" value="registration" />

		<form:form modelAttribute="users" method="POST" action="${saveUrl}"
			class="formular" ng-app="vandh" ng-controller="validateCtrlReg"
			name="regForm" novalidation="true">
			<div class="form-group">
				<label class="control-label">Логин</label>

				<form:input path="username" class="form-control input-sm"
					type="text" id="username" name="username" ng-model="username"
					required="true" />
				<span style="color: black"
					ng-show="regForm.username.$dirty && regForm.username.$invalid">
					<span ng-show="regForm.username.$error.required">Введите ник</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">Пароль</label>
				<form:input path="password" class="form-control input-sm"
					type="password" id="password" name="password" ng-model="password"
					required="true" />

				<span style="color: black"
					ng-show="regForm.password.$dirty && regForm.password.$invalid">
					<span ng-show="regForm.password.$error.required">Введите
						пароль</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">Имя</label>
				<form:input path="name" class="form-control input-sm" type="text"
					id="name" name="name" ng-model="name" required="true" />
				<span style="color: black"
					ng-show="regForm.name.$dirty && regForm.name.$invalid"> <span
					ng-show="regForm.name.$error.required">Введите имя</span></span>
			</div>
			<div class="form-group">
				<label class="control-label">Фамилия</label>
				<form:input path="surname" class="form-control input-sm" type="text"
					id="surname" name="surname" ng-model="surname" required="true" />
				<span style="color: black"
					ng-show="regForm.surname.$dirty && regForm.surname.$invalid">
					<span ng-show="regForm.surname.$error.required">Введите
						фамилию</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">E-mail</label>
				<form:input class="form-control input-sm" path="email" type="email"
					id="email" name="email" ng-model="email" required="true" />
				<span style="color: black"
					ng-show="regForm.email.$dirty && regForm.email.$invalid"> <span
					ng-show="regForm.email.$error.required">Введите e-mail</span> <span
					ng-show="regForm.email.$error.email">Некорректный e-mail</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">Пол</label>
				<form:select class="form-control input-sm" path="gender">
					<form:option value="Мужской"></form:option>
					<form:option value="Женский"></form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label class="control-label" for="age">Год рождения</label>
				<form:input class="form-control input-sm" path="age" type="number"
					id="age" name="age" ng-model="age" min="18" max="99"
					required="true" />
				<span style="color: black"
					ng-show="regForm.age.$dirty && regForm.age.$invalid"> <span
					ng-show="regForm.age.$error.required">Введите возраст</span>
				</span>
			</div>

			<div class="form-group">
				<label class="control-label" for="weight">Вес</label>
				<form:input path="weight" class="form-control input-sm"
					type="number" id="weight" name="weight" ng-model="weight" min="40"
					max="160" required="true" />
				<span style="color: black"
					ng-show="regForm.weight.$dirty && regForm.weight.$invalid">
					<span ng-show="regForm.weight.$error.required">Введите вес</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">Рост</label>
				<form:input path="height" type="number" id="height"
					class="form-control input-sm" name="height" ng-model="height"
					min="60" max="250" required="true" value="60" />
				<span style="color: black"
					ng-show="regForm.height.$dirty && regForm.height.$invalid">
					<span ng-show="regForm.height.$error.required">Введите рост</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label" for="sport">Спортивные навыки</label>
				<form:input class="form-control input-sm" path="sport" type="text"
					id="sport" name="sport" ng-model="sport" required="true" />

				<span style="color: black"
					ng-show="regForm.sport.$dirty && regForm.sport.$invalid"> <span
					ng-show="regForm.sport.$error.required">Введите спортивные
						навыки</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label" for="place">Место</label>
				<form:select id="place" name="place" class="form-control input-sm"
					path="place">
					<form:option value="Дзержинский"></form:option>
					<form:option value="Киевский"></form:option>
					<form:option value="Комминтерновский"></form:option>
					<form:option value="Лененский"></form:option>
					<form:option value="Московский"></form:option>
					<form:option value="Октябрский"></form:option>
					<form:option value="Орджоникидзевский"></form:option>
					<form:option value="Фрунзенский"></form:option>
					<form:option value="Холодная гора"></form:option>
					<form:option value="Червонозаводской"></form:option>
				</form:select>
			</div>
			<button class="btn btn-success" type="submit"
				ng-disabled="
regForm.username.$dirty && regForm.username.$invalid ||
  regForm.password.$dirty && regForm.password.$invalid ||
  regForm.name.$dirty && regForm.name.$invalid ||
  regForm.surname.$dirty && regForm.surname.$invalid ||
  regForm.email.$dirty && regForm.email.$invalid ||
  regForm.sport.$dirty && regForm.sport.$invalid">Регистрация</button>


			<form:input path="enabled" type="hidden" value="false" />
		</form:form>
	</div>
	<a href="login"><button class="btn btn-warning">Назад</button></a>
	
	
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrlReg', function($scope) {
			$scope.username = '';
			$scope.password = '';
			$scope.name = '';
			$scope.surname = '';
			$scope.email = '';
			$scope.sport = '';
		});
	</script>


</body>
</html>
