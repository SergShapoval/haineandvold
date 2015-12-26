<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<fmt:requestEncoding value="utf-8" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Написать отзыв | Violence and Hate</title>

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
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Violence and Hate</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       
   <li><a href="/app/user">Профиль</a></li>
<li><a href="/app/user/messages">Сообщения</a></li>
<li><a href="/app/user/search">Поиск оппонента</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Информация<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/app/user/rules">Правила</a></li>
            <li><a href="/app/user/contacts">Наши контакты</a></li>
            <li class="divider"></li>
            <li><a href="/app/user/feedback">Написать администрации</a></li>
          </ul>
        </li>
        <security:authorize ifAnyGranted="ROLE_ADMIN">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Администрирование<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/app/admin">Админка/Список пользователей</a></li>
            <li><a href="/app/admin/feedbacklist">Отзывы/Вопросы/Предложения</a></li>
           
          </ul>
        </li>
        </security:authorize>
      </ul>
    
    <c:url var="logoutUrl" value="j_spring_security_logout" />
      <form class="navbar-form navbar-right" action="${logoutUrl}" method="post">
						<button class="btn btn-default" type="submit">Выйти</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
    </div>
  </div>
</nav>

		<img class="img-responsive center-block" src="<c:url value="/resources/logo/logo.png"/>" />


	<h2 class="text-center">Свяжитесь с нами</h2>
	<h5 class="text-center">(ответ ожидайте по указанному вами E-mail адрессу)</h5>

<div class="col-xs-4 centerBlock textCenter">
		<c:url var="sendFeedback" value="feedback" />
		<form:form modelAttribute="feedback" method="POST"
			action="${sendFeedback}" accept-charset="utf-8" ng-app="vandh"
			ng-controller="validateCtrl" name="fbForm" novalidation="true">
			
				<label for="emailforfb">E-mail</label>

				<form:input placeholder="example@site.com" size="30"
					path="emailforfb" class="form-control" type="email" id="emailforfb"
					name="emailforfb" ng-model="emailforfb" required="true" />
				<span style="color: black"
					ng-show="fbForm.emailforfb.$dirty && fbForm.emailforfb.$invalid">
					<div ng-show="fbForm.emailforfb.$error.required">Введите
						e-mail</div>
					<div ng-show="fbForm.emailforfb.$error.email">Некорректный
						e-mail</div>
				</span> <label for="message">Сообщение</label>
				<form:textarea placeholder="Введите сюда своё сообщение..." class="form-control"
					path="message" id="message" rows="10" cols="40" />
		<br>
	
					<button type="submit" class="btn btn-primary"
						ng-disabled="fbForm.emailforfb.$dirty && fbForm.emailforfb.$invalid">Отправить</button>
		
		</form:form>
		</div>
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrl', function($scope) {
			$scope.emailforfb = '';
		});
	</script>

</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>