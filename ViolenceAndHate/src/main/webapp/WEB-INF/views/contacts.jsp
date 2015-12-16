<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page language="java" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Наши контакты | Violence and Hate</title>
<link href="<c:url value="/resources/menu/menu.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/contacts/css/contacts.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/buttonLogout/buttonLogout.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>" type="text/javascript"></script>
</head>
<body class="bgrContacts">
<div class="button">
	<a class="btn-open" href="#"><img src="<c:url value="/resources/menu/menu.png"/>"> </a>
</div>
<div class="overlay">
<div id="header">
	<img src="<c:url value="/resources/logo/logo.png"/>"/>
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
		<button class="buttonLogout" type="submit" >Выйти</button> <input type="hidden"
			name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>
	</div>
			</ul>
		
		
		</div>
		</div>

<div id="header">
	<img src="<c:url value="/resources/logo/logo.png"/>"/>
</div>
<h2>Наши контакты</h2>

</body>
<script src="<c:url value="/resources/menu/menu.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/buttonLogout/buttonLogout.js"/>" type="text/javascript"></script>
</html>