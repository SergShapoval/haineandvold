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
	<h2>Введите новый пароль</h2>
<div id="blockCenter">
	<form:form method="POST" modelAttribute="users" action="/app/updatepassword/${mail}"
		ng-app="vandh" ng-controller="validateCtrlUpdatePass"
		name="updatePassForm" novalidation="true">
		<table>
			<tr>
				<td><span class="input input--manami"> <form:input
							path="password" class="input__field input__field--manami"
							type="password" id="input-32" name="password" ng-model="password"
							required="true" /> <label
						class="input__label input__label--manami" for="input-32">
							<span class="input__label-content input__label-content--manami">Новый пароль</span>
					</label>
				</span>
					<div style="color: black"
						ng-show="updatePassForm.password.$dirty && updatePassForm.password.$invalid">
						<span ng-show="updatePassForm.password.$error.required">Введите
							новый пароль</span>
					</div></td>

			</tr>
			<tr>
				<td><button class="slide_from_left" type="submit"
				>Обновить пароль</button>
					</td>
			</tr>

		</table>
	</form:form>
	</div>
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrlUpdatePass', function($scope) {
			$scope.password = '';
		});
	</script>
</body>
</html>