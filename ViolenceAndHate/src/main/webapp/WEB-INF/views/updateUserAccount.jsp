<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Настройки аккаунта | Haine and Vold</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
	
	<script src="<c:url value="/resources/Angular/angular.min.js"/>"></script>
</head>
<style>
@font-face {
    font-family: Runic; /* Имя шрифта */
    src: url(/app/resources/font/runic.ttf); /* Путь к файлу со шрифтом */
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

<h4 class="text-center"><spring:message code="label.updateaccountinfo" /></h4>
<div class="col-xs-4 centerBlock text-center">
<form:form modelAttribute="users" method="POST"
			action="/app/user/updateaccount" accept-charset="utf-8"	name="updateAccountForm" >
<div class="form-group">
				<label class="control-label"><spring:message code="label.email" /></label>
				<form:input class="form-control input-sm" path="email" name="email" type="email" placeholder="example@mail.com"/>			
	</div>
			<div class="form-group">
			
			<label class="control-label"><spring:message code="label.password" /></label>
			<form:input class="form-control input-sm" path="password" type="password" name="password"/>
</div>
	<button type="submit" class="btn btn-success"><spring:message code="label.updatebutton" /></button>
			</form:form>
</div>

</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>