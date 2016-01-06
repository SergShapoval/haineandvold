<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page language="java" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Пользователь ${username}</title>
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
<body class="bgrUser">
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Violence and Hate</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a href="/app/user">Профиль</a></li>
					<li><a href="/app/user/messages">Сообщения</a></li>
					<li><a href="/app/user/search">Поиск оппонента</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Информация<span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/app/user/rules">Правила</a></li>
							<li class="divider"></li>
							<li><a href="/app/user/feedback">Написать администрации</a></li>
						</ul></li>
					<security:authorize ifAnyGranted="ROLE_ADMIN">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false">Администрирование<span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/app/admin">Админка/Список пользователей</a></li>
								<li><a href="/app/admin/feedbacklist">Отзывы/Вопросы/Предложения</a></li>

							</ul></li>
					</security:authorize>
				</ul>

				<c:url var="logoutUrl" value="j_spring_security_logout" />
				<form class="navbar-form navbar-right" action="${logoutUrl}"
					method="post">
					<button class="btn btn-default" type="submit">Выйти</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</nav>

	<img class="img-responsive center-block"
		src="<c:url value="/resources/logo/logo.png"/>" />
	<h4 class="text-center">Чтобы начать диалог с пользователем ${username}, нажмите кнопку "Написать сообщение"</h4>
	<div class="panel panel-default">
<div class="panel-heading text-center">Информация о пользователе ${username}</div>

<div class="container mainBlock">
<c:forEach items="${userInfo}" var="users">
<div class="blockAva col-md-3">
<img class="fixedSizeImg" src="<c:url value="${users.photo}"/>">
</div>
<div class="blockTable col-md-8">
		<table class="tableSize table table-striped table-bordered table-condensed">
				
				<tr>
				<th>Ник</th>
				<td>${users.username}</td>
				</tr>
				<tr>
				<th>Имя</th>
				<td>${users.name}</td>
				</tr>
				<tr>
				<th>Фамилия</th>
				<td>${users.surname}</td>
				</tr>
				<tr>
				<th>E-mail</th>
				<td>${users.email}</td>
				</tr>
				<tr>
				<th>Пол</th>
				<td>${users.gender}</td>
				</tr>
				<tr>
				<th>Вес(кг)</th>
				<td>${users.weight}</td>
				</tr>
				<tr>
				<th>Рост(см)</th>
				<td>${users.height}</td>
				</tr>
				<tr>
				<th>Спортивные умения</th>
				<td>${users.sport}</td>
				</tr>
				<tr>
				<th>Место</th>
				<td>${users.place}</td>
				</tr>
					
			</table>
			</div>
			</c:forEach>
	</div>	
	</div>
	<div class="textCenter">
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#myModal">Написать сообщение</button>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<div class="textCenter">
						<h4 class="modal-title" id="myModalLabel">Написать сообщение
							пользователю ${username}</h4>
					</div>
				</div>
				<div class="modal-body">
					<label class="control-label" for="message">Введите
						сообщение</label>
					<form:form modelAttribute="message" method="POST"
						accept-charset="utf-8" ng-app="vandh" ng-controller="validateCtrl"
						name="messageForm" novalidation="true">
						<form:textarea path="text" class="form-control" rows="4"
							id="message" ng-model="message" required="true"></form:textarea>
						<div style="color: black"
							ng-show="messageForm.message.$dirty && messageForm.message.$invalid">
							<span ng-show="messageForm.message.$error.required">Введите
								сообщение</span>
						</div>
						<br>
						<div class="text-center">
						<button class="btn btn-success" type="submit">Отправить</button>
						</div>
					</form:form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>


				</div>
			</div>
		</div>
	</div>
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrl', function($scope) {
			$scope.message = '';
		});
	</script>

</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>