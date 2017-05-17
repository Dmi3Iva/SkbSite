<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var = "contextPath" value = "${pageContext.request.contextPath}"/>
<c:set var = "userPrincipal" value = "${pageContext.request.userPrincipal}"/>

<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/index.css">

    <!--Незримая форма, помогающая выйти-->
    <form id="logoutForm" method="POST" action="${contextPath}/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
</head>
<body>
<nav class="navbar navbar-default navbar-toggleable-md navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Студентческое конструкторское бюро</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse navbar-right">
            <form class="navbar-nav navbar-form  ">
                <div class="form-group">
                    <input type="text" placeholder="Поиск" class="form-control">
                </div>
                <button type="submit" class="btn btn btn-default">Найти</button>
            </form>

            <ul class="nav navbar-nav">
                <!--Если пользователь не зарегистрирован, то в хедере выводятся кнопки "Регистрация", "Войти"-->
                <c:if test = "${userPrincipal.name == null}">
                    <li>
                        <a class="nav-link" href="/registration"><span class="glyphicon glyphicon-user"></span> Регистрация </a>
                    </li>
                    <li>
                        <a class="nav-link" href="/authorization"><span class="glyphicon glyphicon-log-in"></span> Вход </a>
                    </li>
                </c:if>
                <!--Иначе выводятся "Личный кабинет" и "Выйти"-->
                <c:if test = "${userPrincipal.name != null}">
                    <li>
                        <a class="nav-link" href="/profile"><span class="glyphicon glyphicon-user"></span> Личный кабинет </a>
                    </li>
                    <li>
                        <a class="nav-link" href="#" onclick="document.forms['logoutForm'].submit()"><span class="glyphicon glyphicon-log-out"></span> Выход </a>
                    </li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

    <!--Основная навигация-->
    <nav>
        <div class="masthead">

            <div class="container">
                <div class="row">
                    <div class="col-sm-2 hidden-xs">
                        <a class="logotip" href="/index"><img src ="${contextPath}/resources/images/logo.png"></a>
                    </div>
                    <div class="col-sm-10 mx-auto">
                        <ul id="main_nav" class="nav nav-justified">
                            <li class=" visible-xs"><a class="logotip" href=""><img src ="${contextPath}/resources/images/logo-100.png"></a></li>
                            <li class=""><a href= "/news" >Новости</a></li>
                            <li class=""><a href="#">Оборудование</a></li>
                            <li class=""><a href="#">Проекты</a></li>
                            <li class=""><a href="#">Заказы</a></li>
                            <li class=""><a href="#">О нас</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>

    <!--Приветствие для авторизоавнного пользователя-->
    <%--<c:if test="${pageContext.request.userPrincipal.name != null}">--%>
        <%--<form id="logoutForm" method="POST" action="${contextPath}/logout">--%>
            <%--<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
        <%--</form>--%>
        <%--Welcome ${pageContext.request.userPrincipal.name}--%>
        <%--<a onclick="document.forms['logoutForm'].submit()">Выйти</a>--%>
    <%--</c:if>--%>
    <%--<c:if test="${logoutMessage != null}">--%>
        <%--<br/><h4>${logoutMessage}</h4>--%>
    <%--</c:if>--%>

    <!-- main-->
    <div id="carousel" class="carousel slide">
        <!--Индикаторы слайдов -->
        <ol class="carousel-indicators">
            <li class="active" data-target="#carousel" data-slide-to="0"></li>
            <li data-target="#carousel" data-slide-to="1"></li>
            <li data-target="#carousel" data-slide-to="2"></li>
        </ol>

        <!--Слайды -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="${contextPath}/resources/images/drop1.jpg" width="50%" alt="drop1">
                <div class="carousel-caption">
                    <h3>СКБ ньюз</h3>
                    <p>Скандал. Юные шмодники часам стоят в очереди, чтобы забронировать оборудование в СКБ.</p>
                </div>
            </div>
            <div class="item">
                <img src="${contextPath}/resources/images/drop2.jpg" width="50%" alt="drop2">
                <div class="carousel-caption">
                    <h3>СКБ ньюз</h3>
                    <p>Делают, они это, разумеется не для себя, а для перепродажи.</p>
                </div>
            </div>
            <div class="item">
                <img src="${contextPath}/resources/images/drop3.jpg" width="50%" alt="drop3">
                <div class="carousel-caption">
                    <h3>СКБ ньюз</h3>
                    <p>Будьте бдительный и бронируйте быстрей. Или пишите ботов.</p>
                </div>
            </div>
        </div>


        <!--Стрелки переключения между вкладками-->
        <a href="#carousel" class="left carousel-control" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a href="#carousel" class="right carousel-control" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>



