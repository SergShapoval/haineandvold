<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<fmt:requestEncoding value="utf-8" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Написать отзыв | Haine and Vold</title>
<link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
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
						</ul>
						</li>
					<li><a href="/app/user/messages"><spring:message code="label.menumessages"/>(${allUserMess})</a></li>
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
								<li><a href="/app/admin/feedbacklist"><spring:message code="label.menufeedbacks"/>(${countOfFeedbacks})</a></li>
	<li><a href="/app/admin/newusers"><spring:message code="label.newusers" />(${countOfNewUsers})</a></li>
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
<div class="container">
	<img class="img-responsive logo" src="/app/resources/logo.jpg">
</div>
	<h2 class="text-center">
		<spring:message code="label.contactwithus" />
	</h2>
	<br>
	<div class="col-xs-4 centerBlock text-center">
		<c:url var="sendFeedback" value="feedback" />
		<form:form modelAttribute="feedback" method="POST"
			action="${sendFeedback}" accept-charset="utf-8" ng-app="vandh"
			ng-controller="validateCtrl" name="fbForm" novalidation="true">

			<label for="message"><spring:message
                                code="label.message" /></label>
			<form:textarea placeholder="Введите сюда своё сообщение..."
				class="form-control" ng-model="message" path="message" id="message"
				rows="10" cols="40" type="text" required="true" />
			<div style="color: black"
				ng-show="fbForm.message.$dirty && fbForm.message.$invalid">
				<span ng-show="fbForm.message.$error.required"><spring:message
                                code="label.entermessage" />
					</span>
			</div>
			<form:input path="checkfb" type="hidden" value="0"/>
			<br>
			<div class="text-center">
				<button type="submit" class="btn btn-primary"
					ng-disabled="fbForm.message.$dirty && fbForm.message.$invalid"><spring:message
                                code="label.sendfeedback" /></button>
			</div>
			
		</form:form>
	</div>
	<script>
		var app = angular.module('vandh', []);
		app.controller('validateCtrl', function($scope) {
			$scope.message = '';
		});
	</script>

</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>