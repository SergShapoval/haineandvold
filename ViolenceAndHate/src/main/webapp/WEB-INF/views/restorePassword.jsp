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
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>
</head>
<body>

		<img class="img-responsive center-block" src="<c:url value="/resources/logo/logo.png"/>" />

	<h2 class="text-center">Для восстановления пароля, введите свой E-mail</h2>
	<h5 class="text-center">(e-mail должен быть зарегистрирован на сайте)</h5>
	<br>
<div class="col-xs-4 centerBlock textCenter">
		<form:form method="POST" modelAttribute="users" action="restorepass"
			ng-app="vandh" ng-controller="validateCtrlRestorePass" name="restorePassForm"
			novalidation="true">
			<div class="form-group">
				<label class="control-label" for="email">E-mail</label>
			 <form:input placeholder="email@example.com" path="email" class="form-control input-sm"
								type="email" id="email" name="email" ng-model="email"
									required="true" /> 
					
					<div style="color: black"
							ng-show="restorePassForm.email.$dirty && restorePassForm.email.$invalid">
								<span ng-show="restorePassForm.email.$error.required">Введите
									e-mail</span> <span ng-show="restorePassForm.email.$error.email">Некорректный
									e-mail</span>
						</div>
						<br>
				<button class="btn btn-success" type="submit" ng-disabled="restorePassForm.email.$dirty && restorePassForm.email.$invalid">Получить
							пароль</button>
			</div>
		</form:form>
</div>
<br>
	<div class="text-center">
		<a href="login"><button class="btn btn-warning">Назад</button></a>
	</div>
	
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrlRestorePass', function($scope) {
			$scope.email = '';
		});
	</script>
	
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>