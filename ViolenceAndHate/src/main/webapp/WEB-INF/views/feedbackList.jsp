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
<title>Feedback List</title>
<link href="<c:url value="/resources/feedback/list/list.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/menu/menu.css"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/buttonLogout/buttonLogout.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
</head>
<body class="bgrFeedback">

	<div class="button">
		<a class="btn-open" href="#"><img
			src="<c:url value="/resources/menu/menu.png"/>"> </a>
	</div>
	<div class="overlay">
		<div id="header">
			<img src="<c:url value="/resources/logo/logo.png"/>" />
		</div>
		<h2>Меню</h2>
		<h5>Для выхода с меню кликните по кнопке меню или пустому месту</h5>
		<div class="wrap">
			<ul class="wrap-nav">
				<li>Навигация
					<ul>
						<li><a href="/app/user">Мой профиль</a></li>
						<li><a href="/app/user/messages">Мои сообщения</a></li>
						<li><a href="/app/user/search">Поиск оппонента</a></li>
						<li><a href="/app/user/feedback">Написать администраторам</a></li>
					</ul>
				</li>

				<li>Информация
					<ul>
						<li><a href="/app/user/rules">Правила</a></li>
						<li><a href="/app/user/contacts">Наши контакты</a></li>



					</ul>
				</li>
				<security:authorize ifAnyGranted="ROLE_ADMIN">
					<li>Администрация
						<ul>
							<li><a href="/app/admin">Админка/Список пользователей</a></li>
							<li><a href="/app/admin/feedbacklist">Отзывы/Вопросы/Предложения</a></li>
						</ul>
					</li>
				</security:authorize>
				<div id="buttonLogout">
					<c:url var="logoutUrl" value="j_spring_security_logout" />
					<form action="${logoutUrl}" method="post">
						<button class="buttonLogout" type="submit">Выйти</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</div>
			</ul>


		</div>
	</div>
	<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>

	<h2>Отзывы/Вопросы/Предложения</h2>
	<c:if test="${!empty listFeedback}">

		<table>
			<tr>
				<td><b>E-mail</b></td>
				<td><b>Message</b></td>
			</tr>
			<c:forEach items="${listFeedback}" var="feedback">
				<tr>

					<td>${feedback.emailforfb}</td>
					<td>${feedback.message}</td>
					<td><a href="<c:url value='/removefeedback/${feedback.idfeed}'/>">Удалить</a></td>
				</tr>
			</c:forEach>
		</table>
		</c:if>
</body>
<script src="<c:url value="/resources/menu/menu.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/buttonLogout/buttonLogout.js"/>"
	type="text/javascript"></script>
</html>