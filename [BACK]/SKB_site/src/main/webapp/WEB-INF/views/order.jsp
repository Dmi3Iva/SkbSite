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
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/order.css">
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
            <h3>Заказы</h3></li>
        </ul>
      </div>
    </div>
    <!--Новости уровень 1-->

    <div class="row ">
      <div class="lineblue">
        <div class="col-md-8 lineblue">


          <p class="title">
            Сайт с личным кабинетом
          </p>
          <p class="article">
            Необходимо собрать рабочий проект, можно с шаблонным дизайном. Можно сделать его на готовых CMS если это вообще возможно. Требования в файле.
          </p>
          <a href="#" class="file">
            Ссылка тип на файл.pnh
          </a>
          <div class="names">
            <p>
              Заказчик: Александр
            </p>
            <p>Исполнитель неопределён</p>
          </div>
          <a class=detailes href="#">Подробнее...</a>
        </div>
        <div class="col-xs-4 image hidden-xs hidden-sm">
          <img src="${contextPath}/resources/images/order.png" alt="girl" width="100%">
        </div>

      </div>
    </div>
    <div class="row ">
      <div class="lineblue">
        <div class="col-md-8 lineblue">


          <p class="title">
            Сайт с личным кабинетом
          </p>
          <p class="article">
            Необходимо собрать рабочий проект, можно с шаблонным дизайном. Можно сделать его на готовых CMS если это вообще возможно. Требования в файле.
          </p>
          <a href="#" class="file">
            Ссылка тип на файл.pnh
          </a>
          <div class="names">
            <p>
              Заказчик: Александр
            </p>
            <p>Исполнитель неопределён</p>
          </div>
          <a class=detailes href="#">Подробнее...</a>
        </div>
        <div class="col-xs-4 image hidden-xs hidden-sm">
          <img src="${contextPath}/resources/images/order.png" alt="girl" width="100%">
        </div>

      </div>
    </div>

    <div class="row ">
      <div class="lineblue">
        <div class="col-md-8 lineblue">


          <p class="title">
            Сайт с личным кабинетом
          </p>
          <p class="article">
            Необходимо собрать рабочий проект, можно с шаблонным дизайном. Можно сделать его на готовых CMS если это вообще возможно. Требования в файле.
          </p>
          <a href="#" class="file">
            Ссылка тип на файл.pnh
          </a>
          <div class="names">
            <p>
              Заказчик: Александр
            </p>
            <p>Исполнитель неопределён</p>
          </div>
          <a class=detailes href="#">Подробнее...</a>
        </div>
        <div class="col-xs-4 image hidden-xs hidden-sm">
          <img src="${contextPath}/resources/images/order.png" alt="girl" width="100%">
        </div>

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
