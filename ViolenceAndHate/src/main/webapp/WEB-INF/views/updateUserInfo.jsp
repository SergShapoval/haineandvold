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
<title>Обновить информацию | Haine and Vold</title>
<link rel="shortcut icon" href="<c:url value="/resources/faviicon/iconHV.ico"/>" type="image/x-icon">
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
	
	<div class="col-xs-4 centerBlock text-center">
 <form method="POST" action="?${_csrf.parameterName}=${_csrf.token}" enctype="multipart/form-data">
 	<div class="form-group text-center">
       <label class="control-label" for="file"><spring:message code="label.choosephoto" /></label>
       <span class="btn btn-default btn-file">
        <input type="file" name="file" accept="image/*">
        </span> 
        <button class="btn btn-primary btn-sm" type="submit" value="Load"><spring:message code="label.changephoto" /></button>
        </div>
    </form>
		<form:form method="POST" modelAttribute="users" accept-charset="utf-8"
			name="updateForm" action="/app/user/updateinfo">
			<div class="form-group">
				<label class="control-label"><spring:message
						code="label.age" /></label>
				<form:select class="form-control input-sm" path="age">
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
					<form:option value="46"></form:option>
					<form:option value="47"></form:option>
					<form:option value="48"></form:option>
					<form:option value="49"></form:option>
					<form:option value="50"></form:option>
					<form:option value="51"></form:option>
					<form:option value="52"></form:option>
					<form:option value="53"></form:option>
					<form:option value="54"></form:option>
					<form:option value="55"></form:option>
					<form:option value="56"></form:option>
					<form:option value="57"></form:option>
					<form:option value="58"></form:option>
					<form:option value="59"></form:option>
					<form:option value="60"></form:option>

				</form:select>
			</div>
			<div class="form-group">
				<label class="control-label"><spring:message
						code="label.height" /></label>
				<form:select path="height" class="form-control input-sm"
					type="number" name="height">
					<form:option value=""></form:option>
					<form:option value="125"></form:option>
					<form:option value="126"></form:option>
					<form:option value="127"></form:option>
					<form:option value="128"></form:option>
					<form:option value="129"></form:option>
					<form:option value="130"></form:option>
					<form:option value="131"></form:option>
					<form:option value="132"></form:option>
					<form:option value="133"></form:option>
					<form:option value="134"></form:option>
					<form:option value="135"></form:option>
					<form:option value="136"></form:option>
					<form:option value="137"></form:option>
					<form:option value="139"></form:option>
					<form:option value="140"></form:option>
					<form:option value="141"></form:option>
					<form:option value="142"></form:option>
					<form:option value="143"></form:option>
					<form:option value="144"></form:option>
					<form:option value="145"></form:option>
					<form:option value="146"></form:option>
					<form:option value="147"></form:option>
					<form:option value="148"></form:option>
					<form:option value="149"></form:option>
					<form:option value="150"></form:option>
					<form:option value="151"></form:option>
					<form:option value="152"></form:option>
					<form:option value="153"></form:option>
					<form:option value="154"></form:option>
					<form:option value="155"></form:option>
					<form:option value="156"></form:option>
					<form:option value="157"></form:option>
					<form:option value="158"></form:option>
					<form:option value="159"></form:option>
					<form:option value="160"></form:option>
					<form:option value="161"></form:option>
					<form:option value="162"></form:option>
					<form:option value="163"></form:option>
					<form:option value="164"></form:option>
					<form:option value="165"></form:option>
					<form:option value="166"></form:option>
					<form:option value="167"></form:option>
					<form:option value="168"></form:option>
					<form:option value="169"></form:option>
					<form:option value="170"></form:option>
					<form:option value="171"></form:option>
					<form:option value="172"></form:option>
					<form:option value="173"></form:option>
					<form:option value="174"></form:option>
					<form:option value="175"></form:option>
					<form:option value="176"></form:option>
					<form:option value="177"></form:option>
					<form:option value="178"></form:option>
					<form:option value="179"></form:option>
					<form:option value="180"></form:option>
					<form:option value="181"></form:option>
					<form:option value="182"></form:option>
					<form:option value="183"></form:option>
					<form:option value="184"></form:option>
					<form:option value="185"></form:option>
					<form:option value="186"></form:option>
					<form:option value="187"></form:option>
					<form:option value="188"></form:option>
					<form:option value="189"></form:option>
					<form:option value="190"></form:option>
					<form:option value="191"></form:option>
					<form:option value="192"></form:option>
					<form:option value="193"></form:option>
					<form:option value="194"></form:option>
					<form:option value="195"></form:option>
					<form:option value="196"></form:option>
					<form:option value="197"></form:option>
					<form:option value="198"></form:option>
					<form:option value="199"></form:option>
					<form:option value="200"></form:option>
					<form:option value="201"></form:option>
					<form:option value="202"></form:option>
					<form:option value="203"></form:option>
					<form:option value="204"></form:option>
					<form:option value="205"></form:option>
					<form:option value="206"></form:option>
					<form:option value="207"></form:option>
					<form:option value="208"></form:option>
					<form:option value="209"></form:option>
					<form:option value="210"></form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label class="control-label"><spring:message
						code="label.weight" /></label>
				<form:select path="weight" type="number"
					class="form-control input-sm" name="weight">
					<form:option value=""></form:option>
					<form:option value="45"></form:option>
					<form:option value="46"></form:option>
					<form:option value="47"></form:option>
					<form:option value="48"></form:option>
					<form:option value="49"></form:option>
					<form:option value="50"></form:option>
					<form:option value="51"></form:option>
					<form:option value="52"></form:option>
					<form:option value="53"></form:option>
					<form:option value="54"></form:option>
					<form:option value="55"></form:option>
					<form:option value="56"></form:option>
					<form:option value="57"></form:option>
					<form:option value="58"></form:option>
					<form:option value="59"></form:option>
					<form:option value="60"></form:option>
					<form:option value="61"></form:option>
					<form:option value="62"></form:option>
					<form:option value="63"></form:option>
					<form:option value="64"></form:option>
					<form:option value="65"></form:option>
					<form:option value="66"></form:option>
					<form:option value="67"></form:option>
					<form:option value="68"></form:option>
					<form:option value="69"></form:option>
					<form:option value="70"></form:option>
					<form:option value="71"></form:option>
					<form:option value="72"></form:option>
					<form:option value="73"></form:option>
					<form:option value="74"></form:option>
					<form:option value="75"></form:option>
					<form:option value="76"></form:option>
					<form:option value="77"></form:option>
					<form:option value="78"></form:option>
					<form:option value="79"></form:option>
					<form:option value="80"></form:option>
					<form:option value="81"></form:option>
					<form:option value="82"></form:option>
					<form:option value="83"></form:option>
					<form:option value="84"></form:option>
					<form:option value="85"></form:option>
					<form:option value="86"></form:option>
					<form:option value="87"></form:option>
					<form:option value="88"></form:option>
					<form:option value="89"></form:option>
					<form:option value="90"></form:option>
					<form:option value="91"></form:option>
					<form:option value="92"></form:option>
					<form:option value="93"></form:option>
					<form:option value="94"></form:option>
					<form:option value="95"></form:option>
					<form:option value="96"></form:option>
					<form:option value="97"></form:option>
					<form:option value="98"></form:option>
					<form:option value="99"></form:option>
					<form:option value="100"></form:option>
					<form:option value="101"></form:option>
					<form:option value="102"></form:option>
					<form:option value="103"></form:option>
					<form:option value="104"></form:option>
					<form:option value="105"></form:option>
					<form:option value="106"></form:option>
					<form:option value="107"></form:option>
					<form:option value="108"></form:option>
					<form:option value="109"></form:option>
					<form:option value="110"></form:option>
					<form:option value="111"></form:option>
					<form:option value="112"></form:option>
					<form:option value="113"></form:option>
					<form:option value="114"></form:option>
					<form:option value="115"></form:option>
					<form:option value="116"></form:option>
					<form:option value="117"></form:option>
					<form:option value="118"></form:option>
					<form:option value="119"></form:option>
					<form:option value="120"></form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label class="control-label"><spring:message
						code="label.sport" /></label>
				<form:input class="form-control input-sm" path="sport" type="text"
					name="sport" />
			</div>
			<div class="form-group">
				<label class="control-label"><spring:message
						code="label.place" /></label>
				<form:select name="place" class="form-control input-sm" path="place">
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
			<button type="submit" class="btn btn-success">
				<spring:message code="label.updatebutton" />
			</button>
		</form:form>
		

	</div>
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>