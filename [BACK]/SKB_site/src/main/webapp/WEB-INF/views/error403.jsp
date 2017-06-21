<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<meta charset="utf-8"/>
	<title>Ошибка 403</title>
	<link rel="icon" href="${contextPath}/resources/images/logo.png">
	<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/error403.css">
</head>
<body>
	<div class="content">
		<h1>Error 403 - forbidden</h1>
		<hr>
		<p>К сожалению, у вас недостаточно прав для доступа к данной странцие</p>
		<p>Для продолжения работы с сайтом Вы можете перейти на <a href="/index">главную страницу</a></p>
	</div>
</body>
</html>