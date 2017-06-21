<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/index-order.css">

</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="header.jsp" %>

    <!-- main-->
    <div id="carousel" class="carousel slide hidden-xs" data-interval="3500" data-ride="carousel">
        <!--Индикаторы слайдов -->
        <ol class="carousel-indicators">
          <li class="active" data-target="#carousel" data-slide-to="0"></li>
          <li data-target="#carousel" data-slide-to="1"></li>
          <li data-target="#carousel" data-slide-to="2"></li>
        </ol>

        <!--Слайды -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="${contextPath}/resources/images/drop1.jpg" alt="drop1">
            <div class="carousel-caption">
              <h3>СКБ ньюз</h3>
              <p>Скандал. Юные шмодники часам стоят в очереди, чтобы забронировать оборудование в СКБ.</p>
            </div>
          </div>
          <div class="item">
            <img src="${contextPath}/resources/images/drop2.jpg" alt="drop2">
            <div class="carousel-caption">
              <h3>СКБ ньюз</h3>
              <p>Делают они это, разумеется не для себя, а для перепродажи.</p>
            </div>
          </div>
          <div class="item">
            <img src="${contextPath}/resources/images/drop3.jpg" alt="drop3">
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

  <%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>


</body>

</html>
