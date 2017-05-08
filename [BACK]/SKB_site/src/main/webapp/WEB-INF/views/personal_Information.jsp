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
    <link href="${contextPath}/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/personal_Information.css">

</head>
<body>

    <div id="leftSide">
    </div>
    <div id="rightSide">
    </div>


    <!--header-->
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
                    <a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span> Личный кабинет </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="glyphicon glyphicon-log-out"></span> Выход </a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="text" placeholder="Поиск">
                <button class="btn btn-secondary my-2 my-sm-0" type="submit">Поиск</button>
            </form>
        </div>
    </nav>



    <!--navbar-->
    <nav>
        <div class="masthead">

            <div class="container">
                <div class="row">
                    <div class="col-sm-2 hidden-xs">
                        <a class="logotip" href="index_student.html"><img src ="${contextPath}/resources/images/logo.png"></a>
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
                        <p>Ф.И.О: Опасность Павел Эдуардович</p>
                        <p>Логин: ~М а М и Н  М о Д н И к~</p>
                        <p>E-mail: hypebeast256@mail.ru</p>
                        <p>Органицзация: Фриланс</p>
                        <p>Проекты: Телеграмм, ВК</p>
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
                    <button type="submit" class="btn btn-primary btn-lg">
                        Выход
                    </button>
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

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
