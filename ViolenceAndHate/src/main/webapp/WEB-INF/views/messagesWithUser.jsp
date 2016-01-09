<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Сообщения</title>
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

				<c:url var="logoutUrl" value="/j_spring_security_logout" />
				<form class="navbar-form navbar-right" action="${logoutUrl}"
					method="post">
					<button class="btn btn-default" type="submit">Выйти</button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</nav>
<h3 class="text-center">Диалог с ${userDialogWith}</h3>
<table class="table table-striped table-bordered table-condensed table-hover">
<tr>
			<th class="text-center">Сообщение</th>
			<th class="text-center colDateSize">Дата/Время</th>

		</tr>
		</table>
<div class="scrollTableMessages" id="mess">

</div>



<form:form method="POST" modelAttribute="message"
						accept-charset="utf-8" ng-app="vandh" ng-controller="validateCtrl"
						name="messageForm" novalidation="true">

<form:textarea path="text" class="form-control" rows="1" 
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
<script>
	function getMessages() {
		$.ajax({
			type : 'GET',
			url : '/app/user/mess/${iddialog}',
			success : function(r) {
				$('#mess').html(r);
				document.getElementById("mess").scrollTop = 9999;
				console.log(r);
			},
			error : function(r) {
				alert(r);
			}
		});
	}
	setInterval(getMessages, 2000);
</script>
</html>