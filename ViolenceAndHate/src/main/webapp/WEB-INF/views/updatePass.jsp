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
<title>Восстановление пароля | Violence and Hate</title>
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

	<h2 class="text-center">Введите новый пароль</h2>

	<div class="col-xs-4 centerBlock textCenter">
		<form:form method="POST" modelAttribute="users"
			action="/app/updatepassword/${mail}" ng-app="vandh"
			ng-controller="validateCtrlUpdatePass" name="updatePassForm"
			novalidation="true">
				<div class="form-group">
			<label class="control-label" for="password">Новый пароль</label>
			<form:input class="form-control input-sm" path="password" type="password" id="password" name="password" ng-model="password"
				required="true" />
			<div style="color: black"
				ng-show="updatePassForm.password.$dirty && updatePassForm.password.$invalid">
				<span ng-show="updatePassForm.password.$error.required">Введите
					новый пароль</span>
			</div>
</div>
			<button class="btn btn-success" type="submit">Обновить пароль</button>
		
		</form:form>
	</div>
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrlUpdatePass', function($scope) {
			$scope.password = '';
		});
	</script>
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>