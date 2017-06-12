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
        <a href="/equipment-booking">
          <button type="button" class="btn btn-primary btn-lg btn-block">
            Добавить к бронированию
          </button>
        </a>
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

    <form:form method="POST" modelAttribute="equipment" action="/equipment-type-detailed${equipmentType.id}">
      <div class="form-group">
        <label class="control-label col-xs-3" for="equipmentNumber">Добавить новую модель</label>
        <spring:bind path="uniqueNumber">
          <div class="col-xs-9">
            <form:textarea path="uniqueNumber" placeholder="номер модели" class="form-control" id="equipmentNumber"></form:textarea>
            <form:errors path="uniqueNumber"></form:errors>
          </div>
        </spring:bind>
      </div>
      <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i>Добавить</button>
    </form:form>


  
  </c:if>

  <%@include file="footer.jsp" %>


  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
