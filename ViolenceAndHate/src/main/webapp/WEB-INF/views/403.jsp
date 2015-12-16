
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8"); 
response.setCharacterEncoding("UTF-8"); 
%>
<html>
<head>
<title>Access Denied | Beingjavaguys.com</title>
</head>
<body>
	
		<br /> <br /> <br />
		<h1>
			Access Denied for User : <span style="color: red;">${username}</span>
		</h1>
		<c:url var="logoutUrl" value="j_spring_security_logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>


</body>
</html>