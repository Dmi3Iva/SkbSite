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
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment_item.css">
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="header.jsp" %>


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
  <c:if test="${!empty equipmentType}">
  <div class="row ">
    <div class="col-md-6 ">
      <div class = "titleName my-auto">
        <h4 class= "my-auto">${equipmentType.name}</h4>
      </div>
      <div class="image">
        <img src="${equipmentType.photoPath}" alt="Микроконтроллер1">
      </div>

    </div>
    <div class="col-md-6">
      <h5>Описание</h5>
      ${equipmentType.about}
      <button type="button" class="btn btn-primary btn-lg btn-block">
        Добавить к бронированию
      </button>
    </div>
  </div>

</div>

  <div class="container">
    <div class="rows">
      <div class="col-md-6">
        <h4>Характеристики</h4>
      </div>
    </div>
    <div class="rows">
      <div class="col-md-8">
          ${equipmentType.features}
      </div>
    </div>
  </div>

  </c:if>
  
<div class="container">

  <div class="row">
    <div class="col-xs-5" >
      <h4>Смотрите так же</h4>
    </div>
  </div>

  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="#">
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images\microcontrollers\1.jpg" alt="" width=100%></div>
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
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images\microcontrollers\2.jpg" alt="" width=100%></div>
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
          <div class="col-xs-6 hidden-xs"><img src="${contextPath}/resources/images\microcontrollers\3.jpg" alt="" width=100%></div>
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
  <%@include file="footer.jsp" %>


  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
