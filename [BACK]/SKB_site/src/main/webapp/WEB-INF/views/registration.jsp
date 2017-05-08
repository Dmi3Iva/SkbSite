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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/registration.css"></head>
<body>

    <div class="container">
        <div class="row">
            <div class=" col-md-10 col-xs-12">
                <div class="registration-form">
                    <h1>Регистрация</h1>
                    <form:form method="POST" modelAttribute="userForm" class="form-horizontal">
                        <div class="form-group">
                            <label class="control-label col-xs-5" for="firstName">Имя</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="firstName" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5" for="lastName">Фамилия</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="lastName" placeholder="">
                            </div>
                        </div>
                        <spring:bind path="username">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Логин</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="username" placeholder="Имя пользователя"
                                                autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="password">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Пароль</label>
                                <div class="col-xs-7">
                                    <form:input type="password" path="password" placeholder="Пароль"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="passwordConfirm">
                            <div class="form-group">
                                <label class="control-label col-xs-5">Повторите пароль</label>
                                <div class="col-xs-7">
                                    <form:input type="password" path="passwordConfirm"
                                                placeholder="Повторите свой пароль"></form:input>
                                    <form:errors path="passwordConfirm"></form:errors>
                                </div>
                            </div>
                        </spring:bind>
                        <div class="form-group">
                            <label class="control-label col-xs-5" for="e-mail">E-mail</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="e-mail" placeholder="">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5" for="organization">Организация</label>
                            <div class="col-xs-7">
                                <input type="text" class="form-control" id="organization" placeholder="">
                            </div>
                        </div>
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
                                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='\index_student.html';" value="Назад">
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>


    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://v4-alpha.getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>


