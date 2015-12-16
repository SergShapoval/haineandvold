<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@page language="java" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link>
<title>Правила | Violence and Hate</title>
<link href="<c:url value="/resources/rules/css/rules.css"/>"
	rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/menu/menu.css"/>" rel="stylesheet"
	type="text/css">
<link href="<c:url value="/resources/buttonLogout/buttonLogout.css"/>"
	rel="stylesheet" type="text/css">
<script src="<c:url value="/resources/Jquery/jquery-2.1.4.min.js"/>"
	type="text/javascript"></script>
</head>
<body class="bgrRules">
	<div class="button">
		<a class="btn-open" href="#"><img
			src="<c:url value="/resources/menu/menu.png"/>"> </a>
	</div>
	<div class="overlay">
		<div id="header">
			<img src="<c:url value="/resources/logo/logo.png"/>" />
		</div>
		<h2>Меню</h2>
		<h5>Для выхода с меню кликните по кнопке меню или пустому месту</h5>
		<div class="wrap">
			<ul class="wrap-nav">
				<li>Навигация
					<ul>
						<li><a href="/app/user">Мой профиль</a></li>
						<li><a href="/app/user/messages">Мои сообщения</a></li>
						<li><a href="/app/user/search">Поиск оппонента</a></li>
						<li><a href="/app/user/feedback">Написать администраторам</a></li>
					</ul>
				</li>

				<li>Информация
					<ul>
						<li><a href="/app/user/rules">Правила</a></li>
						<li><a href="/app/user/contacts">Наши контакты</a></li>
					</ul>
				</li>
				<security:authorize ifAnyGranted="ROLE_ADMIN">
					<li>Администрация
						<ul>
							<li><a href="/app/admin">Админка/Список пользователей</a></li>
							<li><a href="/app/admin/feedbacklist">Отзывы/Вопросы/Предложения</a></li>
						</ul>
					</li>
				</security:authorize>
				<div id="buttonLogout">
					<c:url var="logoutUrl" value="j_spring_security_logout" />
					<form action="${logoutUrl}" method="post">
						<button class="buttonLogout" type="submit">Выйти</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
				</div>
			</ul>


		</div>
	</div>

	<div id="header">
		<img src="<c:url value="/resources/logo/logo.png"/>" />
	</div>

	<h2>Правила</h2>
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
<script src="<c:url value="/resources/menu/menu.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/buttonLogout/buttonLogout.js"/>"
	type="text/javascript"></script>
</html>