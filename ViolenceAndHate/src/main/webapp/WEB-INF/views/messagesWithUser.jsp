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
<title>Сообщения</title>
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
	<link href="<c:url value="/resources/CSS/tableMessFixedHeader.css"/>" rel="stylesheet"
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
				<a class="navbar-brand" href="#">Violence and Hate</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">

					<li><a href="/app/user" ><spring:message code="label.menuprofile"/></a></li>
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
						<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><spring:message code="label.menusettings"/><span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="/app/user/updateinfo"><spring:message code="label.menusettinginfo"/></a></li>
							<li><a href="/app/user/updateaccount"><spring:message code="label.menusettingaccount"/></a></li>
							
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

<br>
<span>
<span class="col-md-8 text-left"><spring:message
                                code="label.message" /></span>
<span class="col-md-4 text-center"><spring:message
                                code="label.date"/></span>
</span>
<br>

<div class="scrollTableMessages" id="mess">

</div>



<form:form method="POST" modelAttribute="message"
						accept-charset="utf-8" ng-app="vandh" ng-controller="validateCtrl"
						name="messageForm" novalidation="true">

<form:textarea path="text" class="form-control" rows="1" 
							id="message" ng-model="message" required="true"></form:textarea>
						<div style="color: black"
							ng-show="messageForm.message.$dirty && messageForm.message.$invalid">
							<span ng-show="messageForm.message.$error.required"><spring:message
                                code="label.entermessage" /></span>
						</div>
						<br>
						<div class="text-center">
						<button class="btn btn-success" type="submit"><spring:message
                                code="label.sendmessage"/></button>
						</div>

</form:form>

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
<script>
var oldC = 0, newC = -1;
	function getMessages() {
		$.ajax({
		type : 'GET',
		url : '/app/user/countofmess/${iddialog}',
		success : function(rs) 
		{
			newC = rs;
			if(oldC != newC)
			{
				$.ajax({
				type : 'GET',
				url : '/app/user/mess/${iddialog}',
				success : function(r) 
				{
					$('#mess').html(r);
					document.getElementById("mess").scrollTop = 9999;
					console.log(r);
					
				},
				error : function(r) {
					alert(r);
				}
				});
				oldC = newC;
			}
		},
		error : function(rs) {
			alert(rs);
		}
		});
	}
	setInterval(getMessages, 2000);
</script>
</html>