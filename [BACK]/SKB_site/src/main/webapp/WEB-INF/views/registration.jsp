<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <title>Регистрация</title>
</head>
<body>
    <form:form method="POST" modelAttribute="userForm">
        <spring:bind path="username">
            <div>
                <form:input type="text" path="username" placeholder="Имя пользователя"
                            autofocus="true"></form:input>
                <form:errors path="username"></form:errors>

            </div>
        </spring:bind>

        <spring:bind path="password">
            <div>
                <form:input type="password" path="password" placeholder="Пароль"></form:input>
                <form:errors path="password"></form:errors>
            </div>
        </spring:bind>

        <spring:bind path="passwordConfirm">
            <div>
                <form:input type="password" path="passwordConfirm"
                            placeholder="Повторите свой пароль"></form:input>
                <form:errors path="passwordConfirm"></form:errors>
            </div>
        </spring:bind>

        <button type="submit">Отправить</button>
    </form:form>



</body>
</html>
