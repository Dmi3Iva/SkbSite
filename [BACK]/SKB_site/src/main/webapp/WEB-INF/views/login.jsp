<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <title>Вход</title>
</head>
<body>
<p>${error}</p>
<form:form method="POST" action="${contextPath}/login">
    <input name="username" type="text" class="form-control" placeholder="Имя пользователя"
           autofocus="true"/> <br/>
    <input name="password" type="password" placeholder="Пароль"/> <br/>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


    <button type="submit">Войти</button>
</form:form>



</body>
</html>
