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
<!--HEADER -->
    <header>
    <!--<a href = "index.html"><img id = "logo" src = "images/Koala.jpg" alt = "Логотип СКБ"> </a> -->
        <h1 id= "logo_name">Студенческое контсрукторское бюро</h1>
            <div id = "entry_form">
                <ul>
                <li><a href="registration.html">Регистраиця</a></li>
                <li><a href="enter.html">Вход</a></li>
                </ul>
            </div>
    </header>
    <br class="clear">
    <nav id="main_nav">
        <ul>
        <li><a href = "index.html">"Новости"</a></li>
        <li><a href = "projects.html">Проекты</a></li>
        <li><a href = "equipments.html">Оборудование</a></li>
        <li><a href = "orders.html">Заказы</a></li>
        <li><a href = "about.html">О нас</a></li>
        </ul>
    </nav>
    <div id = "search"> <input placeholder="Поиск по разделу"></div>
    <!--FOOTER -->
    <footer>
        <nav id="footer_nav">
            <ul>
                <li><a href = "index.html">Новости</a></li>
                <li><a href = "projects.html">Проекты</a></li>
                <li><a href = "equipments.html">Оборудование</a></li>
                <li><a href = "orders.html">Заказы</a></li>
                <li><a href = "about.html">О нас</a></li>
            </ul>
        </nav>
        <p id="about">Сайт делала команда TRIP</p>
    </footer>
</body>

</html>