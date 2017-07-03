<%@ page import="com.kantiana.skb.model.EquipmentType" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="title" value="Бронирование оборудования"/>

<!doctype html>
<html lang="ru">

<head>
  <meta charset="utf-8" />
  <meta name="description" content="">
  <meta name="author" content="">

  <link rel="icon" href="${contextPath}/resources/images/logo.png">

  <title>${title}</title>
  <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment_booking.css">
  <link rel="stylesheet" type="text/css" href="${contextPath}/resources/bootstrap-datepicker/css/bootstrap-datepicker.css">
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script src="${contextPath}/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script src="${contextPath}/resources/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js"></script>

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
            <h3>${title}</h3></li>
        </ul>
      </div>
    </div>


    <div class="row">
      <div class="col-md-6">
        <c:if test="${empty basket}">
          <h1>Ваша корзина пуста</h1>
        </c:if>

        <c:if test="${!empty basket}">
          <h1>В вашей корзине:</h1>
          <form:form modelAttribute="requestEquipment" action="/equipment-booking?${_csrf.parameterName}=${_csrf.token}" method="POST" >

          <c:forEach items="${requestEquipment.equipmentTypeCountList}" var="item" varStatus="status">
            <div class="row">
                <div class="col-xs-4">
                  <label>${item.name} </label>
                </div>
                <div class="col-xs-1">
                  <button>-</button>
                </div>
                <div class="col-xs-2">
                  <form:hidden path="equipmentTypeCountList[${status.index}].id"></form:hidden>
                  <form:input class = "form-control" path="equipmentTypeCountList[${status.index}].count"></form:input>
                </div>
                <div class="col-xs-1">
                  <button>+</button>
                </div>
            </div>
          </c:forEach>




      </div>


      <div class="col-md-6">
        <div class="row">
          <div class="text-center">
            Выберите дату бронирования
          </div>


          <div class=" col-xs-5">
            <label for="Date">Выберите день</label>
            <div id="Date">
              <form:input type = "text" class = "form-control" path="date"></form:input>
              <div></div>
            </div>
          </div>
          <div class="col-xs-5">
            Время:
            <form:select multiple = "true" path="timeChoose" class="form-control">
              <form:options items="${RequestEquipment.timeList}"></form:options>
            </form:select>
          </div>
        </div>
        <div class="col-xs-offset-8 col-xs-4">
          <form:button class="btn btn-default btn-md">Забронировать</form:button>
        </div>
      </div>
    </div>
    </div>
    </form:form>
  </c:if>
  <!--мой вариант -->
  <div class="forFont">
    <div class="container" >

  </div>
  </div>
  </div>

  <!--end main-->

  <%@include file="footer.jsp" %>

  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>
  <script>
      $('#Date input').datepicker({

          maxViewMode: 2,
          todayBtn: "linked",
          clearBtn: true,
          language: "ru",
          daysOfWeekDisabled: "0",
          todayHighlight: true
      });
  </script>



</body>

</html>
