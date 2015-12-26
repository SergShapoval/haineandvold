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


<title>Поиск оппонента | Violence and Kick</title>

	<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/CSS/styles.css"/>"
	rel="stylesheet" type="text/css">
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


	<h2 class="text-center">Подбор оппонента</h2>

	<c:url var="getSearch" value="search" />
	
	
 
 <div class="container textCenter">
		<form:form class="form-inline centerBlock"  modelAttribute="users" method="POST" action="${getSearch}" accept-charset="utf-8">

<div class="form-group">
				<label for="weight">Вес(до):</label>
				<form:select multiple="" class="form-control input-sm" path="weight" name="weight">
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
		</div>
		
		<div class="form-group">
				<label for="gender">Пол:</label>
				<form:select  multiple="" class="form-control input-sm" name="gender" path="gender">
					<form:option value=""></form:option>
					<form:option value="Мужской"></form:option>
					<form:option value="Женский"></form:option>
				</form:select>
			</div>
				<div class="form-group">
				<label for="place">Место:</label>
				<form:select multiple="" class="form-control input-small" name="place" path="place">
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
			</div>
			
			<div class="form-group">
			<label for="age">Возрост(до):</label>
				<form:select multiple="" class="form-control input-small" name="age" path="age">
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
</div>

			<button class="btn btn-success" type="submit">Искать</button>

		</form:form>
	
</div>
<br>
<div>
<c:if test="${!empty listUsersSort}">

	
		<table class="table table-striped table-bordered table-condensed table-hover">
		
			<tr>
				<th>Имя</th>
				<th>Фамилия</th>
				<th>Пол</th>
				<th>Вес</th>
				<th>Рост</th>
				<th>Спортивные навыки</th>
				<th>Место</th>
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
	<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
	<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>

</html>