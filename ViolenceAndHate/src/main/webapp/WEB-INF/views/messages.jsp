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

<title>Cообщения | Violence and Hate</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
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
	<img class="img-responsive center-block"
		src="<c:url value="/resources/logo/logo.png"/>" />
	<h2 class="text-center">Диалоги</h2>
<!-- <div id="dialogs"></div> -->
<table class="table table-striped table-bordered table-condensed table-hover">
<tr>
<th>Пользователи с которыми вы вели диалог</th>
</tr>
<tr>
	<c:if test="${!empty listDialogRec}">
		<c:forEach items="${listDialogRec}" var="dialog">
	<td><a href="/app/user/messages/${dialog.iddialog}" class="">${dialog.user.username}</a></td>
		<td><a href="/app/user/messages/history/${dialog.user.username}">История переписки</a></td>
		</c:forEach>
		</c:if>
	<c:if test="${!empty listDialogSend}">
		<c:forEach items="${listDialogSend}" var="dialog">
		<tr>
			<td><a href="/app/user/messages/${dialog.iddialog}" class="">${dialog.reciever}</a></td>
			<td><a href="/app/user/messages/history/${dialog.reciever}">История переписки</a></td>
			</tr>
		</c:forEach>
		</c:if>
		</tr>
</table>








	
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
<!-- <script>
	function getDialogs() {
		$.ajax({
			type : 'GET',
			url : '/app/user/dialogs',
			success : function(r) {
				$('#dialogs').html(r);

				console.log(r);
			},
			error : function(r) {
				alert(r);
			}
		});
	}
	setInterval(getDialogs, 2000);
</script> -->


</html>