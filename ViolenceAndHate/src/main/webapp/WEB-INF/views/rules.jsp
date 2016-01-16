<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@page language="java" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link>
<title>Правила | Haine and Vold</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/> 
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
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



	<h2 class="text-center"><spring:message code="label.rules"/></h2>
	
	<p>1. Никто из участников не имеет права на оскорбление как
		отдельных личностей, так и групп по расовому, национальному,
		религиозному и любому иному признаку. Адресные оскорбления
		категорически запрещены. На сайте также запрещен провокативный стиль
		ведения дискуссии (троллинг)</p>
	<p>2. На сайте запрещено размещение рекламной продукции, включая
		рекламу иных</p>
	<p>3. Профиль пользователя обязательно должен содержать информацию
		о настоящем имени и фамилии. Аватары не допускаются, можно
		использовать только реальную фотографию участника с различимыми
		чертами лица.</p>
	<p>4. При выборе никнейма просьба проявлять скромность,
		сдержанность и политическую сознательность. Не допускаются сознательно
		провокативные ники. Администрация оставляет за собой право требовать
		изменения подобных ников, в случае несогласия с этим требованием
		аккаунт пользователя будет удален.</p>
	<p>5. При общении с людьми исключите сообщения, целиком состоящие
		из смайликов или иного нетекстового способа выражения эмоций,
		бесполезного для обсуждаемой темы.</p>
	<p>6. В случае нарушения правил участником, модератор назначает
		наказание, соответствующее проступку.</p>
	<p>7. На сайте запрещена пропаганда религиозных, философских,
		идеологических и прочих учений, теорий, систем взглядов, а также
		общественных и политических движений. Категорически запрещена
		пропаганда нацизма, фашизма, расизма, терроризма.</p>
	<p>8. Незнание правил не освобождает от необходимости их
		выполнения. Отправка любого сообщения автоматически означает Ваше
		согласие с настоящими правилами и с необходимостью их выполнения. Все
		имеющиеся на сервере сведения имеют исключительно информационное
		назначение. Все сообщения отражают мнения их авторов, и администрация
		не несет за них никакой ответственности. Не обращайте внимания на
		хулиганов. Не отвечайте им, даже если Вы считаете, что Вас оскорбили,
		просто сообщите администратору путем нажатия кнопки "Нарушение!".
		Остальное — забота администрации</p>
		
</body>
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
	<script src="<c:url value="/resources/bootstrap/bootstrap.js"/>"
	type="text/javascript"></script>
</html>