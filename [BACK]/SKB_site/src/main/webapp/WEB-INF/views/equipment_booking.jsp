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
  <link rel="icon" href="images/logo.png">

  <title>СКБ</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment_booking.css">

  <!--datetime css-->
  <link href="${contextPath}/resources/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
      </div>
      <!--/.nav-collapse -->
    </div>
  </nav>

  <!--navbar-->
  <nav>
    <div class="masthead">

      <div class="container">
        <div class="row">
          <div class="col-sm-2 hidden-xs">
            <a class="logotip" href="#"><img src="images/logo.png"></a>
          </div>
          <div class="col-sm-10">
            <ul id="main_nav" class="nav nav-justified">
              <li class=" visible-xs">
                <a class="logotip" href="#"><img src="images/logo-100.png"></a>
              </li>
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
      <div class="col-xs-9">
        <ul class="titleHead">
          <li>
            <div class="smallBlueBox"></div>
          </li>
          <li>
            <h3>Оборудование</h3></li>
        </ul>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4">
        <table class="table">
          <caption>Вами забронированы следующие устройства</caption>
          <thead>
            <tr>
              <th>№</th>
              <th>Устройство</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Ардруино</td>
            </tr>
            <tr>
              <td>2</td>
              <td>Ардруино</td>
            </tr>
            <tr>
              <td>3</td>
              <td>Ардруино</td>
            </tr>
            <tbody>
        </table>

      </div>

      <div class="col-md-8">
        <!--Выбор даты-->
        <div class="form-group">
          <label for="dtp_input2" class="col-md-2 control-label">День бронирования</label>
          <div class="input-group date form_date col-md-5" data-date="" data-date-format="dd MM yyyy" data-link-field="dtp_input2" data-link-format="yyyy-mm-dd">
            <input class="form-control" size="16" type="text" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
          </div>
          <input type="hidden" id="dtp_input1" value="" /><br/>
        </div>
        <canvas id="timePlot" width="700px" height="200px" style="border: 1px solid #000">
              Your browser does not support the HTML5 canvas tag
            </canvas>
        <!--выбор времени-->
<div class="row">
  <div class="col-md-6">
      <ul class="red">
        <li class="block"></li>
        <li class="text"> - время забронировано</li>
      </ul>
      <ul class="blue">
        <li class="block"></li>
        <li class="text"> - выбранное время</li>
      </ul>
      <ul class="whiteblue">
        <li class="block"></li>
        <li class="text"> - свободное время</li>
      </ul>
    </div>
    <div class="col-md-6">
      <div class="row">
        <div class="form-group">
          <label for="dtp_input3" class="col-md-6 control-label">Время бронирования</label>
          <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
            <input class="form-control" size="16" type="text" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
          </div>
          <input type="hidden" id="dtp_input2" value="" /><br/>
          </div>


        <div class="form-group">
          <label for="dtp_input3" class="col-md-6 control-label">время окончания бронинрования</label>
          <div class="input-group date form_time col-md-5" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii">
            <input class="form-control" size="16" type="text" value="" readonly>
            <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
            <span class="input-group-addon"><span class="glyphicon glyphicon-time"></span></span>
          </div>
          <input type="hidden" id="dtp_input3" value="" /><br/>

          <button type="button" class="btn btn-default btn-lg">Забронировать</button>
        </div>
        </div>
        </div>
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
              <li>Мы в социальных сетях
                <li>
                  <li class="socialIcons text-right">
                    <a href="https://vk.com"><img src="images/vk.png" alt="Vkontakte">
                    </a>
                    <a href="https://instagram.com"><img src="images/instagram.png" alt="Instagram"></a>
                    <a href="https://twitter.com"><img src="images/twitter.png" alt="Twitter"></a>
                  </li>
                  <li><br></li>
                  <li>Copyright &copy 2017</li>
                  <li>Сайт разработала команда TRIP</li>
            </ul>
          </div>
        </div>
      </div>
  </footer>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
  <script>
    window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
  </script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
  <script src="https://v4-alpha.getbootstrap.com/dist/js/bootstrap.min.js"></script>
  <script src="https://v4-alpha.getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js"></script>
  <script src="js/bootstrap.js"></script>
  <script type="text/javascript">
    $(function() {
      $('#datetimepicker10').datetimepicker({
        viewMode: 'years',
        format: 'dd/MM/YYYY'
      });
    });
  </script>


  <!--datetime-->
  <script type="text/javascript" src="bootstrap-datetimepicker-master/sample-in-bootstrap-v3/jquery/jquery-1.8.3.min.js" charset="UTF-8"></script>
  <script type="text/javascript" src="bootstrap-datetimepicker-master/sample-in-bootstrap-v3/bootstrap/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="bootstrap-datetimepicker-master/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
  <script type="text/javascript" src="bootstrap-datetimepicker-master/js/locales/bootstrap-datetimepicker.fr.js" charset="UTF-8"></script>
  <script type="text/javascript">
    $('.form_datetime').datetimepicker({
      //language:  'fr',
      weekStart: 1,
      todayBtn: 1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      forceParse: 0,
      showMeridian: 1
    });
    $('.form_date').datetimepicker({
      language: 'fr',
      weekStart: 1,
      todayBtn: 1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 2,
      minView: 2,
      forceParse: 0
    });
    $('.form_time').datetimepicker({
      language: 'fr',
      weekStart: 1,
      todayBtn: 1,
      autoclose: 1,
      todayHighlight: 1,
      startView: 1,
      minView: 0,
      maxView: 1,
      forceParse: 0
    });
  </script>
  <!--canvas script-->
  <script>
    var c = document.getElementById("timePlot");
    var ctx = c.getContext("2d");
    ctx.fillStyle = "#0066d2";
    ctx.fillRect(0, 0, 100, 200);
    ctx.stroke();
    ctx.fillStyle = "#7F0000";
    ctx.fillRect(100, 0, 700, 200);
  </script>

</body>

</html>
