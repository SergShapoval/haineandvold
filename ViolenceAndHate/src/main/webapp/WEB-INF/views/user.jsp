<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page language="java" session="true"%>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<title>Профиль | Violence and Hate</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
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
	
<br>
	
	<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading text-center">Личная информация</div>
		<table class="table table-striped table-bordered table-condensed">
				<tr>
				<th>Ник</th>
				<th>Имя</th>
				<th>Фамилия</th>
				<th>E-mail</th>
				<th>Пол</th>
				<th>Вес(кг)</th>
				<th>Рост(см)</th>
				<th>Спортивные умения</th>
				<th>Место</th>
	</tr>
	
	<tr>
	<c:forEach items="${userInfo}" var="users">
				<td>${users.username}</td>
				<td>${users.name}</td>

				<td>${users.surname}</td>

				<td>${users.email}</td>

				<td>${users.gender}</td>


				<td>${users.weight}</td>

				<td>${users.height}</td>

				<td>${users.sport}</td>

				<td>${users.place}</td>
					</c:forEach>
	</tr>
		</table>
		</div>
 <form method="POST" action="./user?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
 	<div class="form-group text-center">
       <label class="control-label" for="file">Выберите фото</label>
       <span class="btn btn-default btn-file">
        <input type="file" name="file">
        </span> 
        <button class="btn btn-primary btn-sm" type="submit" value="Load">Сменить фото</button>
        </div>
    </form>
   
	<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
	<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</body>

</html>