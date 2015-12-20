<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page language="java" session="true"%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<!DOCTYPE html>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<c:url value="/resources/search/css/search.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/css/buttonsReg.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/menu/menu.css"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/buttonLogout/buttonLogout.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>

<title>Поиск оппонента | Violence and Kick</title>
</head>
<body class="bgrSearch">
	<body class="bgrRules">
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
		<button class="buttonLogout" type="submit">Выйти</button> <input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
	</form>
	</div>
	</ul>
	</div>
	</div>

<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>
	<h2>Подбор оппонента</h2>
	
	<c:url var="getSearch" value="search" />
	<div id="blockOfFilters">
		<form:form modelAttribute="users" method="POST" action="${getSearch}" accept-charset="utf-8">
			
				<label>Вес(до):</label>
				<form:select path="weight" name="weight">
					<form:option value=""></form:option>
					<form:option value="40"></form:option>
					<form:option value="50"></form:option>
					<form:option value="60"></form:option>
					<form:option value="70"></form:option>
					<form:option value="80"></form:option>
					<form:option value="90"></form:option>
					<form:option value="100"></form:option>
					<form:option value="110"></form:option>
					<form:option value="120"></form:option>
				</form:select>
		
				<label>Пол:</label>
				<form:select path="gender">
					<form:option value=""></form:option>
					<form:option value="Мужской"></form:option>
					<form:option value="Женский"></form:option>
				</form:select>
			
				<label>Место:</label>
				<form:select path="place">
					<form:option value=""></form:option>
					<form:option value="Дзержинский"></form:option>
					<form:option value="Киевский"></form:option>
					<form:option value="Комминтерновский"></form:option>
					<form:option value="Лененский"></form:option>
					<form:option value="Московский"></form:option>
					<form:option value="Октябрский"></form:option>
					<form:option value="Орджоникидзевский"></form:option>
					<form:option value="Фрунзенский"></form:option>
					<form:option value="Холодная гора"></form:option>
					<form:option value="Червонозаводской"></form:option>
				</form:select>
			
			<label>Возрост(до):</label>
				<form:select path="age">
					<form:option value=""></form:option>
					<form:option value="19"></form:option>
					<form:option value="20"></form:option>
					<form:option value="21"></form:option>
					<form:option value="22"></form:option>
					<form:option value="23"></form:option>
					<form:option value="24"></form:option>
					<form:option value="25"></form:option>
					<form:option value="26"></form:option>
					<form:option value="27"></form:option>
					<form:option value="28"></form:option>
					<form:option value="29"></form:option>
					<form:option value="30"></form:option>
					<form:option value="31"></form:option>
					<form:option value="32"></form:option>
					<form:option value="33"></form:option>
					<form:option value="34"></form:option>
					<form:option value="35"></form:option>
					<form:option value="36"></form:option>
					<form:option value="37"></form:option>
					<form:option value="38"></form:option>
					<form:option value="39"></form:option>
					<form:option value="40"></form:option>
					<form:option value="41"></form:option>
					<form:option value="42"></form:option>
					<form:option value="43"></form:option>
					<form:option value="44"></form:option>
					<form:option value="45"></form:option>
				</form:select>

			<button class="slide_from_left" type="submit">Искать</button>
		
		</form:form>
	
</div>


<div id="blockOfResults">
<c:if test="${!empty listUsersSort}">

	
		<table>
		
			<tr>
				<th>Name</th>
				<th>Surname</th>
				<th>Gender</th>
				<th>Weight</th>
				<th>Height</th>
				<th>Sport</th>
				<th>Place</th>
			</tr>
			<c:forEach items="${listUsersSort}" var="users">
			<tr>
			
				<td><a href="<c:url value='/user/search/${users.username}'/>" target="_blank"> ${users.name}</a></td>
				<td>${users.surname}</td>
				<td>${users.gender}</td>
				<td>${users.weight}</td>
				<td>${users.height}</td>
				<td>${users.sport}</td>
				<td>${users.place}</td>
				
			</tr>
				</c:forEach>
		</table>

</c:if>
</div>
</body>
<script src="<c:url value="/resources/menu/menu.js"/>" type="text/javascript"></script>
<script src="<c:url value="/resources/buttonLogout/buttonLogout.js"/>" type="text/javascript"></script>

</html>