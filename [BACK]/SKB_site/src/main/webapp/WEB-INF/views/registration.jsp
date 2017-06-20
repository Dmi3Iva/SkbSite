<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>Регистрация</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${contextPath}/resources/bootstrap/css/v4-alpha-bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/registration.css"></head>
<body>

    <div class="container">
        <div class="row">
            <div class=" col-md-10 col-xs-12">
                <div class="registration-form">
                    <h1>Регистрация</h1>
                    <form:form method="POST" modelAttribute="userForm" class="form-horizontal">
                        <spring:bind path="firstName">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="firstName">Имя</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="firstName" class="form-control" id="firstName"
                                           placeholder="" autofocus="true"/>
                                    <form:errors path="firstName"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="lastName">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="lastName">Фамилия</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="lastName" class="form-control" id="lastName"
                                                placeholder="" autofocus="true"/>
                                    <form:errors path="lastName"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="middleName">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="middleName">Отчество</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="middleName" class="form-control" id="middleName" placeholder=""/>
                                    <form:errors path="middleName"/>
                                </div>
                            </div>
                        </spring:bind>
                        <%--<spring:bind path="dateOfBirth">--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-5" for="dateOfBirth">Дата рождения</label>--%>
                                <%--<div class="col-xs-7">--%>
                                    <%--<form:input type="date" path="dateOfBirth" class="form-control" id="dateOfBirth" placeholder=""/>--%>
                                    <%--<form:errors path="dateOfBirth"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</spring:bind>--%>
                        <%--<spring:bind path="dateOfBirth">--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-5" for="dateOfBirth">Дата рождения</label>--%>
                                <%--<div class="col-xs-7">--%>
                                    <%--<form:input type="date" path="dateOfBirth" class="form-control" id="dateOfBirth" placeholder=""/>--%>
                                    <%--<form:errors path="dateOfBirth"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</spring:bind>--%>
                        <spring:bind path="username">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Логин</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="username" class="form-control"
                                                autofocus="true" placeholder=""/>
                                    <form:errors path="username"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="password">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Пароль</label>
                                <div class="col-xs-7">
                                    <form:input type="password" path="password" class="form-control" placeholder=""/>
                                    <form:errors path="password"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="passwordConfirm">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Повторите пароль</label>
                                <div class="col-xs-7">
                                    <form:input type="password" path="passwordConfirm" class="form-control" placeholder=""/>
                                    <form:errors path="passwordConfirm"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="email">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="e-mail">E-mail</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="email" class="form-control" id="e-mail" placeholder=""/>
                                    <form:errors path="email"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="organization">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="organization">Организация</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="organization" class="form-control" id="organization" placeholder=""/>
                                    <form:errors path="organization"/>
                                </div>
                            </div>
                        </spring:bind>
                        <div class="form-group">
                            <label class="control-label col-xs-5" for="kapcha">Введите число с картинки</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="kapcha" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-offset-5 col-xs-7">
                                <button type="submit" class="btn btn-primary btn-lg">Регистрация</button>
                                <!--<input type="submit" class="btn btn-primary btn-lg" value="Регистрация"> -->
                                <input type="button" class="btn btn-back btn-lg" onClick="history.go(-1);return true;" value="Назад">
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>


    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>


