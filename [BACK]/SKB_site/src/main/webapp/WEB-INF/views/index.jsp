<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value = "#{pageContext.request.contextPath}"/>

<!doctype html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>СКБ</title>
    <link type="text/css" rel="stylesheet" href="${contextPath}/resources/css/main.css">
</head>
<body>
<!--Left and right section -->
<div id = "left_grey"></div>
<div id = "right_grey"></div>
<!--HEADER -->
<header>
    <div id = "title"><a href="index.html"> Студенческое контсрукторское бюро </a></div>
    <div id = "registration"> <a href="registration">Регистрация</a></div>
    <div id = "enter"><a href="login">Вход</a></div>
</header>

<div id="content">
    <a href = "index.html"><img id = "logo" src = "${contextPath}/resources/images/logo.png" alt = "Логотип СКБ"></a>
    <nav id="main_nav">
        <ul>
            <li><a href = "index.html">Новости</a></li>
            <li><a href = "#">Оборудование</a></li>
            <li><a href = "#">Проекты</a></li>
            <li><a href = "#">Заказы</a></li>
            <li><a href = "#">О нас</a></li>
            <li>
                <div id = "search">
                    <input placeholder="Поиск по разделу">
                </div>
            </li>
        </ul>
        <!--<form class="navbar-form navbar-left" role="search">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="">
            </div>
            <button type="submit" class="btn btn-default">Найти</button>
        </form>-->
    </nav>
    <br class="clear">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
        <p>Welcome ${pageContext.request.userPrincipal.name}</p>
        <p>Ваши роли: ${pageContext.request.userPrincipal.authorities}</p>
        <a onclick="document.forms['logoutForm'].submit()">Выйти</a>
    </c:if>
    <c:if test="${logoutMessage != null}">
        <h4>${logoutMessage}</h4>
    </c:if>
    <div id = "news">
        <c:if test="${!empty news}">
            <c:forEach items="${news}" var="item">
                <div class="articles__horizontal">
                    <article class="article">
                        <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg">
                            <div class="article__info">Автор: ${item.author.username}<br>
                                <div class="article__info__preview">${item.article}<a href="#">Подробнее...</a></div>
                    </article>
                </div>
            </c:forEach>
        </c:if>
        <!--
        <div class="row">
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg">
                        <div class="article__info">Автор: mr.Panda<br>
                            <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg"></div>
                    <div class="article__info">Автор: mr.Panda
                        <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg"></div>
                    <div class="article__info">Автор: mr.Panda
                        <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
        </div>

        <div class="row">
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg">
                        <div class="article__info">Автор: mr.Panda<br>
                            <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg"></div>
                    <div class="article__info">Автор: mr.Panda
                        <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
            <div class="articles__horizontal">
                <article class="article">
                    <div class="article__image"><img src="${contextPath}/resources/images/koala.jpg"></div>
                    <div class="article__info">Автор: mr.Panda
                        <div class="article__info__preview">Панда взломал сайт СКБ. Что мы вообще знаем о пандах? Так в чем же секрет энергии mr.Panda?<a href="#">Подробнее...</a></div>
                </article>
            </div>
            -->
        </div>

    </div>

    <!--FOOTER -->
    <footer>
        <!--<nav id="footer_nav">
            <ul>
                <li><a href = "index.html">Новости</a></li>
                <li><a href = "projects.html">Проекты</a></li>
                <li><a href = "equipments.html">Оборудование</a></li>
                <li><a href = "orders.html">Заказы</a></li>
                <li><a href = "about.html">О нас</a></li>
            </ul>
        </nav> -->
        <div class = "footer_right">Мы в социальных сетях</div>
        <div id = "footer_news"><a href="/index">Новости</a></div>
        <div class = "footer_right">
            <a href="https://vk.com"><img src="${contextPath}/resources/images/vk.png" alt="Vkontakte"></a>
            <a href="https://instagram.com"><img src="${contextPath}/resources/images/instagram.png" alt="Instagram"></a>
            <a href="https://twitter.com"><img src="${contextPath}/resources/images/twitter.png" alt="Twitter"></a>
        </div>
        <div id = "footer_equipments"><a href="#">Оборудование</a></div>
        <div id = "footer_projects"><a href="#">Проекты</a></div>
        <div class = "footer_right">Copyright &copy 2017</div>
        <div id = "footer_orders"><a href="#">Заказы</a></div>
        <div class = "footer_right">Сайт разработала команда TRIP</div>
        <div id = "footer_about"><a href="#">О нас</a></div>
    </footer>
</body>

</html>