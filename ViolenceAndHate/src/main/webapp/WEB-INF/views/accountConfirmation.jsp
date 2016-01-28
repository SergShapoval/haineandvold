<%@page language="java" contentType="text/html;charset=utf-8"
	pageEncoding="utf-8"%>
<?xml version="1.0" encoding="UTF-8"?>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Подтверждение профиля | Violence and Hate</title>
<link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/CSS/styles.css"/>" rel="stylesheet"
	type="text/css">
</head>
<body>
<div class="container">
	<img class="img-responsive logo" src="/app/resources/logo.jpg">
</div>
	<h3 class="text-center"><spring:message code="label.accountconfirmation"/></h3>
	<div class="text-center">
	<form:form method="POST" modelAttribute="users" action="/app/confirmation/${username}"
		name="confirmPassForm">
		<br>
	<button class="btn btn-success" type="submit"><spring:message code="label.regconfirm"/></button>
	</form:form>
	</div>
</body>
</html>