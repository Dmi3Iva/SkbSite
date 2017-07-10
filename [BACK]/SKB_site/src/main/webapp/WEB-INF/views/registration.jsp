<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<c:set var="title" value="Регистрация"/>
<!DOCTYPE html>
<html lang="ru">
<head>

    <title>Регистрация</title>
    <%@include file="includes/head.jsp"%>
    <link href="/resources/bootstrap/css/v4-alpha-bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/registration.css"></head>
    <title>${title}</title>
<body>

    <div class="container">
        <div class="row">
            <div class=" col-md-10 col-xs-12">
                <div class="registration-form">
                    <h1>${title}</h1>
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
                        <spring:bind path="customer">
                            <div class="form-check">
                                <label class="control-label col-xs-5">Заказчик</label>
                                <label class="control-label form-check-label col-xs-7 text-left">
                                    <form:checkbox path="customer" class="control-label"/>
                                    <form:errors path="customer"/>
                                </label>
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
                                <input type="button" class="btn btn-back btn-lg" onClick="history.go(-1);return true;" value="Назад">
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>


