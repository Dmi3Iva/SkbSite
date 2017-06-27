<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>
<html>
<head>
    <title>Личная информация</title>
    <%@include file="includes/head.jsp"%>
    <link rel="stylesheet" type="text/css" href="/resources/css/profile.css">
</head>
<body>

    <div id="leftSide">
    </div>
    <div id="rightSide">
    </div>


    <%@include file="includes/header.jsp" %>

    <!-- Личная инофрмация-->
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
                        <p>Ф.И.О: ${user.lastName} ${user.firstName} ${user.middleName}</p>
                        <p>Дата рождения: ${user.dateOfBirth}</p>
                        <p>Пол: </p>
                        <p>Логин: ${user.username}</p>
                        <p>E-mail: ${user.email}</p>
                        <p>Органицзация: ${user.organization}</p>
                        <p>Статус:
                            <c:if test="${user.customer == true}">
                                Заказчик
                            </c:if>
                            <c:if test="${user.customer == false}">
                                Обычный пользователь
                            </c:if>
                        </p>
                        <p>Проекты:
                            <c:forEach items="${userProjects}" var="project">
                                <a href="/project-detailed?projectId=${project.id}">${project.name}</a>
                                ,
                            </c:forEach>
                        </p>
                        <p>Github: ${user.github}</p>
                        <p>Контактные данные: ${user.contactDetails}</p>
                        <p>О себе: ${user.about}</p>
                    </div>
                </div>
                <div class="btn-group col-xs-6">
                    <button type="submit" class="btn btn-primary btn-lg" onclick="window.history.back()">
                        Назад
                    </button>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN') or '${user.username}' == '${logUser.username}'">
                    <div class="btn-group col-xs-6">
                        <a href="/change-profile">
                            <button type="submit" class="btn btn-primary btn-lg">
                                Изменить данные
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
