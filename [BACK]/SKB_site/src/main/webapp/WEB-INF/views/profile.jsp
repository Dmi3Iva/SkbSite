<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<c:set var="title" value="Личная информация ${user.username}"/>
<html>
<head>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/profile.css">
    <title>${title}</title>
</head>
<body>

    <div id="leftSide">
    </div>
    <div id="rightSide">
    </div>


    <%@include file="includes/header.jsp" %>

    <p class="alert-success col-xs-2">${passwordChangeSuccess}</p>

    <!-- Личная инофрмация-->
    <div class="personal_information">
        <div class="container">
            <div class="row">
                <div class="personal_header col-sm-offset-3">
                    <h1>${title}</h1>
                </div>
                <div class="container">
                    <div class="col-xs-6">
                        <img src="${user.photoPath}">
                    </div>
                    <div class="col-xs-6">
                        <p>Ф.И.О: ${user.lastName} ${user.firstName} ${user.middleName}</p>
                        <p>Модерация
                            <c:if test="${user.checked == false}">
                                не пройдена</p>
                                <p>Пока вы не прошли модерацию, вы не можете добавлять новости, учавстовать в проектах,
                                    оставлять заказы и бронировать оборудование.
                            </c:if>
                            <c:if test="${user.checked == true}">
                                пройдена
                            </c:if>
                        </p>
                        <p>Дата рождения: ${user.dateOfBirth}</p>
                        <p>Логин: ${user.username}</p>
                        <p>E-mail: ${user.email}</p>
                        <p>Органицзация: ${user.organization}</p>
                        <p>Статус:
                            <c:if test="${user.role.id == 1}">
                                Обычный пользователь
                            </c:if>
                            <c:if test="${user.role.id == 2}">
                                Заказчик
                            </c:if>
                            <c:if test="${user.role.id == 3}">
                               Модератор
                            </c:if>
                            <c:if test="${user.role.id == 4}">
                               Администратор
                            </c:if>
                        </p>
                        <p>Проекты:
                            <c:forEach items="${userProjects}" var="project" varStatus="status">
                                <a href="/project-detailed?projectId=${project.id}">${project.name}</a>
                                <c:if test="${!status.last}">
                                    ,
                                </c:if>
                            </c:forEach>
                        </p>
                        <p>Github: ${user.github}</p>
                        <p>Контактные данные: ${user.contactDetails}</p>
                        <p>О себе: ${user.about}</p>
                    </div>
                </div>
                <div class="btn-group col-xs-4">
                    <button type="submit" class="btn btn-primary btn-lg" onclick="window.history.back()">
                        Назад
                    </button>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN') or hasRole('ROLE_MODERATOR') or '${user.id}' == '${logUser.id}'">
                    <div class="btn-group col-xs-3">
                        <a href="/user/${user.id}/bookings">
                            <button type="submit" class="btn btn-primary btn-lg">
                                Бронирования
                            </button>
                        </a>
                    </div>
                </sec:authorize>
                <sec:authorize access="hasRole('ROLE_ADMIN') or '${user.username}' == '${logUser.username}'">
                    <div class="btn-group col-xs-4">
                        <a href="/change-profile/${user.id}">
                            <button type="submit" class="btn btn-primary btn-lg">
                                Изменить данные
                            </button>
                        </a>
                    </div>
                </sec:authorize>
                <sec:authorize access="(hasRole('ROLE_ADMIN') and '${logUser.role.id == 4}') or (hasRole('ROLE_MODERATOR') and '${logUser.role.id == 3}')">
                    <div class="col-xs-6"></div>
                    <div class="btn-group col-xs-6">
                        <a href="/moderation">
                            <button type="submit" class="btn btn-primary btn-md">
                                Модерация контента
                            </button>
                        </a>
                    </div>
                </sec:authorize>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>

</body>
</html>
