<%@page pageEncoding="UTF-8"%>
<nav class="navbar navbar-default navbar-toggleable-md navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">Студентческое конструкторское бюро</a>
        </div>
        <div id="navbar" class="hidden-lg navbar-collapse collapse navbar-right main-navbar">
            <form class="navbar-nav navbar-form  ">
                <div class="form-group">
                    <input type="text" placeholder="Поиск" class="form-control">
                </div>
                <button type="submit" class="btn btn btn-default">Найти</button>
            </form>
            <ul class="nav navbar-nav">
                <c:if test = "${userPrincipal.name == null}">
                    <li>
                        <a class="nav-link" href="/registration"><span class="glyphicon glyphicon-user"></span> Регистрация </a>
                    </li>
                    <li>
                        <a class="nav-link" href="/authorization"><span class="glyphicon glyphicon-log-in"></span> Вход </a>
                    </li>
                </c:if>
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
<nav>
    <div class="masthead">
        <div class="container">
            <div class="row">
                <div class="col-sm-2 hidden-xs">
                    <a class="logotip" href="/index"><img src ="${contextPath}/resources/images/logo.png"></a>
                </div>
                <div class="col-sm-10 mx-auto">
                    <ul id="main_nav" class="nav nav-justified">
                        <li class="visible-xs"><a class="logotip" href="/index"><img src ="${contextPath}/resources/images/logo-100.png"></a></li>
                        <li class=""><a href= "/news" >Новости</a></li>
                        <li class=""><a href="/equipment">Оборудование</a></li>
                        <li class=""><a href="/projects">Проекты</a></li>
                        <li class=""><a href="/order">Заказы</a></li>
                        <li class=""><a href="/about">О нас</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>