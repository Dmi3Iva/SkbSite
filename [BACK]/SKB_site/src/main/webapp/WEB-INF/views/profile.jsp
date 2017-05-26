<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                        <img src="${contextPath}/resources/images/hacker.jpg">
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
                        <p>Мобильный телефон: 88005553535</p>
                        <p>О себе: ${user.about}</p>
                    </div>
                </div>
                <div class="col-xs-6">
                    <button type="submit" class="btn btn-primary hidden-sm hidden-xs btn-lg">Загрузить новое изображение</button>
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
