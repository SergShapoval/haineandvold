<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page language="java" session="true"%>
<!-- 
<c:if test="${!empty listDialog}">
<li class="active"><a href="#start" data-toggle="tab">Инфо</a></li>
      <c:forEach items="${listDialog}" var="dialog"> 
          <li><a href="#a" data-toggle="tab">${dialog.iddialog}</a></li>
          </c:forEach> 
</c:if> -->
<!-- 
<c:if test="${!empty listDialog}">
	<div class="list-group dialogs">
		<c:forEach items="${listDialog}" var="dialog">
			<a href="/app/user/messages/${dialog.iddialog}" class="list-group-item">${dialog.iddialog}</a>
		</c:forEach>
	</div>
</c:if> -->
<!-- <c:if test="${!empty listDialog}">
      <c:forEach items="${listDialog}" var="dialog"> 
      <a href="/app/user/messages/${dialog.iddialog}">${dialog.iddialog}</a>
          </c:forEach> 
</c:if> -->