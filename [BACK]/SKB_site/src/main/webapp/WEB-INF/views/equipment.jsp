<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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


  <%@include file="header.jsp" %>

<!-- main-->
<div class="container">

  <div class="row">
    <div class="col-xs-6" >
      <ul class="titleHead">
        <li><div class="smallBlueBox"></div></li>
        <li><h3>Оборудование</h3></li>
      </ul>
    </div>
    <div class="col-xs-offset-1 col-xs-3 col-sm-offset-3 col-xs-3">
        <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/add-equipment-type';" value="Добавить модель">
    </div>
  </div>

  <c:if test="${empty equipmentTypeList}">
    <h1>
      К сожалению на данный момент оборудования нет<br>
      :(</h1>
  </c:if>

  <c:if test="${!empty equipmentTypeList}">
    <c:forEach items="${equipmentTypeList}" var="item">
  <div class="row">
    <div class="col-xs-4" >
      <div class="item">
        <a href="/equipment-type-detailed?id=${item.id}">
          <div class="col-xs-6 hidden-xs">
              <img src="${item.photoPath}" alt="${item.name}Picture" width=100%>
              <div class="form-group">
                  <input type="button" class="btn btn-back btn-lg" onClick="self.location.href='/edit-equipment-type?id=${item.id}';" value="Редактировать">
                  <input type="button" class="btn btn-back btn-lg" onClick="(confirm('Вы уверены что хотите удалить модель?'))?self.location.href='/del-equipment-type?id=${item.id}':1/1;" value="Удалить">
              </div>
          </div>
          <div class="col-xs-6 hidden-xs">
            <p>${item.name}</p>
          </div>

          <div class="col-xs-12 visible-xs">
            <p>${item.name}</p>
          </div>
        </a>
      </div>
    </div>
  </div>
  </c:forEach>
  </c:if>


<!--end main-->

  <%@include file="footer.jsp" %>

    <script src="../../resources/js/jquery.min.js"></script>
    <script src="../../resources/js/jquery-3.1.1.slim.min.js"></script>
    <script>window.jQuery</script>
    <script src="../../resources/js/tether.min.js"></script>
    <script src="../../resources/bootstrap/js/bootstrap.js"></script>

</body>

</html>
