<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "userPrincipal" value = "${pageContext.request.userPrincipal}"/>
<c:set var="title" value="Авторизация"/>

<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>${title}</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="${contextPath}/resources/bootstrap/css/v4-alpha-bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/authorization.css">
</head>
<body>
    <div class="container">
        <div class="row">
            <div class=" col-md-10 col-xs-12">
                <div class="registration-form">
                    <h1>${title}</h1>
                    <form:form method="POST" action="${contextPath}/login" class="form-horizontal">
                        <div class="form-group">
                            <!--Ошибка некрасиво выводится-->
                            <p class="alert-success"><spring:message code="${emailPasswordSuccessCode}"/></p>
                            <p class="alert-danger"><spring:message code="${loginErrorCode}"/></p>
                            <label class="control-label col-xs-5">Логин</label>
                            <div class="col-xs-5">
                                <input name="username" type="text" class="form-control" autofocus="true"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5">Пароль</label>
                            <div class="col-xs-5">
                                <input name="password" type="password" class="form-control"/>
                            </div>
                        </div>
                        <!--Какая-то защита от кросс-доменных запросов-->
                        <input type="hidden" name="$ {_csrf.parameterName}" value="$ {_csrf.token}"/>
                        <div class="form-group">
                            <div class=" col-xs-offset-2 col-xs-2">
                                <button type="submit" class="btn btn-primary btn-lg text-right">Войти</button>
                            </div>
                            <div class="col-xs-7">
                                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/forget-password';" value="Забыли пароль">
                                <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/registration';" value="Регистрация"/>
                                <input type="button" class="btn btn-back btn-lg" onClick="history.go(-1);return true;" value="Назад">
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
