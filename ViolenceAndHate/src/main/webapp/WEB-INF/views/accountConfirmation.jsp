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
<link
	href="<c:url value="/resources/registration/css/registration.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/demo.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/registration/inputs/set2.css"/>"
	rel="stylesheet" type="text/css">

<link href="<c:url value="/resources/registration/css/buttonsReg.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/login/inputs/normalize.css"/>"
	rel="stylesheet" type="text/css">
</head>
<body class="bgrReg">
<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>
	<h2>Подтверждение учётной записи пользователя</h2>
	<div id="centerConfirmButton">
	<form:form method="POST" modelAttribute="users" action="/app/confirmation/${username}"
		name="confirmPassForm">
	<button class="slide_from_left" type="submit"><spring:message code="label.confirm"/></button>
	</form:form>
	</div>
</body>
</html>