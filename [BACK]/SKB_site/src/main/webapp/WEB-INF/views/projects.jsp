<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!doctype html>
<html lang="ru">

<head>
  <meta charset="utf-8" />
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="${contextPath}/resources/images/logo.png">

  <title>СКБ</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/project.css">
</head>

<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="header.jsp" %>

  <div class="container content">
    <!--Новости и проекты-->
    <div class="row">
      <!--Новости раздел-->
      <div class="col-md-6">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Проекты</h3></li>
        </ul>
      </div>
    </div>
    <!--Новости уровень 1-->

    <div class="row">
      <div class="col-md-8">
        <div class="new">

          <p class="title">
            free-for-dev
          </p>
          <p>Команда:
            <a href="#">Человек1</a>
            <a href="#">Человек2</a>
            <a href="#">Человек3</a>
          </p>
          <p>Капитан:<a href="#">Человек</a></p>
          <p>Статус проекта:</p>
          <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
              60%
            </div>
          </div>
          <p>Описание:</p>
          <p class="article">
            Developers and Open Source authors now have a massive amount of services offering free tiers, but it can be hard to find them all in order to make informed decisions. This is list of software (SaaS, PaaS, IaaS, etc.) and other offerings that have free
            tiers for developers. The scope of this particular list is limited to things infrastructure developers (System Administrator, DevOps Practitioners, etc.) are likely to find useful. We love all the free services out there, but it would be good
            to keep it on topic. It's a bit of a grey line at times so this is a bit opinionated; do not be offended if I do not accept your contribution. You can help by sending Pull Requests to add more services. Once I have a good set of links in this
            README file, I'll look into a better layout for the information and links (help with that is appreciated too). NOTE: This list is only for as-a-Service offerings, not for self hosted software.
          </p>
          <ul class="detailes">
            <li>

              <a href="#">Подробнее...</a>

            </li>
            <li>

              <p class="description">
                Автор: Енот 09.03.2017 18:35
              </p>

            </li>
          </ul>


        </div>
      </div>
      <div class="col-xs-4 image hidden-xs hidden-sm">
        <img src="${contextPath}/resources/images/drop3.jpg" alt="girl" width="100%">
      </div>
    </div>

    <div class="row">
      <div class="col-md-8">
        <div class="new">

          <p class="title">
            free-for-dev
          </p>
          <p>Команда:
            <a href="#">Человек1</a>
            <a href="#">Человек2</a>
            <a href="#">Человек3</a>
          </p>
          <p>Капитан:<a href="#">Человек</a></p>
          <p>Статус проекта:</p>
          <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
              60%
            </div>
          </div>
          <p>Описание:</p>
          <p class="article">
            Developers and Open Source authors now have a massive amount of services offering free tiers, but it can be hard to find them all in order to make informed decisions. This is list of software (SaaS, PaaS, IaaS, etc.) and other offerings that have free
            tiers for developers. The scope of this particular list is limited to things infrastructure developers (System Administrator, DevOps Practitioners, etc.) are likely to find useful. We love all the free services out there, but it would be good
            to keep it on topic. It's a bit of a grey line at times so this is a bit opinionated; do not be offended if I do not accept your contribution. You can help by sending Pull Requests to add more services. Once I have a good set of links in this
            README file, I'll look into a better layout for the information and links (help with that is appreciated too). NOTE: This list is only for as-a-Service offerings, not for self hosted software.
          </p>
          <ul class="detailes">
            <li>

              <a href="#">Подробнее...</a>

            </li>
            <li>

              <p class="description">
                Автор: Енот 09.03.2017 18:35
              </p>

            </li>
          </ul>


        </div>
      </div>
      <div class="col-xs-4 image hidden-xs hidden-sm">
        <img src="${contextPath}/resources/images/drop3.jpg" alt="girl" width="100%">
      </div>
    </div>

    <div class="row">
      <div class="col-md-8">
        <div class="new">

          <p class="title">
            free-for-dev
          </p>
          <p>Команда:
            <a href="#">Человек1</a>
            <a href="#">Человек2</a>
            <a href="#">Человек3</a>
          </p>
          <p>Капитан:<a href="#">Человек</a></p>
          <p>Статус проекта:</p>
          <div class="progress">
            <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
              60%
            </div>
          </div>
          <p>Описание:</p>
          <p class="article">
            Developers and Open Source authors now have a massive amount of services offering free tiers, but it can be hard to find them all in order to make informed decisions. This is list of software (SaaS, PaaS, IaaS, etc.) and other offerings that have free
            tiers for developers. The scope of this particular list is limited to things infrastructure developers (System Administrator, DevOps Practitioners, etc.) are likely to find useful. We love all the free services out there, but it would be good
            to keep it on topic. It's a bit of a grey line at times so this is a bit opinionated; do not be offended if I do not accept your contribution. You can help by sending Pull Requests to add more services. Once I have a good set of links in this
            README file, I'll look into a better layout for the information and links (help with that is appreciated too). NOTE: This list is only for as-a-Service offerings, not for self hosted software.
          </p>
          <ul class="detailes">
            <li>

              <a href="#">Подробнее...</a>

            </li>
            <li>

              <p class="description">
                Автор: Енот 09.03.2017 18:35
              </p>

            </li>
          </ul>


        </div>
      </div>
      <div class="col-xs-4 image hidden-xs hidden-sm">
        <img src="${contextPath}/resources/images/drop3.jpg" alt="girl" width="100%">
      </div>
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