<div class="container" >
    <div class= "row">



        <!--Новости и проекты-->
        <div class="row">
            <!--Новости раздел-->
            <div class="col-md-6" >
                <ul class="titleHead">
                    <li><div class="smallBlueBox"></div></li>
                    <li><h3>Новости</h3></li>
                    <li>
                        <div align="center" class=link>
                            <a href="#">смотреть всё</a>
                        </div>
                    </li>
                </ul>

                <!--Новости уровень 1-->

                <div class="row">
                    <div class="col-md-6 block">
                        <img src="${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="100%">
                    </div>
                    <div class="col-md-6 block">
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Енот устал писать макет этого сайта,
                            но он не сдаётся
                        </p>
                        <p class="article">
                            Отрывок из книжки Енотика
                            На долю нашего поколения не досталось великой войны или
                            великой депрессии, поэтому мы должны сами объявить войну...
                        </p>
                        <p class="detailes">
                            <a href="#">Подробнее...</a>
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-6 block">
                        <img src="${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="100%">
                    </div>
                    <div class="col-md-6 block">
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Енот устал писать макет этого сайта,
                            но он не сдаётся
                        </p>
                        <p class="article">
                            Отрывок из книжки Енотика
                            На долю нашего поколения не досталось великой войны или
                            великой депрессии, поэтому мы должны сами объявить войну...
                        </p>
                        <p class="detailes">
                            <a href="#">Подробнее...</a>
                        </p>
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <ul class="titleHead">
                    <li><div class="smallBlueBox"></div></li>
                    <li><h3>Проекты</h3></li>
                    <li>
                        <div align="center" class=link>
                            <a href="#">смотреть всё</a>
                        </div>
                    </li>
                </ul>
                <div class="row">
                    <div class="col-xs-6 block">
                        <img src="${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="100%">
                    </div>
                    <div class="col-xs-6 block">
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Енот устал писать макет этого сайта,
                            но он не сдаётся
                        </p>
                        <p class="article">
                            Отрывок из книжки Енотика
                            На долю нашего поколения не досталось великой войны или
                            великой депрессии, поэтому мы должны сами объявить войну...
                        </p>
                        <p class="detailes">
                            <a href="#">Подробнее...</a>
                        </p>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-6 block">
                        <img src="${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="100%">
                    </div>
                    <div class="col-xs-6 block">
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Енот устал писать макет этого сайта,
                            но он не сдаётся
                        </p>
                        <p class="article">
                            Отрывок из книжки Енотика
                            На долю нашего поколения не досталось великой войны или
                            великой депрессии, поэтому мы должны сами объявить войну...
                        </p>
                        <p class="detailes">
                            <a href="#">Подробнее...</a>
                        </p>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>


    <!--Footer -->
    <footer class="footer_navbar">
        <div class="container">
            <div class="row">
                <div class="col-xs-12">
                    <div class="col-xs-6">
                        <ul class="list-unstyled">
                            <li><a href="#">Новости</a></li>
                            <li><a href="#">Оборудование</a></li>
                            <li><a href="#">Проекты</a></li>
                            <li><a href="#">Заказы</a></li>
                            <li><a href="#">О нас</a></li>
                        </ul>
                    </div>
                    <div class="col-xs-6">
                        <ul class="list-unstyled text-right">
                            <li>Мы в социальных сетях</li>
                            <li class="socialIcons text-right">
                                <a href="https://vk.com"><img src="${contextPath}/resources/images/vk.png" alt="Vkontakte">
                                </a>
                                <a href="https://instagram.com"><img src="${contextPath}/resources/images/instagram.png" alt="Instagram"></a>
                                <a href="https://twitter.com"><img src="${contextPath}/resources/images/twitter.png" alt="Twitter"></a>
                            </li>
                            <li><br></li>
                            <li>Copyright &copy 2017</li>
                            <li>Сайт разработала команда TRIP</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="../../resources/js/jquery.min.js"></script>
<script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
<script>window.jQuery</script>
<script src="../../resources/js/tether.min.js"></script>
<script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>