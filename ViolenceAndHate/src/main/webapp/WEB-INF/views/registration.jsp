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
<link
	href="<c:url value="/resources/registration/css/registration.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/demo.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/inputs/set2.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/css/fontsReg.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/css/buttonsReg.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/normalize.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>
</head>
<body class="bgrReg">
	<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>
	<h2>Регистрация</h2>
	<h5>(все поля обязательны к заполнению)</h5>
	<div id="wrapper">
		<div id="right_block">
			<a href="login"><button class="slide_from_left">Назад</button></a>

		</div>
		<div id="left_block">

			<c:url var="saveUrl" value="registration" />

			<form:form modelAttribute="users" method="POST" action="${saveUrl}"
				class="formular" ng-app="vandh" ng-controller="validateCtrlReg"
				name="regForm" novalidation="true">
				<table>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="username" class="input__field input__field--manami"
									type="text" id="input-32" name="username" ng-model="username"
									required="true" /> <label
								class="input__label input__label--manami" for="input-32">
									<span class="input__label-content input__label-content--manami">Логин</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.username.$dirty && regForm.username.$invalid">
								<span ng-show="regForm.username.$error.required">Введите
									ник</span>
						</span></td>

					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="password" class="input__field input__field--manami"
									type="password" id="input-33" name="password"
									ng-model="password" required="true" /> <label
								class="input__label input__label--manami" for="input-33">
									<span class="input__label-content input__label-content--manami">Пароль</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.password.$dirty && regForm.password.$invalid">
								<span ng-show="regForm.password.$error.required">Введите
									пароль</span>
						</span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="name" class="input__field input__field--manami"
									type="text" id="input-34" name="name" ng-model="name"
									required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Имя</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.name.$dirty && regForm.name.$invalid"> <span
								ng-show="regForm.name.$error.required">Введите имя</span></span></td>

						</td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="surname" class="input__field input__field--manami"
									type="text" id="input-34" name="surname" ng-model="surname"
									required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Фамилия</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.surname.$dirty && regForm.surname.$invalid">
								<span ng-show="regForm.surname.$error.required">Введите
									фамилию</span>
						</span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="email" class="input__field input__field--manami"
									type="email" id="input-34" name="email" ng-model="email"
									required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Email</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.email.$dirty && regForm.email.$invalid">
								<span ng-show="regForm.email.$error.required">Введите
									e-mail</span> <span ng-show="regForm.email.$error.email">Некорректный
									e-mail</span>
						</span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:select
									class="selectStyle" path="gender">
									<form:option value="Мужской"></form:option>
									<form:option value="Женский"></form:option>
								</form:select></span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="age" class="input__field input__field--manami"
									type="number" id="input-34" name="age" ng-model="age"
									min="18" max="99" required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Возраст</span>
							</label>
							</span>
							<span style="color: black"
							ng-show="regForm.age.$dirty && regForm.age.$invalid">
								<span ng-show="regForm.age.$error.required">Введите
									возраст</span>
						</span>
							 </td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="weight" class="input__field input__field--manami"
									type="number" id="input-34" name="weight" ng-model="weight"
									min="40" max="160" required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Вес</span>
							</label>
						</span><span style="color: black"
							ng-show="regForm.weight.$dirty && regForm.weight.$invalid">
								<span ng-show="regForm.weight.$error.required">Введите
									вес</span>
						</span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="height" class="input__field input__field--manami"
									type="number" id="input-34" name="height" ng-model="height"
									min="60" max="250" required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Рост</span>
							</label>
						</span>
						<span style="color: black"
							ng-show="regForm.height.$dirty && regForm.height.$invalid">
								<span ng-show="regForm.height.$error.required">Введите
									рост</span>
						</span>
						</td>
					</tr>
					<tr>
						<td><span class="input input--manami"> <form:input
									path="sport" class="input__field input__field--manami"
									type="text" id="input-34" name="sport" ng-model="sport"
									required="true" /> <label
								class="input__label input__label--manami" for="input-34">
									<span class="input__label-content input__label-content--manami">Спортивные
										навыки</span>
							</label>
						</span> <span style="color: black"
							ng-show="regForm.sport.$dirty && regForm.sport.$invalid">
								<span ng-show="regForm.sport.$error.required">Введите
									спортивные навыки</span>
						</span></td>
					</tr>
					<tr>
						<td><span class="input input--manami"><form:select
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
								</form:select></span></td>
					</tr>
					<tr>
						<td><span class="input input--manami">
								<button class="slide_from_left" type="submit"
									ng-disabled="
regForm.username.$dirty && regForm.username.$invalid ||
  regForm.password.$dirty && regForm.password.$invalid ||
  regForm.name.$dirty && regForm.name.$invalid ||
  regForm.surname.$dirty && regForm.surname.$invalid ||
  regForm.email.$dirty && regForm.email.$invalid ||
  regForm.sport.$dirty && regForm.sport.$invalid">Регистрация</button>
								<!-- <input type="submit"
						value="<spring:message text="Регистрация"/>" /> -->
						</span></td>
					</tr>
				</table>
				<form:input path="enabled" type="hidden" value="true" />
			</form:form>
		</div>
	</div>
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
