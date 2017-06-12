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




  <!--мой вариант -->
  <div class="forFont">
    <div class="container" >
      <form:form method="POST"  modelAttribute="easyTime">

        <div class="form-group">
          <label class="control-label col-xs-3" >Введите начало бронирования</label>
          <spring:bind path="begin">
            <div class="col-xs-9">
              <form:input type = "datetime-local" path="begin" />
              <form:errors path="begin"/>
            </div>
          </spring:bind>
        </div>
        <div class="form-group">
          <label class="control-label col-xs-3" >Введите конец бронирования</label>
          <spring:bind path="end">
          <div class="col-xs-9">
            <form:input type = "datetime-local" path="end" />
            <form:errors path="end"/>
          </div>
          </spring:bind>
        </div>
        <div class="col-xs-offset-8 col-xs-4">
          <button type="submit" class="btn btn-default btn-md">Забронировать</button>
        </div>
        </form:form>
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
