<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value = "#{pageContext.request.contextPath}"/>

<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/main.css">

</head>
<body>
<!--Left and right section -->
    <div id="leftSide"></div>
    <div id="rightSide"></div>

<!--HEADER -->
    <nav class="navbar navbar-toggleable-sm navbar-default fixed-top my_header ">
        <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse"
                data-target="#navbarsDefault" aria-controls="navbarsExampleDefault"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="glyphicon glyphicon-menu-hamburger"></span>
        </button>
        <a class="navbar-brand pt-3 px-0" href="#">Студентческое конструкторское бюро</a>
        <div class="collapse navbar-collapse" id="navbarsDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/registration"><span class="glyphicon glyphicon-user"></span> Регистрация </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/authorization"><span class="glyphicon glyphicon-log-out"></span> Вход </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Поиск">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Поиск</button>
            </form>
        </div>
    </nav>

    <!--Основная навигация-->
    <nav>
        <div class="masthead">

            <div class="container">
                <div class="row">
                    <div class="col-sm-2 hidden-xs">
                        <a class="logotip" href="/index_student"><img src ="${contextPath}/resources/images/logo.png"></a>
                    </div>
                    <div class="col-sm-10 mx-auto">
                        <ul id="main_nav" class="nav nav-justified">
                            <li class=" visible-xs"><a class="logotip" href=""><img src ="${contextPath}/resources/images/logo-100.png"></a></li>
                            <li class=""><a href="#">Новости</a></li>
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
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        Welcome ${pageContext.request.userPrincipal.name}
        <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
    </c:if>
    <c:if test="${logoutMessage != null}">
        <br/><h4>${logoutMessage}</h4>
    </c:if>

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

                <!--Новости-->
                <div class="col-md-6" >
                    <ul id ="news">
                        <li><div class="smallBlueBox"></div></li>
                        <li><h3>Новости</h3></li>
                        <li>
                            <div align="center" class=link>
                                <a href="#">смотреть всё</a>
                            </div>
                        </li>
                    </ul>

                    <!--Новости-->
                    <div class="block">
                        <img src = "${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="250">
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
                    <!--новотсь уровня 2-->
                    <div class="block">
                        <img src="${contextPath}/resources/images/enot.jpg" alt="enot">
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Студенты работающие в скб решили
                            создать киборга
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
                    <!--проект1-->

                </div>

                <!--проекты-->
                <div class="col-md-6" >
                    <ul id="projects">
                        <li><div class="smallBlueBox"></div></li>
                        <li><h3>Проекты</h3></li>
                        <li>
                            <div align="center" class=link>
                                <a href="#">смотреть всё</a>
                            </div>
                        </li>
                    </ul>

                    <div class="block">
                        <img src="${contextPath}/resources/images/enot.jpg" alt="enot" >
                        <p class="description">
                            Автор:  Енот
                            09.03.2017
                            18:35
                        </p>
                        <p class = "title">
                            Студенты работающие в скб решили
                            создать киборга
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
                    <!--проект2-->
                    <div class="block">
                        <img src = "${contextPath}/resources/images/girl-w250.jpg" alt="girl" width="250" align="left">
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
                            <a href="#">  Подробнее...</a>
                        </p>
                    </div>
                </div>

                <!--close row-->
            </div>
            <!--close container-->
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

    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="https://v4-alpha.getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>


    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="${contextPath}/resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>