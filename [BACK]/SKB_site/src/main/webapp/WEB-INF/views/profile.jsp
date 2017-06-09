<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="src" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                        <p>Пол: мужской</p>
                        <p>Логин: ${user.username}</p>
                        <p>E-mail: ${user.email}</p>
                        <p>Органицзация: ${user.organization}</p>
                        <p>Проекты: Телеграмм, ВК</p>
                        <p>Github: ${user.github}</p>
                        <p>Контактные данные: ${user.contactDetails}</p>
                        <p>О себе: ${user.about}</p>
                    </div>
                </div>
                <sec:authorize access="hasRole('ROLE_ADMIN') or principal.username == '${user.username}'">
                    <div class="btn-group col-xs-6 col-xs-offset-6">
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


    <!--можно изменить себя -->




    <%@include file="footer.jsp" %>

    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
