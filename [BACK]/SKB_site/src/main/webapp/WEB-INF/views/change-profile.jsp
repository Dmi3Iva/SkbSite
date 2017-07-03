<c:set var="title" value="Изменение личной информации ${pageContext.request.userPrincipal.name}"/>
<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<!doctype html>
<html>
<head>

    <title>${title}</title>
    <title>Изменить личную информацию</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/profile.css">
    <%@include file="includes/head.jsp"%>
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="includes/header.jsp" %>
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
                                    <form:input type="date" data-date-format="dd.MM.yyyy" path="dateOfBirth" class="form-control" id="dateOfBirth" placeholder=""/>
                                    <form:errors class="text-danger" path="dateOfBirth"/>
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
                                    <form:errors path="about"/>
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
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 text-right">Новый пароль</label>
                            <div class="col-xs-7">
                                <input type="password" name="newPassword" class="form-control">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-xs-5 text-right">Подвердите новый пароль</label>
                            <div class="col-xs-7">
                                <input type="password" name="confirmNewPassword" class="form-control">
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
            </div>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp" %>

</body>
</html>
