<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>Личная информация</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/profile.css">

    <!--Незримая форма, помогающая выйти-->
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="header.jsp" %>
<!-- main-->

<div class="personal_information">
    <div class="container">
        <div class="row">
            <div class="personal_header col-sm-offset-3">
                <h1>Личная информация </h1>
            </div>
            <div class="container">
                <div class="col-xs-6">
                    <img src="${user.photoPath}">
                </div>
                <div class="col-xs-6">
                    <div class="registration-form">
                        <form:form method="POST" modelAttribute="user" class="form-horizontal">
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
                            <spring:bind path="dateOfBirth">
                                <div class="form-group">
                                    <label class="control-label col-xs-5" for="dateOfBirth">Дата рождения</label>
                                    <div class="col-xs-7">
                                        <form:input type="date" path="dateOfBirth" class="form-control" id="dateOfBirth" placeholder=""/>
                                        <form:errors path="dateOfBirth"/>
                                    </div>
                                </div>
                            </spring:bind>
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
                                <div class="col-xs-offset-5 col-xs-7">
                                    <button type="submit" class="btn btn-primary btn-lg">Регистрация</button>
                                    <!--<input type="submit" class="btn btn-primary btn-lg" value="Регистрация"> -->
                                    <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/index';" value="Назад">
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-xs-6">
                <button type="submit" class="btn btn-primary hidden-sm hidden-xs btn-lg">Загрузить новое изображение</button>
                <input type="file" class="btn-primary">
                <button type="submit" class="hidden-md visible-xs visible-sm btn-lg"><i class="glyphicon glyphicon-picture"></i></button>
            </div>
            <div class="btn-group col-xs-6">
                <button type="submit" class="btn btn-primary btn-lg">
                    Изменить пароль
                </button>
                <button onclick="document.forms['logoutForm'].submit()" class="btn btn-primary btn-lg">
                    Выход
                </button>
            </div>
        </div>
    </div>
</div>


<%@include file="footer.jsp" %>

<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
<script>window.jQuery</script>
<script src="../../resources/js/tether.min.js"></script>
<script src="../../resources/bootstrap/js/bootstrap.js"></script>pt>

</body>
</html>
