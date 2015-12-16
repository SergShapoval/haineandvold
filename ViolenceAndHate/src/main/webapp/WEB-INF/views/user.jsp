<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page language="java" session="true" %>

<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<html>
<head>
<title>Профиль | Violence and Hate</title>
<link href="<c:url value="/resources/user/css/user.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/menu/menu.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/buttonLogout/buttonLogout.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>" type="text/javascript"></script>

</head>
<body class="bgrUser"> 
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
	<h2>Добро пожаловать!</h2>
	<h5>Для навигации по сайту используйте меню (желтая иконка в правой части экрана)</h5>
	<h2>Ваша информация</h2>
	
	
<c:forEach  items="${userInfo}" var="users">
	<table class="table_dark">
		<tr>
			<td>Ник</td>
			<td>Имя</td>
			<td>Фамилия</td>
			<td>E-mail</td>
			<td>Пол</td>
			<td>Возраст</td>
			<td>Вес (кг)</td>
			<td>Рост(см)</td>
			<td>Спортивные достижения</td>
			<td>Место</td>
			
		</tr>
		<tr>
			<td>${users.username}</td>
			<td>${users.name}</td>
			<td>${users.surname}</td>
			<td>${users.email}</td>
			<td>${users.gender}</td>
			<td>${users.gender}</td>
			<td>${users.weight}</td>
			<td>${users.height}</td>
			<td>${users.sport}</td>
			<td>${users.place}</td>
		</tr>
	</table>
</c:forEach>


</body>
<script src="<c:url value="/resources/menu/menu.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/buttonLogout/buttonLogout.js"/>" type="text/javascript"></script>
</html>