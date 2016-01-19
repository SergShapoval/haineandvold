<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page language="java" session="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Профиль | Haine and Vold</title>
<link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/CSS/styles.css"/>"
	rel="stylesheet" type="text/css">
	
</head>
	<style>
@font-face {
    font-family: Runic; /* Имя шрифта */
    src: url(resources/font/runic.ttf); /* Путь к файлу со шрифтом */
   }
h1 {
    font-family: Runic;
    text-align:center;
    font-size:500%;
   }

</style>
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
				<a class="navbar-brand" href="#">Haine and Vold</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="label.menuprofile"/><span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
						<li><a href="/app/user"><spring:message code="label.menuprofile"/></a></li>
							<li><a href="/app/user/updateinfo"><spring:message code="label.menusettinginfo"/></a></li>
							<li><a href="/app/user/updateaccount"><spring:message code="label.menusettingaccount"/></a></li>
							
						</ul>
						</li>
					<li><a href="/app/user/messages"><spring:message code="label.menumessages"/></a></li>
					<li><a href="/app/user/search"><spring:message code="label.menusearch"/></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="label.menuinformation"/><span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/app/user/rules"><spring:message code="label.menurules"/></a></li>
							<li class="divider"></li>
							<li><a href="/app/user/feedback"><spring:message code="label.menusendfeedback"/></a></li>
						</ul></li>
						
					<security:authorize ifAnyGranted="ROLE_ADMIN">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="label.menuadministration"/><span
								class="caret"></span></a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="/app/admin"><spring:message code="label.menuadminpanel"/></a></li>
								<li><a href="/app/admin/feedbacklist"><spring:message code="label.menufeedbacks"/></a></li>

							</ul>
							</li>
					</security:authorize>
					
				</ul>
 <ul class="nav navbar-nav navbar-right">
      <li>
					<a href="?locale=ru"><img src="<c:url value="/resources/languageicons/rus.png"/>" alt="Russian Language" title="Сменить язык интерфейса на русский"></a>
					</li>
					<li>
					<a href="?locale=en"><img src="<c:url value="/resources/languageicons/usa.png"/>" alt="USA Language" title="Change interface language to american"></a>
					</li>
      </ul>
				<c:url var="logoutUrl" value="/j_spring_security_logout" />
				<form class="navbar-form navbar-right" action="${logoutUrl}"
					method="post">
					<button class="btn btn-default" type="submit"><spring:message code="label.logoutbutton"/></button>
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</nav>

	<h1>Haine and Vold</h1>
	
<br>

<br>
<div class="container mainBlock">
<c:forEach items="${userInfo}" var="users">
<div class="blockAva col-md-3">
<img class="fixedSizeImg" src="<c:url value="${users.photo}"/>">
</div>
<div class="blockTable col-md-6">
		<table class="tableSize table table-striped table-bordered table-condensed">
				
				<tr>
				<th><spring:message code="label.login" /></th>
				<td>${users.username}</td>
				</tr>
				<tr>
				<th><spring:message code="label.name" /></th>
				<td>${users.name}</td>
				</tr>
				<tr>
				<th><spring:message code="label.surname" /></th>
				<td>${users.surname}</td>
				</tr>
				<tr>
				<th><spring:message code="label.email" /></th>
				<td>${users.email}</td>
				</tr>
				<tr>
				<th><spring:message code="label.age" /></th>
				<td>${users.age}</td>
				</tr>
				<tr>
				<th><spring:message code="label.gender" /></th>
				<td>${users.gender}</td>
				</tr>
				<tr>
				<th><spring:message code="label.weight" /></th>
				<td>${users.weight}</td>
				</tr>
				<tr>
				<th><spring:message code="label.height" /></th>
				<td>${users.height}</td>
				</tr>
				<tr>
				<th><spring:message code="label.sport" /></th>
				<td>${users.sport}</td>
				</tr>
				<tr>
				<th><spring:message code="label.place" /></th>
				<td>${users.place}</td>
				</tr>
					
			</table>
			</div>
			</c:forEach>
	</div>	



	<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
	<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</body>

</html>