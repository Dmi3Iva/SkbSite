<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

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
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment_booking.css">

  <!--datetime css-->
  <link href="${contextPath}/resources/bootstrap-datetimepicker-master/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
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
      <div class="col-md-6">

        <c:if test="${!empty basket}">
          <h1>В вашей корзине:</h1>
          <form method="post">

          <c:forEach items="${basket}" var="item">
            <div class="row">
                  <div class="col-xs-4">
                    <label>${item.name} </label>
                  </div>
                  <div class="col-xs-1">
                    <button>-</button>
                  </div>
                  <div class="col-xs-2">
                    <input type="hidden" name="equipmentTypeCount.id[${item.id}]" />
                    <input type="number" class="form-control" name="equipmentTypeCount.count[${item.id}]" value="1" placeholder="${equipmentTypeCount.count[item.id]}"/>
                  </div>
                  <div class="col-xs-1">
                    <button>+</button>
                  </div>
              </div>
          </c:forEach>
          </form>
        </c:if>

        <c:if test="${empty basket}">
          <h1>Ваша корзина пуста</h1>
        </c:if>
      </div>


      <div class="col-md-6">
        <div class="row">
          <div class="text-center">
            Выберите дату бронирования
          </div>
          <div class="col-xs-offset-1 col-xs-5">
            День: <input type="date">
          </div>
          <div class="col-xs-offset-1 col-xs-5">
            Время:
            <select multiple size="20">
              <option>8.30-9.00</option>
              <option>9.00-9.30</option>
              <option>9.30-10.00</option>
              <option>10.00-10.30</option>
              <option>10.30-11.00</option>
              <option>11.00-11.30</option>
              <option>11.30-12.00</option>
              <option>12.00-12.30</option>
              <option>12.30-13.00</option>
              <option>13.00-13.30</option>
              <option>13.30-14.00</option>
              <option>14.00-14.30</option>
              <option>14.30-15.00</option>
              <option>15.00-15.30</option>
              <option>15.30-16.00</option>
              <option>16.00-16.30</option>
              <option>16.30-17.00</option>
              <option>17.00-17.30</option>
              <option>17.30-18.00</option>
              <option>18.00-18.30</option>
            </select>
          </div>
        </div>
        <div class="col-xs-offset-8 col-xs-4">
          <button type="button" class="btn btn-default btn-md">Забронировать</button>
        </div>
      </div>
    </div>
    </div>

  <!--мой вариант -->
  <div class="forFont">
    <div class="container" >

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
