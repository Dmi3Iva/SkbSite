<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<!doctype html>
<html lang="ru">

<head>
  <title>СКБ</title>
  <%@include file="includes/head.jsp"%>
  
  <link rel="stylesheet" type="text/css" href="/resources/css/equipment_booking.css">
  <link rel="stylesheet" type="text/css" href="/resources/bootstrap-datepicker/css/bootstrap-datepicker.css">
  <script src="/resources/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js"></script>
  <script src="/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>

</head>

<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>


  <%@include file="includes/header.jsp" %>

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

  <%@include file="includes/footer.jsp" %>
  <script>
      $(document).ready(
          $('#Date input').datepicker({
              maxViewMode: 2,
              todayBtn: "linked",
              clearBtn: true,
              language: "ru",
              daysOfWeekDisabled: "0",
              todayHighlight: true
          })
      )
  </script>
</body>
</html>
