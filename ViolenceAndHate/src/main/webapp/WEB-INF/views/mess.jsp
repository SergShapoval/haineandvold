<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<%@page language="java" session="true" %>
<!--<c:if test="${!empty listMessagesForUser}">
<c:forEach items="${listMessagesForUser}" var="message">
<a href="">${message.text}</a>
<a href="">${message.date}</a>
</c:forEach>
</c:if>-->


<c:if test="${!empty listMessagesForUser}">

<table class="table tableSize table-striped table-hover tableFont ">
			<tr>
			<th class="text-center">Сообщение</th>
			<th class="text-center colDateSize">Дата/Время</th>
			</tr>
	
			<tbody>
			<c:forEach items="${listMessagesForUser}" var="message">
			<tr>
			<td>${message.text}</td>
			<td class="text-center colDateSize">${message.date}</td>
			<tr>
			</c:forEach>	
</tbody>
</table>

</c:if>

