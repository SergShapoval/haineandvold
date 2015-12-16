<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>

<html>
<head>
<title>Violence and Kick!</title>
</head>
<body>
	<center>
		<br /> <br /> <br />
		<h1>Default Logged in User page !!!</h1>
		<c:url var="logoutUrl" value="j_spring_security_logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</center>

</body>
</html>