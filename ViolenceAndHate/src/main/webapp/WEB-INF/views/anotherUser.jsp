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
							<li><a href="/app/user/contacts">Наши контакты</a></li>
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
	
		<img class="img-responsive center-block"  src="<c:url value="/resources/logo/logo.png"/>" />
	<h2 class="text-center">Информация о пользователе ${username}</h2>
	
	<c:forEach items="${userInfo}" var="users">
		<table class="table table-striped table-bordered table-condensed table-hover">
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
				<th>Возраст</th>
				<td>${users.gender}</td>
			</tr>
			<tr>
				<th>Вес (кг)</th>
				<td>${users.weight}</td>
			</tr>
			<tr>
				<th>Рост(см)</th>
				<td>${users.height}</td>
			</tr>
			<tr>
				<th>Спортивные достижения</th>
				<td>${users.sport}</td>
			</tr>
			<tr>
				<th>Место</th>
				<td>${users.place}</td>
			</tr>
		</table>
	</c:forEach>
	
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
  Написать сообщение
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Написать сообщение пользователю ${username}</h4>
      </div>
      <div class="modal-body">
       <label>Введите сообщение</label>
        <textarea class="form-control" rows="3" id="textArea"></textarea>
    
   
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
        <button type="button" class="btn btn-primary">Отправить</button>
      </div>
    </div>
  </div>
</div>


</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>