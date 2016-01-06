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
<title>Отзывы/вопросы/предложения | Violence and Hate</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">

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
	
		<img class="img-responsive center-block"  src="<c:url value="/resources/logo/logo.png"/>" />

	<h2 class="text-center">Отзывы/Вопросы/Предложения</h2>
	
	<c:if test="${!empty listFeedback}">
		<table class="table table-striped table-bordered table-condensed table-hover">
			<tr>
				<td class="col-md-3"><b>Пользователь</b></td>
				<td class="col-md-8"><b>Message</b></td>
			</tr>
			<c:forEach items="${listFeedback}" var="feedback">
				<tr>

					<td><a href="/app/user/search/${feedback.usernameReciever}">${feedback.usernameReciever}</a></td>
					<td>${feedback.message}</td>
					<td class="col-md-1"><a href="<c:url value='/removefeedback/${feedback.idfeed}'/>">Удалить</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
		
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>