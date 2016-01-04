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
<link href="<c:url value="/resources/bootstrap/bootstrap.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/bootswatch.less.css"/>"
	rel="stylesheet" type="text/css">
	<link href="<c:url value="/resources/bootstrap/variables.less.css"/>"
	rel="stylesheet" type="text/css">

</head>
<body>
	<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Violence and Hate</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
       
   <li><a href="/app/user">Профиль</a></li>
<li><a href="/app/user/messages">Сообщения</a></li>
<li><a href="/app/user/search">Поиск оппонента</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Информация<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/app/user/rules">Правила</a></li>
            <li class="divider"></li>
            <li><a href="/app/user/feedback">Написать администрации</a></li>
          </ul>
        </li>
        <security:authorize ifAnyGranted="ROLE_ADMIN">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Администрирование<span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="/app/admin">Админка/Список пользователей</a></li>
            <li><a href="/app/admin/feedbacklist">Отзывы/Вопросы/Предложения</a></li>
           
          </ul>
        </li>
        </security:authorize>
      </ul>
    
    <c:url var="logoutUrl" value="j_spring_security_logout" />
      <form class="navbar-form navbar-right" action="${logoutUrl}" method="post">
						<button class="btn btn-default" type="submit">Выйти</button>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
					</form>
    </div>
  </div>
</nav>
		<img class="img-responsive center-block"  src="<c:url value="/resources/logo/logo.png"/>" />

	<h2 class="text-center">Правила</h2>
	
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