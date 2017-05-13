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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment.css">
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


<!--header-->
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

          <ul class="nav navbar-nav ">
            <li>
              <a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span> Личный кабинет </a>
            </li>
            <li>
              <a class="nav-link" href="#"><span class="glyphicon glyphicon-log-out"></span> Выход </a>
            </li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

      <!--navbar-->
      <nav>
      <div class="masthead">

        <div class="container">
          <div class="row">
              <div class="col-sm-2 hidden-xs">
                <a class="logotip" href="#"><img src ="${contextPath}/resources/images/logo.png"></a>
              </div>
              <div class="col-sm-10">
                <ul id="main_nav" class="nav nav-justified">
                  <li class=" visible-xs"><a class="logotip" href="#"><img src ="${contextPath}/resources/images/logo-100.png"></a></li>
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
<div class="container">

  <div class="row">
    <div class="col-xs-9" >
      <ul class="titleHead">
        <li><div class="smallBlueBox"></div></li>
        <li><h3>Оборудование</h3></li>
      </ul>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/1.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino Titan</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>Ardruino Titan</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/2.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKR1000</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>
            Ardruino MKR1000
            </p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/3.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
        </a>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/1.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino Titan</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>Ardruino Titan</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/2.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKR1000</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>
            Ardruino MKR1000
            </p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/3.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
        </a>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/1.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino Titan</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>Ardruino Titan</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/2.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKR1000</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>
            Ardruino MKR1000
            </p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/3.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
        </a>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/1.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino Titan</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>Ardruino Titan</p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/2.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKR1000</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>
            Ardruino MKR1000
            </p>
          </div>
        </a>
      </div>
    </div>
    <div class="col-xs-4">
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images/microcontrollers/3.jpg" alt="" width=100%></div>
          <div class="col-xs-6 hidden-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
          <div class="col-xs-12 visible-xs">
            <p>Ardruino MKRFOX1200</p>
          </div>
        </a>
      </div>
    </div>
  </div>



</div>






<!--end main-->

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
                <li>Мы в социальных сетях<li>
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
</footer>

    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
