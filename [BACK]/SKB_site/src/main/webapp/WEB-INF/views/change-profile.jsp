<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="src" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>Изменить личную информацию</title>
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
    <%--<h2 style="color: #0d3349">AccedToChange</h2>--%> !-->
<div class="personal_information">
    <div class="container">
        <div class="row">
            <div class="personal_header">
                <h1 class="text-center">Личная информация </h1>
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
                                    <form:errors path="about"/>
                                </div>
                            </div>
                        </spring:bind>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-3">
                            <button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>
                        </div>
                        <div class="col-xs-offset-2 col-xs-3">
                                <%--<button type="submit" class="btn btn-primary btn-lg" formaction="/id${id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>--%>
                            <button type="submit" class="btn btn-primary btn-md" formaction="/id${user.id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-xs-5">Пароль</label>
                        <div class="col-xs-7">
                            <form type="password" path="password" class="form-control" placeholder=""></form>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Новый пароль</label>
                        <div class="col-xs-7">
                            <form type="password" class="form-control" placeholder=""></form>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-xs-5">Повторите пароль</label>
                        <div class="col-xs-7">
                            <form type="password" path="passwordConfirm" class="form-control" placeholder=""></form>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-offset-2 col-xs-3">
                            <button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>
                        </div>
                        <div class="col-xs-offset-2 col-xs-3">
                                <%--<button type="submit" class="btn btn-primary btn-lg" formaction="/id${id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>--%>
                            <button type="submit" class="btn btn-primary btn-md" formaction="/id${user.id}?${_csrf.parameterName}=${_csrf.token}">Изменить пароль</button>
                        </div>
                    </div>
                    <form type="password" class="form-control">${user.password}</form>

                <%--<div class="form-group">--%>
                    <%--<div class="col-xs-5">--%>
                        <%--<button type="submit" class="btn btn-primary btn-md" onClick="history.go(-1);return true;">Отмена</button>--%>
                    <%--</div>--%>
                    <%--<div class="col-xs-7">--%>
                        <%--<button type="submit" class="btn btn-primary btn-lg" formaction="/id${id}?${_csrf.parameterName}=${_csrf.token}">Изменить данные</button>--%>
                        <%--&lt;%&ndash;<form:form action="/change-profile" modelAttribute="user" class="form-horizontal" enctype="multipart/form-data">&ndash;%&gt;--%>
                            <%--&lt;%&ndash;<button type="submit" name="${_csrf.parameterName}" value="${_csrf.token}" class="btn btn-primary btn-md">Сохранить изменения</button>&ndash;%&gt;--%>
                        <%--&lt;%&ndash;</form:form>&ndash;%&gt;--%>
                        <%--<button type="submit" name="${_csrf.parameterName}" value="${_csrf.token}" class="btn btn-primary btn-md">Сохранить изменения</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                </form:form>
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
