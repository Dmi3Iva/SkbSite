<%@page pageEncoding="UTF-8"%>
<%@include file="includes/aboveHtml.jsp"%>

<c:set var="title" value="Бронирование оборудования"/>
<!doctype html>
<html lang="ru">

<head>
  <%@include file="includes/head.jsp"%>

  <link rel="stylesheet" type="text/css" href="/resources/css/equipment_booking.css">
  <link rel="stylesheet" type="text/css" href="/resources/bootstrap-datepicker/css/bootstrap-datepicker.css">
  <script src="/resources/bootstrap-datepicker/locales/bootstrap-datepicker.ru.min.js"></script>
  <script src="/resources/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <title>${title}</title>

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
          <form:form modelAttribute="requestEquipment" method="POST" >
            <spring:bind path="equipmentTypeCountList">
              <c:forEach items="${requestEquipment.equipmentTypeCountList}" var="item" varStatus="status">
                <div class="row">
                    <div class="col-xs-4">
                      <label>${item.name}</label>
                    </div>
                    <div class="col-xs-1">
                      <button>-</button>
                    </div>
                    <div class="col-xs-2">
                      <form:hidden path="equipmentTypeCountList[${status.index}].name"/>
                      <form:hidden path="equipmentTypeCountList[${status.index}].id"></form:hidden>
                      <form:input class = "form-control" path="equipmentTypeCountList[${status.index}].count"></form:input>
                    </div>
                    <div class="col-xs-1">
                      <button>+</button>
                    </div>
                </div>
              </c:forEach>
              <p class="alert-danger"><form:errors path="equipmentTypeCountList"/></p>
            </spring:bind>
        </div>


        <div class="col-md-6">
          <div class="row">
            <%--<div class="text-center">--%>
              <%--Выберите дату бронирования--%>
            <%--</div>--%>


            <div class=" col-xs-5">
              <label for="Date">День</label>
              <spring:bind path="date">
                <div id="Date">
                  <form:input type = "text" class = "form-control" path="date"></form:input>
                  <div></div>
                </div>
                <p class="alert-danger"><form:errors path="date"/></p>
              </spring:bind>
            </div>
            <div class="col-xs-5">
              <label for="chosenTime">Время</label>
              <spring:bind path="chosenTime">
                <form:select size="10" multiple = "true" path="chosenTime" class="form-control" id="chosenTime">
                  <form:options items="${requestEquipment.timeList}"></form:options>
                </form:select>
                <p class="alert-danger"><form:errors path="chosenTime"/></p>
              </spring:bind>
            </div>
          </div>
          <div class="col-xs-offset-8 col-xs-4">
            <form:button class="btn btn-default btn-md">Забронировать</form:button>
          </div>
        </div>
    </form:form>
    <form:form action="/clear-basket">
      <div class="col-xs-offset-3">
        <button type="submit" class="btn btn-default btn-md">Очистить корзину</button>
      </div>
    </form:form>
  </c:if>
    </div>
  </div>
  <!--мой вариант -->
  <div class="forFont">
    <div class="container" >

  </div>
  </div>
  </div>
  <%@include file="includes/footer.jsp" %>
  <script>
      $(document).ready(
          $('#Date input').datepicker({
              maxViewMode: 2,
              todayBtn: "linked",
              clearBtn: true,
              language: "ru",
              daysOfWeekDisabled: "0",
              todayHighlight: true,
              format: 'dd.mm.yyyy'
          })
      )
  </script>
</body>
</html>