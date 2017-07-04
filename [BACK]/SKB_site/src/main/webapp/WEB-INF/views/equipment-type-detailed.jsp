<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="title" value="${equipmentType.name}"/>

<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8"/>
    <meta name="description" content="">
    <meta name="author" content="">
    <title>${title}</title>
    <link rel="icon" href="${contextPath}/resources/images/logo.png">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/equipment_item.css">
</head>
<body>

  <div id="leftSide">
  </div>
  <div id="rightSide">
  </div>

  <%@include file="header.jsp" %>

  <spring:message code="${equipmentTypeDeleteSuccess}"/>
  ${equipmentAddedToBasketMsg}

  <!-- main-->
  <div class="container">
    <div class="row">
      <div class="col-xs-9" >
        <ul class="titleHead">
          <li><div class="smallBlueBox"></div></li>
          <li><h3>${title}</h3></li>
        </ul>
      </div>
      <div class="col-xs-3">
        <a href="/equipment-table-${equipmentType.id}" class="btn btn-primary" role="button">
          Просмотреть список устройств <span class="badge">${equipmentType.equipmentSet.size()}</span>
        </a>
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
        <form:form method="POST" modelAttribute="equipmentToBasket">
            <spring:bind path="id">
              <form:input path="id" value="${equipmentType.id}" cssStyle="visibility: hidden"/>
              <form:errors path="id"/>
            </spring:bind>
            <button type="submit" class="btn btn-primary">Добавить в корзину</button>
        </form:form>
        <a class="btn btn-lg btn-primary" href="/equipment-booking">
          Корзина <span class="badge">
              <c:if test="${empty basket}">0</c:if>
              <c:if test="${!empty basket}">${basket.size()}</c:if>
                </span>
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
  </c:if>

  <%@include file="footer.jsp" %>

  <script src="../../resources/js/jquery.min.js"></script>
  <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
  <script>window.jQuery</script>
  <script src="../../resources/js/tether.min.js"></script>
  <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>
</html>
