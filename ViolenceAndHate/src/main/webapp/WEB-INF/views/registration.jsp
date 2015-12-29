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
				<form:select class="form-control input-sm" path="age" id="age"
					name="age" ng-model="age" required="true">
					<form:option value="1998"></form:option>
					<form:option value="1997"></form:option>
					<form:option value="1996"></form:option>
					<form:option value="1995"></form:option>
					<form:option value="1994"></form:option>
					<form:option value="1993"></form:option>
					<form:option value="1992"></form:option>
					<form:option value="1991"></form:option>
					<form:option value="1990"></form:option>
					<form:option value="1989"></form:option>
					<form:option value="1988"></form:option>
					<form:option value="1987"></form:option>
					<form:option value="1986"></form:option>
					<form:option value="1985"></form:option>
					<form:option value="1984"></form:option>
					<form:option value="1983"></form:option>
					<form:option value="1982"></form:option>
					<form:option value="1981"></form:option>
					<form:option value="1980"></form:option>
					<form:option value="1979"></form:option>
					<form:option value="1978"></form:option>
					<form:option value="1977"></form:option>
					<form:option value="1976"></form:option>
					<form:option value="1977"></form:option>
					<form:option value="1976"></form:option>
					<form:option value="1975"></form:option>
					<form:option value="1974"></form:option>
					<form:option value="1973"></form:option>
					<form:option value="1972"></form:option>
					<form:option value="1971"></form:option>
					<form:option value="1970"></form:option>
					<form:option value="1969"></form:option>
					<form:option value="1968"></form:option>
					<form:option value="1967"></form:option>
					<form:option value="1966"></form:option>
					<form:option value="1965"></form:option>
					<form:option value="1964"></form:option>
					<form:option value="1963"></form:option>
					<form:option value="1962"></form:option>
					<form:option value="1961"></form:option>
					<form:option value="1960"></form:option>
					<form:option value="1959"></form:option>
					<form:option value="1958"></form:option>
					<form:option value="1957"></form:option>
					<form:option value="1956"></form:option>
					<form:option value="1955"></form:option>
					<form:option value="1954"></form:option>
					<form:option value="1953"></form:option>
					<form:option value="1952"></form:option>
					<form:option value="1951"></form:option>
					<form:option value="1950"></form:option>
					</form:select>
				<span style="color: black"
					ng-show="regForm.age.$dirty && regForm.age.$invalid"> <span
					ng-show="regForm.age.$error.required">Год рождения</span>
				</span>
			</div>

			<div class="form-group">
				<label class="control-label" for="height">Рост</label>
				<form:select path="height" class="form-control input-sm"
					type="number" id="height" name="height" ng-model="height" required="true">
					<form:option value="125"></form:option>
					<form:option value="126"></form:option>
					<form:option value="127"></form:option>
					<form:option value="128"></form:option>
					<form:option value="129"></form:option>
					<form:option value="130"></form:option>
					<form:option value="131"></form:option>
					<form:option value="132"></form:option>
					<form:option value="133"></form:option>
					<form:option value="134"></form:option>
					<form:option value="135"></form:option>
					<form:option value="136"></form:option>
					<form:option value="137"></form:option>
					<form:option value="139"></form:option>
					<form:option value="140"></form:option>
					<form:option value="141"></form:option>
					<form:option value="142"></form:option>
					<form:option value="143"></form:option>
					<form:option value="144"></form:option>
					<form:option value="145"></form:option>
					<form:option value="146"></form:option>
					<form:option value="147"></form:option>
					<form:option value="148"></form:option>
					<form:option value="149"></form:option>
					<form:option value="150"></form:option>
					<form:option value="151"></form:option>
					<form:option value="152"></form:option>
					<form:option value="153"></form:option>
					<form:option value="154"></form:option>
					<form:option value="155"></form:option>
					<form:option value="156"></form:option>
					<form:option value="157"></form:option>
					<form:option value="158"></form:option>
					<form:option value="159"></form:option>
					<form:option value="160"></form:option>
					<form:option value="161"></form:option>
					<form:option value="162"></form:option>
					<form:option value="163"></form:option>
					<form:option value="164"></form:option>
					<form:option value="165"></form:option>
					<form:option value="166"></form:option>
					<form:option value="167"></form:option>
					<form:option value="168"></form:option>
					<form:option value="169"></form:option>
					<form:option value="170"></form:option>
					<form:option value="171"></form:option>
					<form:option value="172"></form:option>
					<form:option value="173"></form:option>
					<form:option value="174"></form:option>
					<form:option value="175"></form:option>
					<form:option value="176"></form:option>
					<form:option value="177"></form:option>
					<form:option value="178"></form:option>
					<form:option value="179"></form:option>
					<form:option value="180"></form:option>
					<form:option value="181"></form:option>
					<form:option value="182"></form:option>
					<form:option value="183"></form:option>
					<form:option value="184"></form:option>
					<form:option value="185"></form:option>
					<form:option value="186"></form:option>
					<form:option value="187"></form:option>
					<form:option value="188"></form:option>
					<form:option value="189"></form:option>
					<form:option value="190"></form:option>
					<form:option value="191"></form:option>
					<form:option value="192"></form:option>
					<form:option value="193"></form:option>
					<form:option value="194"></form:option>
					<form:option value="195"></form:option>
					<form:option value="196"></form:option>
					<form:option value="197"></form:option>
					<form:option value="198"></form:option>
					<form:option value="199"></form:option>
					<form:option value="200"></form:option>
					<form:option value="201"></form:option>
					<form:option value="202"></form:option>
					<form:option value="203"></form:option>
					<form:option value="204"></form:option>
					<form:option value="205"></form:option>
					<form:option value="206"></form:option>
					<form:option value="207"></form:option>
					<form:option value="208"></form:option>
					<form:option value="209"></form:option>
					<form:option value="210"></form:option>
					</form:select>
				<span style="color: black"
					ng-show="regForm.height.$dirty && regForm.height.$invalid">
					<span ng-show="regForm.height.$error.required">Введите рост</span>
				</span>
			</div>
			<div class="form-group">
				<label class="control-label">Вес</label>
				<form:select path="weight" type="number" id="weight"
					class="form-control input-sm" name="weight" ng-model="weight"
					required="true">
					<form:option value="45"></form:option>
					<form:option value="46"></form:option>
					<form:option value="47"></form:option>
					<form:option value="48"></form:option>
					<form:option value="49"></form:option>
					<form:option value="50"></form:option>
					<form:option value="51"></form:option>
					<form:option value="52"></form:option>
					<form:option value="53"></form:option>
					<form:option value="54"></form:option>
					<form:option value="55"></form:option>
					<form:option value="56"></form:option>
					<form:option value="57"></form:option>
					<form:option value="58"></form:option>
					<form:option value="59"></form:option>
					<form:option value="60"></form:option>
					<form:option value="61"></form:option>
					<form:option value="62"></form:option>
					<form:option value="63"></form:option>
					<form:option value="64"></form:option>
					<form:option value="65"></form:option>
					<form:option value="66"></form:option>
					<form:option value="67"></form:option>
					<form:option value="68"></form:option>
					<form:option value="69"></form:option>
					<form:option value="70"></form:option>
					<form:option value="71"></form:option>
					<form:option value="72"></form:option>
					<form:option value="73"></form:option>
					<form:option value="74"></form:option>
					<form:option value="75"></form:option>
					<form:option value="76"></form:option>
					<form:option value="77"></form:option>
					<form:option value="78"></form:option>
					<form:option value="79"></form:option>
					<form:option value="80"></form:option>
					<form:option value="81"></form:option>
					<form:option value="82"></form:option>
					<form:option value="83"></form:option>
					<form:option value="84"></form:option>
					<form:option value="85"></form:option>
					<form:option value="86"></form:option>
					<form:option value="87"></form:option>
					<form:option value="88"></form:option>
					<form:option value="89"></form:option>
					<form:option value="90"></form:option>
					<form:option value="91"></form:option>
					<form:option value="92"></form:option>
					<form:option value="93"></form:option>
					<form:option value="94"></form:option>
					<form:option value="95"></form:option>
					<form:option value="96"></form:option>
					<form:option value="97"></form:option>
					<form:option value="98"></form:option>
					<form:option value="99"></form:option>
					<form:option value="100"></form:option>
					<form:option value="101"></form:option>
					<form:option value="102"></form:option>
					<form:option value="103"></form:option>
					<form:option value="104"></form:option>
					<form:option value="105"></form:option>
					<form:option value="106"></form:option>
					<form:option value="107"></form:option>
					<form:option value="108"></form:option>
					<form:option value="109"></form:option>
					<form:option value="110"></form:option>
					<form:option value="111"></form:option>
					<form:option value="112"></form:option>
					<form:option value="113"></form:option>
					<form:option value="114"></form:option>
					<form:option value="115"></form:option>
					<form:option value="116"></form:option>
					<form:option value="117"></form:option>
					<form:option value="118"></form:option>
					<form:option value="119"></form:option>
					<form:option value="120"></form:option>
					</form:select>
				<span style="color: black"
					ng-show="regForm.weight.$dirty && regForm.weight.$invalid">
					<span ng-show="regForm.weight.$error.required">Введите вес</span>
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
