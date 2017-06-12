<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page pageEncoding="UTF-8"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="${contextPath}/resources/images/logo.png">

    <title>СКБ</title>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/about.css">
</head>
<body>

<div id="leftSide">
</div>
<div id="rightSide">
</div>

<%@include file="header.jsp" %>


<h1 class="text-center">О нас</h1>

<div class="container content">
    <div class="row">
        <div class="col-sm-4 col-sm-offset-2">
            <div class="text">
                <p>Сегодня каждое предприятие, организация или сообщество для коммуникации и организации работы должно иметь свою страницу в сети интернет. Удаленное общение помогает быстрее и качественнее справляться с поставленными целями и задачами. Современные средства позволяют наглядно и быстро делать и показывать информационный контент.
                </p>
            </div>
        </div>
        <div class="col-sm-4">
            <img class="image" src="../../resources/images/Photo/IMG_0019.JPG">
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4 col-sm-offset-2">
            <img class="image" src="../../resources/images/Photo/IMG_0003.JPG">
        </div>
        <div class="col-sm-4 ">
            <div class="text">
                <p>Для всех этих целей необходим веб-портал. Так для нашего “студенческого конструкторского бюро” необходим свой, который будет предоставлять возможности кооперативной разработки, что даст участникам удобную площадку для достижения своих целей в сферах науки и образования.
                </p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="text">
                <p>Так получилось, что такой важной площадки на данный момент не имеется и созданием её занялись  студенты, для них это курсовая. В процессе разработки ими были исследованы следующие программные компоненты, языки вёрстки, языки программирования и фреймворки: Jetty(сервер), Java, Spring, html, css, javaScript, jsp, postgreSQL. Также разработка имела в виду под собой работу приложения с использованием распараллеливания процессов, которая осуществлена с помощью java и фреймворка spring.
                </p>
            </div>
        </div>
        <%--<div class="col-sm-4">--%>
            <%--<img class="image" src="../../resources/images/Photo/IMG_0012.JPG">--%>
        <%--</div>--%>

    </div>

</div>

<%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
