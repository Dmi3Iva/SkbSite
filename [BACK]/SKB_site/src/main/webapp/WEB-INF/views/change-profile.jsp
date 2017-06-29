<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="src" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var = "userPrincipal" value = "${pageContext.request.userPrincipal}"/>
<c:set var="title" value="Изменение личной информации ${pageContext.request.userPrincipal.name}"/>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>${title}</title>
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

<!--можно изменить себя -->
    <%--<h2 style="color: #0d3349">AccedToChange</h2>--%>
<div class="personal_information">
    <div class="container">
        <div class="row">
            <div class="personal_header">
                <h1 class="text-center">${title}</h1>
                <br>
            </div>
            <div class="container">
                <form:form method="POST" modelAttribute="user" class="form-horizontal" enctype="multipart/form-data" >
                    <div class="col-md-3">
                        <div class="image"><img src="${user.photoPath}" alt="Изображение ${user.username}"></div>
                        <div class="form-group" >
                            <label class="control-label col-xs-3" for="newsPic">Загрузите картинку</label>
                            <input type="file" name="file" id="newsPic">
                        </div>
                    </div>
                    <div class="col-md-9">
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
                        <spring:bind path="contactDetails">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="organization">Контактные данные</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="contactDetails" class="form-control" id="contactDetails" placeholder=""/>
                                    <form:errors path="contactDetails"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="about">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="about">О себе</label>
                                <div class="col-xs-7">
                                    <form:textarea type="text" path="about" class="form-control" id="about" placeholder=""/>
                                    <form:errors path="about"/>
                                </div>
                            </div>
                        </spring:bind>
                        <spring:bind path="github">
                            <div class="form-group">
                                <label class="control-label col-xs-5" for="github">github</label>
                                <div class="col-xs-7">
                                    <form:input type="text" path="github" class="form-control" id="github" placeholder=""/>
                                    <form:errors path="github"/>
                                </div>
                            </div>
                        </spring:bind>
                        <div class="form-group">
                            <div class="col-xs-3 text-center">
                                <button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>
                            </div>
                            <div class="col-xs-9 text-center">
                                    <%--<button type="submit" class="btn btn-primary btn-lg" formaction="/id${id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>--%>
                                <button type="submit" class="btn btn-primary btn-md" formaction="/change-profile${user.id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>
                            </div>
                        </div>
                    </div>
                </form:form>

                <form method="POST" action="/change-password">
                    <div class="col-md-9 col-md-offset-3">
                        <div class="form-group">
                            <label class="control-label col-xs-5 text-right">Старый пароль</label>
                            <div class="col-xs-7">
                                <input type="password" name="currentPassword" class="form-control">
                                <spring:message code="${uncorrectPassword}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 text-right">Новый пароль</label>
                            <div class="col-xs-7">
                                <input type="password" name="newPassword" class="form-control">
                                <spring:message code="${uncorrectNewPasswordSize}"/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 text-right">Подвердите новый пароль</label>
                            <div class="col-xs-7">
                                <input type="password" name="confirmNewPassword" class="form-control">
                                <spring:message code="${uncorrectNewPasswordConfirm}"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-md-offset-3">
                        <div class="form-group">
                            <div class="col-xs-3 text-center">
                                <button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>
                            </div>
                            <div class="col-xs-9 text-center">
                                <button type="submit" class="btn btn-primary btn-md" formaction="/change-password?${_csrf.parameterName}=${_csrf.token}">Изменить пароль</button>
                            </div>
                        </div>
                        <p class="alert-danger">${error}</p>
                    </div>
                </form>

                <%--<form:form method="POST" modelAttribute="passwordChange" class="form-horizontal" >--%>
                    <%--<spring:bind path="currentPassword">--%>
                        <%--<div class="col-md-9 col-md-offset-3">--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-5 text-right">Пароль</label>--%>
                                <%--&lt;%&ndash;<div class="col-xs-7">&ndash;%&gt;--%>
                                    <%--&lt;%&ndash;<input type="password" class="form-control" placeholder=""/>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--<div class="col-xs-7">--%>
                                    <%--<form:textarea type="text" path="currentPassword" class="form-control" id="currentPassword" placeholder=""/>--%>
                                    <%--<form:errors path="currentPassword"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</spring:bind>--%>
                    <%--<spring:bind path="newPassword">--%>
                        <%--<div class="col-md-9 col-md-offset-3">--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-5 text-right">Новый пароль</label>--%>
                                <%--<div class="col-xs-7">--%>
                                    <%--<form:textarea type="text" path="newPassword" class="form-control" id="newPassword" placeholder=""/>--%>
                                    <%--<form:errors path="newPassword"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</spring:bind>--%>
                    <%--<spring:bind path="confirmNewPassword">--%>
                        <%--<div class="col-md-9 col-md-offset-3">--%>
                            <%--<div class="form-group">--%>
                                <%--<label class="control-label col-xs-5 text-right">Повторите пароль</label>--%>
                                <%--<div class="col-xs-7">--%>
                                    <%--<form:textarea type="text" path="confirmNewPassword" class="form-control" id="confirmNewPassword" placeholder=""/>--%>
                                    <%--<form:errors path="confirmNewPassword"/>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</spring:bind>--%>
                    <%--<div class="col-md-9 col-md-offset-3">--%>
                        <%--<div class="form-group">--%>
                            <%--<div class="col-xs-3 text-center">--%>
                                <%--<button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>--%>
                            <%--</div>--%>
                            <%--<div class="col-xs-9 text-center">--%>
                                <%--<button type="submit" class="btn btn-primary btn-md" formaction="/change-password?${user.id}?${_csrf.parameterName}=${_csrf.token}">Изменить пароль</button>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                        <%--<p class="alert-danger">${error}</p>--%>
                        <%--<p>${user.password}</p>--%>
                    <%--</div>--%>
                <%--</form:form>--%>
            </div>
        </div>
    </div>
</div>

    <%@include file="footer.jsp" %>

    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
